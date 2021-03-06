;;; -*- coding: utf-8-unix -*-
;;;
;;;Part of: Nausicaa/Scheme
;;;Contents: sub-interpreters implementation
;;;Date: Fri Jun 18, 2010
;;;
;;;Abstract
;;;
;;;
;;;
;;;Copyright (c) 2010 Marco Maggi <marco.maggi-ipsu@poste.it>
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
(library (nausicaa interps)
  (export

    &interp-error
    make-interp-error-condition
    interp-error-condition?
    condition-interp-error/interp

    <interp>			<interp>?
    <interp>-eval
    <interp>-variable-set!	<interp>-variable-ref

    ;; auxiliary syntaxes
    imports:)
  (import (nausicaa)
    (nausicaa interps variables)
    (nausicaa interps variable-events)
    (nausicaa language sentinel)
    (nausicaa language gensym)
    (rnrs eval))


;;;; helpers

(define undefined-variable
  (make-sentinel))


(define-condition &interp-error
  (parent &error)
  (fields interp))

(define-auxiliary-syntaxes
  imports:)


(define-class <interp>
  (nongenerative nausicaa:interps:<interp>)

  (fields (immutable table-of-variables)
	  (immutable eval-environment)
	  (immutable import-specs)
	  (immutable elet))

  (protocol (lambda (make-top)
	      (lambda (list-of-import-specs)
		(let (($elet (gensym)))
		  ((make-top) (make-eq-hashtable)
		   (apply environment
			  `(rename (nausicaa interps wrapper) (elet ,$elet))
			  list-of-import-specs)
		   list-of-import-specs
		   $elet)))))

  (maker ()
	 (imports: '((rnrs))))

  (methods eval variable-ref variable-set! clone))


(define (<interp>-eval (o <interp>) expr)

  (define-class <results>
    (nongenerative interps:<results>)
    (fields (immutable values)))

  (define (end-of-eval vals)
    (make <results> vals))

  (define-inline (raise-undefined-variable variable-name)
    (raise (condition
	    (make-who-condition '<interp>-eval)
	    (make-message-condition "attempt to access undefined variable in interpreter")
	    (make-interp-error-condition o)
	    (make-irritants-condition (list variable-name)))))

  (let ((R (with-exception-handler
	       (lambda (E)
		 (if (interp-error-condition? E)
		     E
		   (raise (condition E (make-interp-error-condition o)))))
	     (lambda ()
	       (let-values (((keys vals) (hashtable-entries o.table-of-variables)))
		 (eval `(,o.elet ,end-of-eval ,keys ,vals ,expr) o.eval-environment))))))
    (class-case R
      ((<results>)
       (apply values R.values))
      ((<variable-mutation>)
       (hashtable-set! o.table-of-variables R.name R.value)
       (R.kont))
      ((<variable-reference>)
       (R.kont
	(let ((value (hashtable-ref o.table-of-variables R.name undefined-variable)))
	  (if (eq? value undefined-variable)
	      (raise-undefined-variable R.name)
	    value))))
      (else
       (assertion-violation '<interp>-eval
	 "invalid return value from interp evaluation" R)))
    ))


(define (<interp>-variable-set! (o <interp>) variable-name variable-value)
  (hashtable-set! o.table-of-variables variable-name variable-value))

(define (<interp>-variable-ref  (o <interp>) variable-name default)
  (hashtable-ref o.table-of-variables variable-name default))

(define <interp>-clone
  (case-lambda
   ((o)
    (<interp>-clone o (lambda (k v x) v)))
   (((o <interp>) filter)
    (let (((c <interp>) (make <interp>
			  (imports: o.import-specs))))
      (receive (keys vals)
	  (hashtable-entries o.table-of-variables)
	(do ((i 0 (+ 1 i)))
	    ((= i (vector-length keys)))
	  (let* ((k (vector-ref keys i))
		 (v (filter k (vector-ref vals i) undefined-variable)))
	    (unless (eq? v undefined-variable)
	      (c.variable-set! k v)))))
      c))))


;;;; done

)

;;; end of file
