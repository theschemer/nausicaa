;;; -*- coding: utf-8 -*-
;;;
;;;Part of: Nausicaa/Scheme
;;;Contents: test class virtual methods
;;;Date: Sat Oct  2, 2010
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


(import (nausicaa)
  (rnrs eval)
  (nausicaa checks))

(check-set-mode! 'report-failed)
(display "*** testing class virtual methods\n")


(parametrise ((check-test-name	'basic))

  (define-class <alpha>
    (fields a)
    (methods the-a the-b the-c))

  (define-virtual-method <alpha> the-a
    (lambda ((o <alpha>))
      (+ 1 o.a)))

  (define-virtual-method <alpha> the-b)

  (define-virtual-method <alpha> the-c
    (lambda ((o <alpha>))
      'alpha))

  (define-class <beta>
    (inherit <alpha>)
    (methods the-b the-c))

  (define-virtual-method <beta> the-b
    ;;Provides the implementation for both <alpha> and <beta>.
    (lambda ((o <alpha>))
      (+ 10 o.a)))

  (define-virtual-method <beta> the-c
    ;;Overrides the implementation of <alpha>.
    (lambda ((o <beta>))
      'beta))

  ;; <alpha> methods

  (check
      (let (((o <alpha>) (make <alpha> 2)))
	(o.the-a))
    => 3)

  (check
      (guard (E ((syntax-violation? E)
;;;(write (condition-message E))(newline)
		 #t)
		(else
;;;(write (condition-message E))(newline)
		 #f))
	(let (((o <alpha>) (make <alpha> 2)))
	  (o.the-b)))
    => #t)

  (check
      (let (((o <alpha>) (make <alpha> 2)))
	(o.the-c))
    => 'alpha)

  ;; <beta> methods

  (check
      (let (((o <beta>) (make <beta> 2)))
	(o.the-a))
    => 3)

  (check
      (let (((o <beta>) (make <beta> 2)))
	(o.the-b))
    => 12)

  (check
      (let (((o <beta>) (make <beta> 2)))
	(o.the-c))
    => 'beta)

  (check	;A  <beta> object  seen as  <alpha> object  provides the
		;virtual method implementation.
      (let (((o <alpha>) (make <beta> 2)))
	(o.the-c))
    => 'beta)

  #t)


(parametrise ((check-test-name	'alternate))

;;;alternate macro syntax

  (define-class <alpha>
    (fields a)
    (methods the-a the-b the-c))

  (define-virtual-method <alpha> the-a
    (lambda ((o <alpha>))
      (+ 1 o.a)))

  (define-virtual-method <alpha> the-b)

  (define-virtual-method <alpha> (the-c (o <alpha>))
    'alpha)

  (define-class <beta>
    (inherit <alpha>)
    (methods the-b the-c))

  ;;Provides the implementation for both <alpha> and <beta>.
  (define-virtual-method <beta> (the-b (o <alpha>))
    (+ 10 o.a))

  ;;Overrides the implementation of <alpha>.
  (define-virtual-method <beta> (the-c (o <beta>))
    'beta)

  ;; <alpha> methods

  (check
      (let (((o <alpha>) (make <alpha> 2)))
	(o.the-a))
    => 3)

  (check
      (guard (E ((syntax-violation? E)
;;;(write (condition-message E))(newline)
		 #t)
		(else
;;;(write (condition-message E))(newline)
		 #f))
	(let (((o <alpha>) (make <alpha> 2)))
	  (o.the-b)))
    => #t)

  (check
      (let (((o <alpha>) (make <alpha> 2)))
	(o.the-c))
    => 'alpha)

  ;; <beta> methods

  (check
      (let (((o <beta>) (make <beta> 2)))
	(o.the-a))
    => 3)

  (check
      (let (((o <beta>) (make <beta> 2)))
	(o.the-b))
    => 12)

  (check
      (let (((o <beta>) (make <beta> 2)))
	(o.the-c))
    => 'beta)

  (check	;A  <beta> object  seen as  <alpha> object  provides the
		;virtual method implementation.
      (let (((o <alpha>) (make <beta> 2)))
	(o.the-c))
    => 'beta)

  #t)


(parametrise ((check-test-name	'defmethod))

  (let ()

    (define-class <alpha>
      (fields a)
      (methods the-a the-b the-c))

    (defmethod <alpha> (the-a n)
      (+ n a))

    (define-virtual-method <alpha> the-b)

    (defmethod-virtual <alpha> (the-c)
      'alpha)

    (define-class <beta>
      (inherit <alpha>)
      (methods the-b the-c))

    ;;Provides the implementation for both <alpha> and <beta>.
    (defmethod-virtual <beta> (the-b)
      (+ 10 a))

    ;;Overrides the implementation of <alpha>.
    (defmethod-virtual <beta> (the-c)
      (list (the-a 3) 'beta))

    ;; <alpha> methods

    (check
    	(let (((o <alpha>) (make <alpha> 2)))
    	  (o.the-a 1))
      => 3)

    (check
    	(guard (E ((syntax-violation? E)
;;;(write (condition-message E))(newline)
    		   #t)
    		  (else
;;;(write (condition-message E))(newline)
		   #f))
    	  (let (((o <alpha>) (make <alpha> 2)))
    	    (o.the-b)))
      => #t)

    (check
    	(let (((o <alpha>) (make <alpha> 2)))
    	  (o.the-c))
      => 'alpha)

    ;; <beta> methods

    (check
    	(let (((o <beta>) (make <beta> 2)))
    	  (o.the-a 1))
      => 3)

    (check
    	(let (((o <beta>) (make <beta> 2)))
    	  (o.the-b))
      => 12)

    (check
    	(let (((o <beta>) (make <beta> 2)))
    	  (o.the-c))
      => '(5 beta))

    (check	;A  <beta> object  seen as  <alpha> object  provides the
    		;virtual method implementation.
    	(let (((o <alpha>) (make <beta> 2)))
    	  (o.the-c))
      => '(5 beta))

    #f)

  #t)


(parametrise ((check-test-name	'errors))

  (check ;try to call an unimplemented virtual method
      (guard (E ((syntax-violation? E)
;;;(write (condition-message E))(newline)
		 #t)
		(else #f))
	(eval '(let ()
		 (define-class <alpha>
		   (fields a)
		   (methods the-a))

		 (define-virtual-method <alpha> the-a)

		 (let (((o <alpha>) (make <alpha> 2)))
		   (o.the-a)))
	      (environment '(nausicaa))))
    => #t)

  #t)


;;;; done

(check-report)

;;; end of file
