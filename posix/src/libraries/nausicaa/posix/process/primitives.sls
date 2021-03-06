;;; -*- coding: utf-8-unix -*-
;;;
;;;Part of: Nausicaa/POSIX
;;;Contents: marshaling interface to process functions
;;;Date: Wed Nov  4, 2009
;;;
;;;Abstract
;;;
;;;
;;;
;;;Copyright (c) 2009, 2010, 2011 Marco Maggi <marco.maggi-ipsu@poste.it>
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


(library (nausicaa posix process primitives)
  (export

    getpid			getppid
    fork			execv
    execve			execvp
    system

    waitpid			waitpid/any
    waitpid/any-my-group	waitpid/group


    integer-><process-term-status>

    ctermid		setsid		getsid
    getpgrp		setpgid
    tcgetpgrp		tcsetpgrp	tcgetsid)
  (import (rnrs)
    (nausicaa language extensions)
    (nausicaa language compensations)
    (only (nausicaa ffi pointers) pointer-null?)
    (only (nausicaa ffi peekers-and-pokers) pointer-ref-c-uint8)
    (only (nausicaa ffi memory) malloc-small/c malloc-block/c)
    (only (nausicaa ffi errno) raise-errno-error EINTR)
    (nausicaa ffi cstrings)
    (only (nausicaa posix sizeof) L_ctermid)
    (nausicaa posix typedefs)
    (prefix (nausicaa posix process platform) platform:))


;;;; inspection and forking

(define (getpid)
  (integer->pid (platform:getpid)))

(define (getppid)
  (integer->pid (platform:getppid)))

(define (fork)
  (receive (result errno)
      (platform:fork)
    (if (= -1 result)
	(raise-errno-error 'fork errno)
      (if (= 0 result)
	  #f
	(integer->pid result)))))


;;;; executing

(define (execv pathname args)
  (with-compensations
    (receive (result errno)
	(platform:execv (string->cstring/c pathname)
			(strings->argv args malloc-block/c))
      (when (= -1 result)
	(raise-errno-error 'execv errno (list pathname args))))))

(define (execve pathname args envs)
  (with-compensations
    (receive (result errno)
	(platform:execve (string->cstring/c pathname)
			 (strings->argv args malloc-block/c)
			 (strings->argv envs malloc-block/c))
      (when (= -1 result)
	(raise-errno-error 'execve errno (list pathname args envs))))))

(define (execvp pathname args)
  (with-compensations
    (receive (result errno)
	(platform:execvp (string->cstring/c pathname)
			 (strings->argv args malloc-block/c))
      (when (= -1 result)
	(raise-errno-error 'execvp errno (list pathname args))))))

(define (system command)
  (with-compensations
    (receive (result errno)
	(platform:system (string->cstring/c command))
      (when (= -1 result)
	(raise-errno-error 'system errno command))
      result)))


;;;; waiting

(define (integer-><process-term-status> status)
  (let-syntax ((bool (syntax-rules ()
		       ((_ ?form)
			(if ?form #t #f)))))
    (make-<process-term-status>
     (bool (platform:WIFEXITED status))
     (bool (platform:WEXITSTATUS status))
     (bool (platform:WIFSIGNALED status))
     (bool (platform:WTERMSIG status))
     (bool (platform:WCOREDUMP status))
     (bool (platform:WIFSTOPPED status))
     (bool (platform:WSTOPSIG status)))))

(define (%waitpid pid-int options)
  (with-compensations
    (let ((status* (malloc-small/c)))
      (let loop ()
	(receive (result errno)
	    (platform:waitpid pid-int status* options)
	  (when (= -1 result)
	    (when (= EINTR errno)
	      (loop))
	    (raise-errno-error 'waitpid errno (integer->pid pid-int)))
	  (values (integer->pid result)
		  (pointer-ref-c-uint8 status* 0)))))))

(define (waitpid pid options)
  (let ((pid-int (pid->integer pid)))
    (if (< 0 pid-int)
	(%waitpid pid-int options)
      (assertion-violation 'waitpid
	"expected strictly positive process id" pid))))

(define (waitpid/any options)
  (%waitpid -1 options))

(define (waitpid/any-my-group options)
  (%waitpid 0 options))

(define (waitpid/group gpid options)
  (%waitpid (- (pid->integer gpid)) options))


;;;; job control

(define (ctermid)
  (with-compensations
    (let ((p (malloc-block/c L_ctermid)))
      (receive (result errno)
	  (platform:ctermid p)
	(if (pointer-null? result)
	    (raise-errno-error 'ctermid errno)
	  (cstring->string p))))))

;;; --------------------------------------------------------------------

(define (setsid)
  (receive (result errno)
      (platform:setsid)
    (if (= -1 errno)
	(raise-errno-error 'setsid errno)
      (integer->pid result))))

(define (getsid pid)
  (receive (result errno)
      (platform:getsid (pid->integer pid))
    (if (= -1 errno)
	(raise-errno-error 'getsid errno pid)
      (integer->pid result))))

(define (getpgrp)
  (receive (result errno)
      (platform:getpgrp)
    (if (= -1 errno)
	(raise-errno-error 'getpgrp errno)
      (integer->pid result))))

(define (setpgid pid pgid)
  (receive (result errno)
      (platform:setpgid (pid->integer pid) (pid->integer pgid))
    (if (= -1 errno)
	(raise-errno-error 'setpgid errno (list pid pgid))
      result)))

;;; --------------------------------------------------------------------

(define (tcgetpgrp fd)
  (receive (result errno)
      (platform:tcgetpgrp (fd->integer fd))
    (if (= -1 errno)
	(raise-errno-error 'tcgetpgrp errno fd)
      (integer->pid result))))

(define (tcsetpgrp fd pgid)
  (receive (result errno)
      (platform:tcsetpgrp (fd->integer fd) (pid->integer pgid))
    (if (= -1 errno)
	(raise-errno-error 'tcsetpgrp errno (list fd pgid))
      result)))

(define (tcgetsid fd)
  (receive (result errno)
      (platform:tcgetsid (fd->integer fd))
    (if (= -1 errno)
	(raise-errno-error 'tcgetsid errno fd)
      (integer->pid result))))


;;;; done

)

;;; end of file
