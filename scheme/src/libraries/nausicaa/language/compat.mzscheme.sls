;;; -*- coding: utf-8-unix -*-
;;;
;;;Part of: Nausicaa/Scheme
;;;Contents: compatibility library for Racket
;;;Date: Mon Apr  4, 2011
;;;
;;;Abstract
;;;
;;;
;;;
;;;Copyright (c) 2010, 2011 Marco Maggi <marco.maggi-ipsu@poste.it>
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


#!r6rs
(library (nausicaa language compat)
  (export
    * rational-valued? max
    (rename (getenv get-environment-variable))
    get-environment-variables)
  (import (except (rnrs) *)
    (prefix (only (rnrs) *) rnrs.)
    (only (racket base) getenv)
    (nausicaa language unimplemented))
  (define (get-environment-variables)
    (raise-unimplemented-error 'get-environment-variables))
  (define *
    (case-lambda
     (()	1)
     ((n)	n)
     ((n m)
      (cond ((or (nan? (real-part n))
		 (nan? (imag-part n)))
	     +nan.0)
	    ((or (nan? (real-part m))
		 (nan? (imag-part m)))
	     +nan.0)
	    (else
	     (rnrs.* n m))))
     ((n m . args)
      (* n (apply * m args)))))

  )

;;; end of file
