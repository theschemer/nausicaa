;;; -*- coding: utf-8-unix -*-
;;;
;;;Part of: Nausicaa/cURL
;;;Contents: compensated constructors
;;;Date: Fri Nov 20, 2009
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


(library (foreign net curl compensated)
  (export
    curl-easy-init/compensated
    curl-easy-duphandle/compensated
    curl-multi-init/compensated

    (rename (curl-easy-init/compensated		curl-easy-init/c)
	    (curl-easy-duphandle/compensated	curl-easy-duphandle/c)
	    (curl-multi-init/compensated	curl-multi-init/c)))
  (import (rnrs)
    (compensations)
    (foreign net curl))


(define (curl-easy-init/compensated)
  (letrec ((handle (compensate
		       (curl-easy-init)
		     (with
		      (curl-easy-cleanup handle)))))
    handle))

(define (curl-easy-duphandle/compensated orig)
  (letrec ((handle (compensate
		       (curl-easy-duphandle orig)
		     (with
		      (curl-easy-cleanup handle)))))
    handle))

(define (curl-multi-init/compensated)
  (letrec ((handle (compensate
		       (curl-multi-init)
		     (with
		      (curl-multi-cleanup handle)))))
    handle))


;;;; done

)

;;; end of file
