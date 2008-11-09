;; 
;; Test suite for optional arg processing.
;; 
;; Copyright (C) 2001, 2006 Free Software Foundation, Inc.
;; Matthias Koeppe <mkoeppe@mail.math.uni-magdeburg.de> June 2001
;; Marco Maggi <marcomaggi@gna.org> Sat Nov  8, 2008
;;
;; This program is free  software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by  the Free Software Foundation;  either version 2,
;; or (at your option) any later version.
;; 
;; This  program is  distributed  in  the hope  that  it will  be
;; useful,  but WITHOUT  ANY WARRANTY;  without even  the implied
;; warranty  of  MERCHANTABILITY  or  FITNESS  FOR  A  PARTICULAR
;; PURPOSE.  See the GNU General Public License for more details.
;; 
;; You  should have  received a  copy of  the GNU  General Public
;; License along  with this software;  see the file  COPYING.  If
;; not, write to the  Free Software Foundation, Inc., 51 Franklin
;; Street, Fifth Floor, Boston, MA 02110-1301 USA

;;page
;; ------------------------------------------------------------
;; Setup.
;; ------------------------------------------------------------

(import (ikarus)
	(srfi lightweight-testing)
	(ice-9 optargs))

(check-set-mode! 'report-failed)

;; ------------------------------------------------------------

(define-syntax check-for-true
  (syntax-rules ()
    [(_ ?form ...)
     (check (if (begin ?form ...) #t #f) => #t)]))

(define-syntax check-for-false
  (syntax-rules ()
    [(_ ?form ...)
     (check (if (begin ?form ...) #t #f) => #f)]))

;; ------------------------------------------------------------

;;page
;; ------------------------------------------------------------
;; Let-optional.
;; ------------------------------------------------------------

(check
 (let ((rest-arg '()))
   (let-optional () ((a 'one)
		     (b 'two)
		     (c 'three))
     (list a b c)))
 => '(one two three))

(check
 (let ((rest-arg (1)))
   (let-optional rest-arg ((a 'one)
			   (b 'two)
			   (c 'three))
     (list a b c)))
 => '(1 2 3))

(check
 (let ((rest-arg (1 2)))
   (let-optional rest-arg ((a 'one)
			   (b 'two)
			   (c 'three))
     (list a b c)))
 => '(1 2 3))

(check
 (let ((rest-arg (1 2 3)))
   (let-optional rest-arg ((a 'one)
			   (b 'two)
			   (c 'three))
     (list a b c)))
 => '(1 2 3))

(check-report)

#!eof


(with-test-prefix "optional argument processing"
  (pass-if "local defines work with optional arguments"
    (eval '(begin
             (define* (test-1 #:optional (x 0))
               (define d 1)			; local define
               #t)
             (false-if-exception (test-1)))
          (interaction-environment))))

;; ------------------------------------------------------------

;;page
;; ------------------------------------------------------------
;; Let-keywords.
;; ------------------------------------------------------------



(with-test-prefix "let-keywords"

  ;; in guile 1.6.4 and earlier, an empty binding list only used `begin',
  ;; which caused apparently internal defines to "leak" out into the
  ;; encompasing environment
  (pass-if-exception "empty bindings internal defines leaking out"
      exception:unbound-var
    (let ((rest '()))
      (let-keywords rest #f ()
	(define localvar #f)
	#f)
      localvar))

  (pass-if "one key"
    (let-keywords '(#:foo 123) #f (foo)
      (= foo 123))))

;;;
;;; let-keywords*
;;;

(with-test-prefix "let-keywords*"

  ;; in guile 1.6.4 and earlier, an empty binding list only used `begin',
  ;; which caused apparently internal defines to "leak" out into the
  ;; encompasing environment
  (pass-if-exception "empty bindings internal defines leaking out"
      exception:unbound-var
    (let ((rest '()))
      (let-keywords* rest #f ()
	(define localvar #f)
	#f)
      localvar))

  (pass-if "one key"
    (let-keywords* '(#:foo 123) #f (foo)
      (= foo 123))))

;;;
;;; let-optional
;;;

(with-test-prefix "let-optional"

  ;; in guile 1.6.4 and earlier, an empty binding list only used `begin',
  ;; which caused apparently internal defines to "leak" out into the
  ;; encompasing environment
  (pass-if-exception "empty bindings internal defines leaking out"
      exception:unbound-var
    (let ((rest '()))
      (let-optional rest ()
	(define localvar #f)
	#f)
      localvar))

  (pass-if "one var"
    (let ((rest '(123)))
      (let-optional rest ((foo 999))
	(= foo 123)))))

;;;
;;; let-optional*
;;;

(with-test-prefix "let-optional*"

  ;; in guile 1.6.4 and earlier, an empty binding list only used `begin',
  ;; which caused apparently internal defines to "leak" out into the
  ;; encompasing environment
  (pass-if-exception "empty bindings internal defines leaking out"
      exception:unbound-var
    (let ((rest '()))
      (let-optional* rest ()
	(define localvar #f)
	#f)
      localvar))

  (pass-if "one var"
    (let ((rest '(123)))
      (let-optional* rest ((foo 999))
	(= foo 123)))))
