;;;
;;;Part of: Uriel libraries
;;;Contents: Scheme language extensions
;;;Date: Mon Nov  3, 2008
;;;
;;;Abstract
;;;
;;;
;;;Copyright (c) 2008 Marco Maggi <marcomaggi@gna.org>
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


;;;; setup

(library (uriel lang)
  (export
    ;;simple syntaxes
    begin0 dotimes dolist loop-upon-list ensure

    ;;deferred exceptions
    with-deferred-exceptions-handler
    defer-exceptions run-deferred-exceptions-handler

    ;;compensations
    with-compensations with-compensations/on-error
    compensate run-compensations push-compensation

    ;;miscellaneous
    symbol->string/maybe

    ;;bindings from (receive-lib)
    receive

    ;;bindings from (parm-lib)
    make-parameter		parameterize

    ;;bindings from (format-lib)
    format)
  (import (r6rs)
    (receive-lib)
    (parm-lib)
    (format-lib))


;;;; simple sintaxes

;;;This  syntax  comes  from  the  R6RS original  document,  Appendix  A
;;;``Formal semantics''.
(define-syntax begin0
  (syntax-rules ()
    ((_ ?expr0 ?expr ...)
     (call-with-values
	 (lambda () ?expr0)
       (lambda x
	 ?expr ...
	 (apply values x))))))

(define-syntax dotimes
  (syntax-rules ()
    ((_ (?varname ?exclusive-count) ?form0 ?form ...)
     (dotimes (?varname ?exclusive-count #f) ?form0 ?form ...))
    ((_ (?varname ?exclusive-count ?result) ?form0 ?form ...)
     (do ((?varname 0 (+ 1 ?varname)))
	 ((>= ?varname ?exclusive-count)
	  ?result)
       ?form0 ?form ...))))

(define-syntax dolist
  (syntax-rules ()
    ((_ (?varname ?list) ?form0 ?form ...)
     (dolist (?varname ?list #f) ?form0 ?form ...))
    ((_ (?varname ?list ?result) ?form0 ?form ...)
     (let ((ell ?list))
       (let loop ((?varname (car ell))
		  (the-list (cdr ell)))
	 ?form0 ?form ...
	 (if (null? the-list)
	     ?result
	   (loop (car the-list) (cdr the-list))))))))

(define-syntax loop-upon-list
  (syntax-rules (break-when)
    ((_ (?varname ?list) (break-when ?condition) ?form0 ?form ...)
     (loop-upon-list (?varname ?list #f) (break-when ?condition) ?form0 ?form ...))
    ((_ (?varname ?list ?result) (break-when ?condition) ?form0 ?form ...)
     (let ((exit	(lambda () #f ?result))
	   (ell		?list))
       (let loop ((ell		(cdr ell))
		  (?varname	(car ell)))
	 (if ?condition
	     (exit)
	   (begin
	     ?form0 ?form ...
	     (if (null? ell)
		 (exit)
	       (loop (cdr ell) (car ell))))))))))

(define-syntax ensure
  (syntax-rules (by else else-by)
    ((_ ?condition
	(by ?by-form0 ?by-form ...)
	(else-by ?else-by-form0 ?else-by-form ...) ...
	(else ?else-form0 ?else-form ...))
     (let ((retval #f))
       (loop-upon-list
	   (expr (list (lambda () ?by-form0 ?by-form ...)
		       (lambda () ?else-by-form0 ?else-by-form ...)
		       ...
		       (lambda () ?else-form0 ?else-form ...))
		 retval)
	   (break-when ?condition)
	 (set! retval (expr)))))))

;;Define a macro with the function-like form.
;; (define-syntax define-as-syntax
;;   (syntax-rules ()
;;     ((_ (?name ?arg ...) ?form0 ?form ...)
;;      (define-syntax ?name
;;        (syntax-rules ()
;; 	 ((?name ?arg ...)
;; 	  ?form0 ?form ...))))))


;;;; deferred exceptions

(define deferred-exceptions
  (make-parameter #f))

(define deferred-exceptions-handler
  (make-parameter #f))

(define (run-deferred-exceptions-handler)
  (when (deferred-exceptions)
    (for-each
	(lambda (exc)
	  (guard (exc (else #f))
	    ((deferred-exceptions-handler) exc)))
      (deferred-exceptions))
    (deferred-exceptions '())))

(define-syntax defer-exceptions
  (syntax-rules ()
    ((_ ?form0 ?form ...)
     (guard (exc (else
		  (let ((e (deferred-exceptions)))
		    (and e (deferred-exceptions (cons exc e))))))
       ?form0 ?form ...))))

(define-syntax with-deferred-exceptions-handler
  (syntax-rules ()
    ((_ ?handler ?form0 ?form ...)
     (parameterize ((deferred-exceptions '())
		    (deferred-exceptions-handler ?handler))
       (dynamic-wind
	   (lambda () #f)
	   (lambda () ?form0 ?form ...)
	   (lambda () (run-deferred-exceptions-handler)))))))



;;;; compensations

(define compensations
  (make-parameter #f))

(define (run-compensations)
  (when (compensations)
    (for-each
	(lambda (closure)
	  (defer-exceptions
	    (closure)))
      (compensations))
    (compensations '())))

(define-syntax with-compensations/on-error
  (syntax-rules ()
    ((_ ?form0 ?form ...)
     (parameterize ((compensations '()))
       (with-exception-handler
	   (lambda (exc)
	     (run-compensations)
	     (raise exc))
	 (lambda ()
	   ?form0 ?form ...))))))

(define-syntax with-compensations
  (syntax-rules ()
    ((_ ?form0 ?form ...)
     (parameterize ((compensations '()))
       (dynamic-wind
	   (lambda () #f)
	   (lambda () ?form0 ?form ...)
	   (lambda () (run-compensations)))))))

(define-syntax push-compensation
  (syntax-rules ()
    ((_ ?release0 ?release ...)
     (begin
       (compensations (cons (lambda () ?release0 ?release ...)
			    (compensations)))))))

(define-syntax compensate
  (syntax-rules (begin with)
    ((_ (begin ?alloc0 ?alloc ...) (with ?release0 ?release ...))
     (begin0
	 (begin ?alloc0 ?alloc ...)
       (push-compensation ?release0 ?release ...)))

    ((_ (begin ?alloc0 ?alloc ...) ?allocn ?form ...)
     (compensate (begin ?alloc0 ?alloc ... ?allocn) ?form ...))

    ((_ ?alloc ?form ...)
     (compensate (begin ?alloc) ?form ...))))


;;;; miscellaneous

(define (symbol->string/maybe thing)
  (if (symbol? thing)
      (symbol->string thing)
    (begin
      (unless (string? thing)
	(assertion-violation 'symbol->string/maybe
	  "expected symbol or string" thing))
      thing)))



;;;; done

)

;;; end of file
