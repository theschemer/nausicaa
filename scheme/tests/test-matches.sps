;;;
;;;Part of: Nausicaa/Scheme
;;;Contents: tests for (nausicaa matches)
;;;Date: Sat Aug 29, 2009
;;;
;;;Abstract
;;;
;;;
;;;
;;;Copyright (c) 2009-2011 Marco Maggi <marco.maggi-ipsu@poste.it>
;;;Copyright (c) 2006, 2007 Alex Shinn
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
(import (nausicaa)
  (nausicaa checks)
  (for (only (nausicaa language syntax-utilities) unwrap) expand)
  (for (prefix (libtest matches-auxiliary-syntaxes) ax.) run (meta -1))
  (rnrs eval))

(check-set-mode! 'report-failed)
(display "*** testing matches\n")

(debugging #t)

(define-syntax catch-error
  (syntax-rules ()
    ((_ ?body)
     (guard (E ((irritants-condition? E)
		`((message   ,(condition-message E))
		  (irritants ,(condition-irritants E))))
	       (else
		#t))
       ?body))))

(define-syntax catch-syntax-error
  (syntax-rules ()
    ((_ ?body)
     (guard (E ((syntax-violation? E)
		`((message	,(condition-message E))
		  (form		,(syntax-violation-form E))
		  (subform	,(syntax-violation-subform E))))
	       (else
		(debug-print-condition "syntax:" E)
		E))
       (eval (quote ?body)
	     (environment '(nausicaa)))))))

(define-syntax catch-mismatch-error
  (syntax-rules ()
    ((_ ?body)
     (guard (E (else `((message   ,(condition-message E))
		       (expr      ,(condition-match-mismatch/expression E)))))
       ?body))))


(parametrise ((check-test-name 'errors))

  (check
      (catch-syntax-error (match))
    => '((message	"missing match expression")
	 (form		(match))
	 (subform	#f)))

  (check
      (catch-syntax-error (match 123))
    => '((message "at least one match clause is required")
	 (form    (match 123))
	 (subform #f)))

  (check
      (catch-mismatch-error (match 28 (29 'ok)))
    => '((message "no matching pattern")
	 (expr    28)))

  (check
      (catch-syntax-error (match 28 (28 (=> fail))))
    => '((message "no body in match clause")
	 (form    (match 28 (28 (=> fail))))
	 (subform (28 (=> fail)))))

  (check
      (catch-syntax-error (match 28
			    ((a ... b ... c)
			     'fail)))
    => '((message	"multiple ellipsis patterns not allowed at same level")
	 (form		(a ... b ... c))
	 (subform	#f)))

  (check
      (catch-syntax-error (match 28
			    ((a ... b ...)
			     'fail)))
    => '((message	"multiple ellipsis patterns not allowed at same level")
	 (form		(a ... b ...))
	 (subform	#f)))

  (check
      (catch-syntax-error (match 28 (28)))
    => '((message	"no body in match clause")
	 (form		(match 28 (28)))
	 (subform	(28))))

  #t)


(parametrise ((check-test-name 'expressions))

  (check
      (let ((expr 123))
  	(match expr
  	  (_ 'ok)))
    => 'ok)

  (check
    (let* ((count 0)
	   (b (lambda ()
		(set! count (+ 1 count))
		2)))
      (let ((result (match (b)
		      (_ 'ok))))
	(cons result count)))
    => '(ok . 1))

  (check
    (let* ((count 0)
	   (b (lambda ()
		(set! count (+ 1 count))
		2)))
      (let ((result (match `,(b)
		      (_ 'ok))))
	(cons result count)))
    => '(ok . 1))

  (check
    (let* ((count 0)
	   (b (lambda ()
		(set! count (+ 1 count))
		2)))
      (let ((result (match (quasiquote ,(b))
		      (_ 'ok))))
	(cons result count)))
    => '(ok . 1))

  (check
    (let* ((count 0)
	   (b (lambda ()
		(set! count (+ 1 count))
		2)))
      (let ((result (match (quasiquote (,(b)))
		      (_ 'ok))))
	(cons result count)))
    => '(ok . 1))

  (check
    (let* ((a 1)
	   (count 0)
	   (b (lambda ()
;;;(write 'in)(newline)
		(set! count (+ 1 count))
		2)))
;;;(write count)(newline)
      (let ((result (match (quasiquote (,a ,(b) 3))
		      (_ 'ok))))
	(cons result count)))
    => '(ok . 1))

  #t)


(parametrise ((check-test-name 'wildcard))

  (check
      (match 'any (_ 'ok))
    => 'ok)

  (check
      (match '(1 2)
	((_ _)
	 'ok))
    => 'ok)

  #t)


(parametrise ((check-test-name 'variables))

  (check
      (match 'ok (x x))
    => 'ok)

  (check
      (match '_ (x x))
    => '_)

  (check
      (match '___ (x x))
    => '___)

  (check
      (match '... (x x))
    => '...)

  (check
      (let ((f (lambda args
		 (match args (x x)))))
	(f 1))
    => '(1))

  (check
      (let ((f (lambda (a)
		 (match a (x x)))))
	(f 1))
    => 1)

  (check
      (match '(1 2 3)
	(alpha (list alpha alpha alpha)))
    => '((1 2 3) (1 2 3) (1 2 3)))

  (check	;duplicate symbols pass
      (match '(ok . ok)
	((x . x) x))
    => 'ok)

  (check	;duplicate symbols fail
      (match '(ok . bad)
	((x . x) 'bad)
	(else    'ok))
    => 'ok)

  #t)


(parametrise ((check-test-name 'literals))

  (check
      (match 28
	(#t 'ok)
	(_  'fail))
    => 'ok)

  (check
      (match #t
	(#t 'ok)
	(_  'fail))
    => 'ok)

  (check
      (match #f
	(#f 'ok)
	(_  'fail))
    => 'ok)

  (check	;number
      (match 28 (28 'ok))
    => 'ok)

  (check	;string
      (match "good"
	("bad" 'fail)
	("good" 'ok))
    => 'ok)

  (check	;string
      (match "bad"
	("bad" 'bad)
	("good" 'ok))
    => 'bad)

  (check	;literal symbol
      (match 'good
	('bad 'fail)
	('good 'ok))
    => 'ok)

  #t)


(parametrise ((check-test-name 'lists))

  (check	;null
      (match '()
	(() 'ok))
    => 'ok)

  (check	;pair
      (match '(ok)
	((x) x))
    => 'ok)

  (check	;list
      (match '(alpha (beta (delta 123)))
	((alpha (beta (delta x))) x))
    => 123)

  #t)


(parametrise ((check-test-name 'quoted))

  (check	;quoted sexp
      (match '(alpha (beta (delta 123)))
	('(alpha (beta (delta 123))) 1))
    => 1)

  (check	;quoted symbols
      (match '(alpha (beta (delta 123)))
  	(('alpha ('beta ('delta x))) x))
    => 123)

  (check	;sexp
      (match '(alpha (beta (delta 123)))
  	(('alpha (:or ('beta ('delta x))
		      ('gamma ('delta x)))) x))
    => 123)

  (check	;sexp
      (match '(alpha (gamma (delta 123)))
  	(('alpha (:or ('beta ('delta x))
		      ('gamma ('delta x)))) x))
    => 123)

  #t)


(parametrise ((check-test-name 'vectors))

;;; unquoted vectors are automatically quoted by MATCH

  (check
      (match #()
	(#() 'ok))
    => 'ok)

  (check
      (match #(ok)
	(#(x) x))
    => 'ok)

  (check
      (match #(ok)
  	(#(x) x))
    => 'ok)

  (check
      (match #(1 2 3 4)
	(#(x ...) x))
    => '(1 2 3 4))

  (check
      (match #(1 2 3 4)
	(#(1 2 3 4) 'ok))
    => 'ok)

  (check
      (match 1
	(#(1 2 3 4)	'ok)
	(_		'fail))
    => 'fail)

  (check
      (match #(1 2)
	(#(1 2 3 4)	'ok)
	(_		'fail))
    => 'fail)

  #t)


(parametrise ((check-test-name 'records))

  (define-record-type color
    (fields (immutable red)
	    (immutable green)
	    (immutable blue)))

  (check
      (match (make-color 1 2 3)
	((:predicate color?)
	 'ok)
	(_
	 'fail))
    => 'ok)

  (check
      (match (make-color 1 2 3)
  	((:predicate color? (:accessor color-red x))
  	 x))
    => 1)

  (check
      (match (make-color 1 2 3)
  	((:predicate color?
  		     (:accessor color-red   x)
  		     (:accessor color-green y)
  		     (:accessor color-blue  z))
  	 (list x y z)))
    => '(1 2 3))

  (check
      (match (make-color 1 2 3)
  	((:predicate color?
  		     (:accessor color-red (:predicate zero?))) 'ok)
  	(_ 'fail))
    => 'fail)

  #t)


(parametrise ((check-test-name 'logic))

  (check	;and empty
      (match '(o k)
	((:and) 'ok))
    => 'ok)

  (check	;and single
      (match 'ok
	((:and x) x))
    => 'ok)

  (check	;and double
      (match 'ok
	((:and (:predicate symbol?) y)
	 'ok))
    => 'ok)

;;; --------------------------------------------------------------------

  (check	;or empty
      (match '(o k)
	((:or) 'fail)
	(else 'ok))
    => 'ok)

  (check	;or single
      (match 'ok
	((:or x) 'ok))
    => 'ok)

  (check	;or double
      (match 'ok
	((:or (:predicate symbol? y)
	      y)
	 y))
    => 'ok)

  (check
      (match 123
	((:or (:predicate integer? x)
	      (:predicate symbol?  x))
	 x))
    => 123)

  (check
      (match 'ok
	((:or (:predicate integer? x)
	      (:predicate symbol?  x))
	 x))
    => 'ok)

  (check
      (match "ok"
	((:or (:predicate integer? x)
	      (:predicate symbol?  x)
	      (:predicate string?  x))
	 x))
    => "ok")

  (check
      (guard (E (else #t))
	(eval '(match 123
		 ((:or (:predicate integer? x)
		       (:predicate symbol?  y))
		  y))
	      (environment '(nausicaa))))
    => #t)

  (check
      (guard (E (else #t))
	(eval '(match 123
		 ((:or (:predicate integer? x)
		       (:predicate symbol?  y))
		  x))
	      (environment '(nausicaa))))
    => #t)

;;; --------------------------------------------------------------------

  (check	;not
      (match 28
	((:not (a . b)) 'ok))
    => 'ok)

  (check	;not
      (match 28
	((:not 28) 'fail)
	(_        'ok))
    => 'ok)

  (check
      (match 123
	((:not (:predicate symbol?))
	 'ok))
    => 'ok)

  (check
      (guard (E (else #t))
	(eval '(match 123
		 ((:not (:predicate symbol? x))
		  x)) ; unbound identifier
	      (environment '(nausicaa))))
    => #t)

  (check
      (catch-syntax-error (match '()
			    ((:not) 'fail)))
    => '((message	"empty :NOT form in pattern")
	 (form		(:not))
	 (subform	#f)))

  #t)


(parametrise ((check-test-name 'predicates))

  (check	;pred
      (match 28
	((:predicate number?) 'ok))
    => 'ok)

  (check
      (match 28
	((:predicate number? x)
	 (+ 1 x)))
    => 29)

  (check
      (match 28
	((:predicate number? (:predicate integer? x))
	 (+ 1 x)))
    => 29)

  (check
      (match 28
	((:predicate number? x y z)
	 (list x y z)))
    => '(28 28 28))

  #t)


(parametrise ((check-test-name 'proc))

  (check
      (let ((f (lambda (x) (+ 1 x))))
	(match 1
	  ((:accessor f x) 'ok)))
    => 'ok)

  (check
      (match 1
	((:accessor (lambda (x) (+ 1 x)) x)
	 x)
	(y y))
    => 2)

  #t)


(parametrise ((check-test-name 'quasiquote))

  (check
      (let ((x 1))
	(match 1
	  (`,x 'ok)
	  (_   'fail)))
    => 'ok)

  (check
      (let ((x 2))
	(match '(1 2 3)
	  ((_ `,x y) y)
	  (_         'fail)))
    => 3)

  (check
      (let ((x 10))
	(match '(1 2 3)
	  ((_ `,(- x 8) y)
	   y)
	  (_
	   'fail)))
    => 3)

  (check
      (let ((x '(2 3)))
	(match '(1 2 3 4)
	  (`(1 ,@x 4)	'ok)
	  (_		'fail)))
    => 'ok)

  (check
      (let ((pred number?))
	(match 28
	  ((:predicate `,pred) 'ok)))
    => 'ok)

  (check
      (let ((f (lambda (x) (+ 1 x))))
	(match 2
	  ((:accessor `,f x) x)))
    => 3)

  #t)


(parametrise ((check-test-name 'expand))

  (check	;verify that  a pattern which  resembles a macro  use is
		;not expanded
      (let-syntax ((it (syntax-rules ()
			 ((_ ?var)
			  (_ ?var _)))))
	(match '(1 2 3)
	  ((it x) x)
	  (_      'fail)))
    => 'fail)

  #t)


(parametrise ((check-test-name 'ellipses))

  (check
      (match '()
	((x ...)
	 x))
    => '())

  (check
      (match '(a b c d)
	((x ...)
	 x))
    => '(a b c d))

  (check
      (match '(a b c d)
	((x y ...)
	 (list x y)))
    => '(a (b c d)))

  (check
      (catch-syntax-error (match '#(a b c d)
			    (#( ...)
			     x)))
    => '((message	"ellipsis not allowed as single, vector pattern value")
	 (form		#(...))
	 (subform	#f)))

  (check
      (match '#(a b c d)
	(#(x ...)
	 x))
    => '(a b c d))

  (check
      (match '#(a b c d)
	(#(x y ...)
	 (list x y)))
    => '(a (b c d)))

  (check
      (match '#(a b c d)
	(#(x y z ...)
	 (list x y z)))
    => '(a b (c d)))

  (check
      (match '#(a b 1 2)
	(#(x y (:predicate exact? z) ...)
	 (list x y z)))
    => '(a b (1 2)))

  (check
      (match '(a b c d)
	((x ... y)
	 (list x y)))
    => '((a b c) d))

  (check
      (match '(a b c d)
	((x ... y z)
	 (list x y z)))
    => '((a b) c d))

  (check
      (match '(a b c d)
	((x ... y z w)
	 (list x y z w)))
    => '((a) b c d))

  (check
      (match '(a b c d)
	((x ... y z w v)
	 (list x y z w v)))
    => '(() a b c d))

  (check
      (match '(a b c d)
	((x ... (y ...))
	 (list x y)))
    => '((a b c) d))

  (check
      (match '(a b (c d))
	((x ... (y ...))
	 (list x y)))
    => '((a b) (c d)))

  (check
      (match '(a b #(c d))
	((x ... #(y ...))
	 (list x y)))
    => '((a b) (c d)))

  ;;FIXME  Currently ellipsis  are allowed  only  as last  element in  a
  ;;pattern vector.
  ;;
  ;;   (check
  ;;       (match '#(a b #(c d))
  ;; 	     (#(x ... #(y ...))
  ;; 	      (list x y)))
  ;;     => '((a b) (c d)))

  (check
      ;;The "x"  in the  body is  bound to the  *list* of  elements that
      ;;matched "x" in the pattern.
      (match '((a . 1)
  	       (b . 2)
  	       (c . 3))
	(((x . y) ...)
	 (list x y)))
    => '((a b c)
	 (1 2 3)))

  (check
      (match '#(1 2 3 (a . 1) (b . 2) (c . 3))
	(#(a b c (hd . tl) ...)
	 (list a b c hd tl)))
    => '(1 2 3 (a b c) (1 2 3)))

  (check
      (match '(1 2 3)
	(((:predicate odd? n) ...) ;does not match, not all odd
	 n)
	(((:predicate even? n) ...) ;does not match, not all even
	 n)
	(((:predicate number? n) ...) ;does match, all numbers
	 n))
    => '(1 2 3))

  #t)


(parametrise ((check-test-name 'continuation))

  (check
      (match '(1 2)
	((a . b)
	 (=> next)
	 (if (even? a) 'fail (next)))
	((a . b)
	 'ok))
    => 'ok)

  (check
      (match 3
	((:predicate positive? x)
	 (=> next)
	 (if (even? x)
	     x
	   (next)))
	(_ 0))
    => 0)

  #t)


(parametrise ((check-test-name 'extensions))

  (check
      (match-let ()
	1)
    => 1)

  (check
      (match-let ((x 1))
	x)
    => 1)

  (check	;binds _ as a normal variable
      (match-let ((_ 1))
	_)
    => 1)

  (check	;uses _ as the wildcard pattern
      (match-let (((_) '(1)))
	'ok)
    => 'ok)

  (check
      (match-let ((x 'ok)
		  (y '(o k)))
	y)
    => '(o k))

  (check
      (match-let (((x . y) '(1 . 2))
		  (z       3))
	(list x y z))
    => '(1 2 3))

  (check
      (match-let (((:predicate number?  x) 1)
		  ((:predicate integer? y) 2))
	x)
    => 1)

;;; --------------------------------------------------------------------

  (check
      (match-let* ()
	1)
    => 1)

  (check
      (match-let* ((x 1))
	x)
    => 1)

  (check	;binds _ as a normal variable
      (match-let* ((_ 1))
	1)
    => 1)

  (check
      (match-let* ((x 'ok)
		   (y '(o k)))
	y)
    => '(o k))

  (check
      (match-let* (((x . y) '(1 . 2))
		   (z       3))
	(list x y z))
    => '(1 2 3))

  (check
      (match-let* (((:predicate number?  x) 1)
		   ((:predicate integer? y) 2))
	x)
    => 1)

  (check
      (match-let* ((x 'f)
		   (y 'o)
		   ((z w) (list y x)))
	(list x y z w))
    => '(f o o f))

;;; --------------------------------------------------------------------

  (check
      (match-letrec ()
		    1)
    => 1)

  (check
      (match-letrec ((x 1))
		    x)
    => 1)

  (check	;binds _ as a normal variable
      (match-letrec ((_ 1))
		    1)
    => 1)

  (check
      (match-letrec ((x 'ok)
		     (y '(o k)))
		    y)
    => '(o k))

  (check
      (match-letrec (((x . y) '(1 . 2))
		     (z       3))
		    (list x y z))
    => '(1 2 3))

  (check
      (match-letrec (((:predicate number?  x) 1)
		     ((:predicate integer? y) 2))
		    x)
    => 1)

;;; --------------------------------------------------------------------

  (check
      (let ((f (match-lambda ((x y) (+ x y)))))
	(f '(1 2)))
    => 3)

  (check
      (let ((f (match-lambda* ((x y) (+ x y)))))
	(f 1 2))
    => 3)

  (let ()
    (match-define one
      ((x y) (+ x y)))

    (match-define* two
      ((x y) (+ x y)))

    (check
	(one '(1 2))
      => 3)

    (check
	(two 1 2)
      => 3)

    #f)

  #t)


(parametrise ((check-test-name 'getter))

  (check
      (match 2
	((:getter two)
	 (two)))
    => 2)

  (check
      (match '(2)
	((:getter two)
	 (two)))
    => '(2))

  (check
      (match '(2)
	(((:getter two))
	 (two)))
    => 2)

  (check
      (match '(1 2 3)
  	((_ (:getter two) _)
  	 (two)))
    => 2)

  (check	;getter car
      (match '(1 . 2)
	(((:getter a) . b)
	 (list (a) b)))
    => '(1 2))

  (check	;getter cdr
      (match '(1 . 2)
	((a . (:getter b))
	 (list a (b))))
    => '(1 2))

  (check	;getter vector
      (match '#(1 2 3)
	(#((:getter a) b c)
	 (list (a) b c)))
    => '(1 2 3))

  #t)


(parametrise ((check-test-name 'setter))

  (check
      (let ((x 1))
	(match x
	  ((:setter doit)
	   (doit 3)))
	x)
    => 3)

  (check
      (guard (E ((assertion-violation? E)
		 #t)
		(else
		 (write (condition-message E))(newline)
		 #f))
	(eval '(match 1
		 ((:setter doit)
		  (doit 3)))
	      (environment '(nausicaa))))
    => #t)

  (check	;setter car
      (let ((x '(1 . 2)))
	(match x (((:setter a) . b) (a 3)))
	x)
    => '(3 . 2))

  (check	;setter car
      (let ((x '(1 . 2)))
	(match x (((:setter a) . _) (a 3)))
	x)
    => '(3 . 2))

  (check	;setter cdr
      (let ((x '(1 . 2)))
	(match x ((a . (:setter b)) (b 3)))
	x)
    => '(1 . 3))

  (check
      (let ((x '(1 2 3 4)))
	(match x ((a b (:setter c) d)
		  (c 10)))
	x)
    => '(1 2 10 4))

  (check	;setter vector
      (let ((x (vector 1 2 3))) ;make a mutable vector
	(match x (#(a (:setter b) c) (b 0)))
	x)
    => '#(1 0 3))

  #t)


(parametrise ((check-test-name 'getter-setter))

  #;(check
      (let ((init-value		1)
	    (init-thunk		2)
	    (accessor		3)
	    (accessor-before	4)
	    (accessor-after	5)
	    (mutator		6)
	    (mutator-before	7)
	    (mutator-after	8))
	(match '((init-value 91)
		 (init-thunk 92))
	  (((or ('init-value		init-value)
 		('init-thunk		init-thunk)
 		('accessor		accessor)
 		('accessor-before	accessor-before)
 		('accessor-after	accessor-after)
 		('mutator		mutator)
		('mutator-before	mutator-before)
		('mutator-after		mutator-after))
	    ...)
	   (list init-value
		 init-thunk
		 accessor
		 accessor-before
		 accessor-after
		 mutator
		 mutator-before
		 mutator-after))))
    => '(1 2 3 4 5 6 7 8))


    #t)


(parametrise ((check-test-name 'identifiers))

  (check
      (match #'ax.alpha
	((:free-identifier #'ax.alpha)
	 #t)
	(_ #f))
    => #t)

  (check
      (match #'beta
	((:free-identifier #'ax.alpha)
	 #t)
	(_ #f))
    => #f)

;;; --------------------------------------------------------------------

  (check
      (match #'ax.alpha
	((:bound-identifier #'ax.alpha)
	 #t)
	(_ #f))
    => #t)

  (check
      (match #'beta
	((:bound-identifier #'ax.alpha)
	 #t)
	(_ #f))
    => #f)

  #t)


(parametrise ((check-test-name	'transformers))

  (let ()

    (define-syntax doit
      (lambda (stx)
	(match (unwrap stx)
	  ((_ ?clause)
	   (match ?clause
	     (((:free-identifier #'ax.alpha) ?a)
	      #`(list 'alpha #,?a))

	     (((:free-identifier #'ax.beta) ?clause)
	      (match ?clause
		(((:free-identifier #'delta) ?d)
		 #`(list 'beta 'delta #,?d))
		(((:free-identifier #'ax.gamma) ?g)
		 #`(list 'beta 'gamma #,?g))))

	     (((:free-identifier #'ax.rho) ?r)
	      #`(list 'rho #,?r)))))))

    (check
	(doit (alpha 1))
      => '(alpha 1))

    (check
	(doit (beta (delta 2)))
      => '(beta delta 2))

    (check
	(doit (beta (gamma 3)))
      => '(beta gamma 3))

    (check
	(doit (rho 4))
      => '(rho 4))

    #f)

;;; --------------------------------------------------------------------
;;; the same with syntax-case

  (let ()
    (define-auxiliary-syntaxes
      alpha beta delta gamma rho)

    (define-syntax doit
      (lambda (stx)
	(syntax-case stx ()
	  ((_ ?clause)
	   (syntax-case #'?clause (alpha beta rho)
	     ((alpha  ?a)
	      #'(list 'alpha ?a))

	     ((beta ?clause)
	      (syntax-case #'?clause ()
		((delta ?d)
		 #'(list 'beta 'delta ?d))
		((gamma ?g)
		 #'(list 'beta 'gamma ?g))))

	     ((rho ?r)
	      #'(list 'rho ?r)))))))

    (check
	(doit (alpha 1))
      => '(alpha 1))

    (check
	(doit (beta (delta 2)))
      => '(beta delta 2))

    (check
	(doit (beta (gamma 3)))
      => '(beta gamma 3))

    (check
	(doit (rho 4))
      => '(rho 4))

    #f)

  #t)


;;;; done

(check-report)

;;; end of file
