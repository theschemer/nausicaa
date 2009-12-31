;;; -*- coding: utf-8-unix -*-
;;;
;;;Part of: Nausicaa/POSIX
;;;Contents: marshaling functions for glibc system inspection
;;;Date: Tue Dec 15, 2009
;;;
;;;Abstract
;;;
;;;
;;;
;;;Copyright (c) 2009 Marco Maggi <marco.maggi-ipsu@poste.it>
;;;
;;;This program is free software:  you can redistribute it and/or modify
;;;it under the terms of the  GNU General Public License as published by
;;;the Free Software Foundation, either version 3 of the License, or (at
;;;your option) any later version.
;;;
;;;This program is  distributed in the hope that it  will be useful, but
;;;WITHOUT  ANY   WARRANTY;  without   even  the  implied   warranty  of
;;;MERCHANTABILITY  or FITNESS FOR  A PARTICULAR  PURPOSE.  See  the GNU
;;;General Public License for more details.
;;;
;;;You should  have received  a copy of  the GNU General  Public License
;;;along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;;


(library (glibc system primitives)
  (export
    setfsent		endfsent
    getfsent		getfsspec		getfsfile
    setmntent		endmntent
    getmntent		addmntent

    unsetenv		(rename (platform:clearenv clearenv))
    putenv		putenv*

    pointer-><struct-fstab>
    pointer-><struct-mntent>	<struct-mntent>->pointer
    )
  (import (rnrs)
    (receive)
    (compensations)
    (only (strings) string-index)
    (foreign memory)
    (foreign cstrings)
    (foreign errno)
    (only (foreign ffi peekers-and-pokers) pointer-set-c-signed-char!)

    (posix sizeof)
    (posix typedefs)
    (prefix (glibc system platform) platform:))


;;;; reading fstab

(define (pointer-><struct-fstab> fstab*)
  (make-<struct-fstab> (cstring->string (struct-fstab-fs_spec-ref fstab*))
		       (cstring->string (struct-fstab-fs_file-ref fstab*))
		       (cstring->string (struct-fstab-fs_vfstype-ref fstab*))
		       (cstring->string (struct-fstab-fs_mntops-ref fstab*))
		       (cstring->string (struct-fstab-fs_type-ref fstab*))
		       (struct-fstab-fs_freq-ref fstab*)
		       (struct-fstab-fs_passno-ref fstab*)))


(define (setfsent)
  (let ((result (platform:setfsent)))
    (if (= 0 result)
	(error 'setfsent "error initialising fstab file iteration")
      result)))

(define (endfsent)
  (let ((result (platform:endfsent)))
    (if (= 0 result)
	(error 'endfsent "error finalising fstab file iteration")
      result)))

(define (getfsent)
  (with-compensations
    (let ((fstab* (platform:getfsent)))
      (if (pointer-null? fstab*)
	  #f
	(pointer-><struct-fstab> fstab*)))))

(define (getfsspec spec)
  (with-compensations
    (let ((fstab* (platform:getfsspec (string->cstring/c spec))))
      (if (pointer-null? fstab*)
	  #f
	(pointer-><struct-fstab> fstab*)))))

(define (getfsfile file)
  (with-compensations
    (let ((fstab* (platform:getfsfile (string->cstring/c file))))
      (if (pointer-null? fstab*)
	  #f
	(pointer-><struct-fstab> fstab*)))))


;;;; reading mtab

(define (pointer-><struct-mntent> mntent*)
  (make-<struct-mntent> (cstring->string (struct-mntent-mnt_fsname-ref mntent*))
			(cstring->string (struct-mntent-mnt_dir-ref mntent*))
			(cstring->string (struct-mntent-mnt_type-ref mntent*))
			(cstring->string (struct-mntent-mnt_opts-ref mntent*))
			(struct-mntent-mnt_freq-ref mntent*)
			(struct-mntent-mnt_passno-ref mntent*)))

(define (<struct-mntent>->pointer mntent malloc)
  (let ((mntent* (malloc sizeof-mntent)))
    (struct-mntent-mnt_fsname-set! mntent* (string->cstring (<struct-mntent>-fsname mntent) malloc))
    (struct-mntent-mnt_dir-set!    mntent* (string->cstring (<struct-mntent>-dir mntent)    malloc))
    (struct-mntent-mnt_type-set!   mntent* (string->cstring (<struct-mntent>-type mntent)   malloc))
    (struct-mntent-mnt_opts-set!   mntent* (string->cstring (<struct-mntent>-opts mntent)   malloc))
    (struct-mntent-mnt_freq-set!   mntent* (<struct-mntent>-freq mntent))
    (struct-mntent-mnt_passno-set! mntent* (<struct-mntent>-passno mntent))
    mntent*))


(define (setmntent file-name open-mode)
  (with-compensations
    (receive (file* errno)
	(platform:setmntent (string->cstring/c file-name)
			    (string->cstring/c open-mode))
      (if (pointer-null? file*)
	  (raise-errno-error 'setmntent errno (list file-name open-mode))
	(pointer->FILE* file*)))))

(define (endmntent stream)
  (when (= 0 (platform:endmntent (FILE*->pointer stream)))
    (error 'endmntent "error finalising mtab file iteration" stream)))

(define (getmntent stream)
  (with-compensations
    (let* ((mntent*	(malloc-block/c sizeof-mntent))
	   (buf.len	4096) ;let's try to play it safe
	   (buf.ptr	(malloc-block/c buf.len)))
      (let ((result* (platform:getmntent_r (FILE*->pointer stream) mntent* buf.ptr buf.len)))
	(if (pointer-null? result*)
	    #f
	  (pointer-><struct-mntent> mntent*))))))

(define (addmntent stream mntent)
  (with-compensations
    (receive (result errno)
	(platform:addmntent (FILE*->pointer stream) (<struct-mntent>->pointer mntent malloc-block/c))
      (if (= 0 result)
	  result
	(raise-errno-error 'addmntent errno (list stream mntent))))))


;;;; environment variables

(define (unsetenv name)
  (with-compensations
    (platform:unsetenv (string->cstring/c name))))

(define (%normalise s)
  (if (symbol? s)
      (symbol->string s)
    s))

(define (putenv assignment)
  (let ((s (%normalise assignment)))
    (if (string-index s #\=)
	(platform:putenv (string->cstring s malloc))
      (assertion-violation 'putenv
	"missing equal sign in process' environment variable assignment"
	assignment))))

(define (putenv* name value)
  (putenv (string-append (%normalise name) "=" (%normalise value))))


;;;; done

)

;;; end of file