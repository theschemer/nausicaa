;;; -*- coding: utf-8-unix -*-
;;;
;;;Part of: Nausicaa/Scheme
;;;Contents: Nausicaa Object System
;;;Date: Wed Aug 26, 2009
;;;
;;;Abstract
;;;
;;;	This library is derived from (scmobj).
;;;
;;;Copyright (c) 2008, 2009 Marco Maggi <marcomaggi@gna.org>
;;;Copyright (c) 1996 Dorai Sitaram
;;;
;;;This is free software; you can redistribute it and/or modify it under
;;;the terms  of the GNU Lesser  General Public License  as published by
;;;the Free Software  Foundation; either version 3.0 of  the License, or
;;;(at your option) any later version.
;;;
;;;This library is  distributed in the hope that it  will be useful, but
;;;WITHOUT  ANY   WARRANTY;  without   even  the  implied   warranty  of
;;;MERCHANTABILITY  or FITNESS FOR  A PARTICULAR  PURPOSE.  See  the GNU
;;;Lesser General Public License for more details.
;;;
;;;You  should have received  a copy  of the  GNU Lesser  General Public
;;;License along with  this library; if not, write  to the Free Software
;;;Foundation, Inc.,  59 Temple Place, Suite 330,  Boston, MA 02111-1307
;;;USA.
;;;


(library (nos)
  (export

    <top> <builtin>
    <pair> <list>
    <char> <string> <vector> <bytevector> <hashtable>
    <record> <condition>
    <port> <binary-port> <input-port> <output-port> <textual-port>
    <fixnum> <flonum> <integer> <integer-valued> <rational> <rational-valued>
    <real> <real-valued> <complex> <number>

    record-type-of record-is-a? record-subtype?
    define-generic declare-method add-method define-generic/merge
    call-next-method next-method?

    object->string)
  (import (nausicaa)
    (rnrs mutable-pairs (6))
    (parameters)
    (records))


;;;; helpers

(define-syntax position
  ;;This is a specialised version of LIST-INDEX from (lists): Return the
  ;;zero-based index  of ?ITEM in  ?ELL.  It is  a macro in  a desperate
  ;;attempt to gain some CPU cycle.
  ;;
  ;;?ELL is evaluated only once, ?ITEM is evaluated multiple times.
  ;;
  (syntax-rules ()
    ((_ ?item ?ell)
     (let loop ((ell   ?ell)
		(index 0))
       (and (not (null? ell))
	    (if (eq? ?item (car ell))
		index
	      (loop (cdr ell) (+ 1 index))))))))

(define-syntax take-left
  (syntax-rules ()
    ((_ ?dotted ?k)
     (let loop ((ret    '())
		(dotted ?dotted)
		(k      ?k))
       (if (= 0 k)
	   (reverse ret)
	 (loop (cons (car dotted) ret)
	       (cdr dotted)
	       (- k 1)))))))

(define-syntax for-all*
  ;;Test that the lists have equal  length and all the elements are EQ?;
  ;;return true or false.
  ;;
  ;;This is  more than SRFI-1's EVERY,  because EVERY does  not test for
  ;;equal length.  It is not like R6RS's FOR-ALL, because FOR-ALL raises
  ;;an error if the length is different.
  ;;
  (syntax-rules ()
    ((_ ?eq ?ell1 ?ell2)
     (let loop ((ell1 ?ell1)
		(ell2 ?ell2))
       (cond ((null? ell1)
	      (null? ell2))
	     ((null? ell2)
	      (null? ell1))
	     ((?eq (car ell1) (car ell2))
	      (loop (cdr ell1) (cdr ell2)))
	     (else #f))))))

(define-syntax list-copy
  (syntax-rules ()
    ((_ ?ell)
     (let loop ((ell ?ell))
       (if (pair? ell)
	   (cons (car ell) (loop (cdr ell)))
	 ell)))))


(define-record-type <top>
  (nongenerative nausicaa:nos:<top>))

(define-record-type <builtin>
  (parent <top>)
  (nongenerative nausicaa:nos:<builtin>))

(define-record-type <pair>		(parent <builtin>))
(define-record-type <list>		(parent <pair>))
(define-record-type <char>		(parent <builtin>))
(define-record-type <string>		(parent <builtin>))
(define-record-type <vector>		(parent <builtin>))
(define-record-type <bytevector>	(parent <builtin>))
(define-record-type <hashtable>		(parent <builtin>))

(define-record-type <record>		(parent <builtin>))
(define-record-type <condition>		(parent <record>))

(define-record-type <port>		(parent <builtin>))
(define-record-type <input-port>	(parent <port>))
(define-record-type <output-port>	(parent <port>))
(define-record-type <binary-port>	(parent <port>))
(define-record-type <textual-port>	(parent <port>))

(define-record-type <number>		(parent <builtin>))
(define-record-type <complex>		(parent <number>))
(define-record-type <real-valued>	(parent <complex>))
(define-record-type <real>		(parent <real-valued>))
(define-record-type <rational-valued>	(parent <real>))
(define-record-type <flonum>		(parent <real>))
(define-record-type <rational>		(parent <rational-valued>))
(define-record-type <integer-valued>	(parent <rational-valued>))
(define-record-type <integer>		(parent <integer-valued>))
(define-record-type <fixnum>		(parent <integer>))


(define (record-is-a? obj class-rtd)
  (eq? class-rtd (record-type-of obj)))

(define <top>-rtd
  (record-type-descriptor <top>))

(define (record-subtype? rtd1 rtd2)
  (cond ((eq? rtd1 rtd2)	#t)
	((eq? rtd1 <top>-rtd)   #f)
   	((eq? rtd2 <top>-rtd)   #t)
	(else
	 (memq rtd2 (record-parent-list rtd1)))))

(define (record-type-of obj)
  ;;Return the  record type  descriptor associated to  OBJ, if obj  is a
  ;;RECORD; else  return the RTD  of <top>.  The  order of the  tests is
  ;;important.  More specialised types must come first.
  ;;
  (cond ((record? obj)
	 (record-rtd obj))

	((number? obj)
	 ;;Order does matter here!!!
	 (cond ((fixnum?		obj)	(record-type-descriptor <fixnum>))
	       ((integer?		obj)	(record-type-descriptor <integer>))
	       ((rational?		obj)	(record-type-descriptor <rational>))
	       ((integer-valued?	obj)	(record-type-descriptor <integer-valued>))
	       ((rational-valued?	obj)	(record-type-descriptor <rational-valued>))
	       ((flonum?		obj)	(record-type-descriptor <flonum>))
	       ((real?			obj)	(record-type-descriptor <real>))
	       ((real-valued?		obj)	(record-type-descriptor <real-valued>))
	       ((complex?		obj)	(record-type-descriptor <complex>))
	       (else				(record-type-descriptor <number>))))
	((char?		obj)		(record-type-descriptor <char>))
	((string?	obj)		(record-type-descriptor <string>))
	((vector?	obj)		(record-type-descriptor <vector>))
	((hashtable?	obj)		(record-type-descriptor <hashtable>))
	((port?		obj)
	 ;;Order here is arbitrary.
	 (cond ((input-port?	obj)	(record-type-descriptor <input-port>))
	       ((output-port?	obj)	(record-type-descriptor <output-port>))
	       ((binary-port?	obj)	(record-type-descriptor <binary-port>))
	       ((textual-port?	obj)	(record-type-descriptor <textual-port>))
	       (else			(record-type-descriptor <port>))))
	((condition?	obj)		(record-type-descriptor <condition>))
	((record?	obj)		(record-type-descriptor <record>))
	((bytevector?	obj)		(record-type-descriptor <bytevector>))
	((pair?		obj)
	 ;;Order does matter  here!!!  Better leave these at  the end because
	 ;;qualifying a long list can be time-consuming.
	 (cond ((list?	obj)	(record-type-descriptor <list>))
	       (else		(record-type-descriptor <pair>))))
	(else <top>-rtd)))


;;;; next method implementation

(define next-method-func-parm (make-parameter #f))
(define next-method-pred-parm (make-parameter #f))

(define-syntax call-next-method
  (syntax-rules ()
    ((_)
     (let ((f (next-method-func-parm)))
       (if f (f)
	 (assertion-violation 'call-next-method
	   "invoked call-next-method outside of a generic function"))))))

(define-syntax next-method?
  (syntax-rules ()
    ((_)
     (let ((f (next-method-pred-parm)))
       (if f (f)
	 (assertion-violation 'call-next-method
	   "invoked next-method? outside of a generic function"))))))


;;;; generic functions

(define-record-type special-argument
  (opaque #t)
  (sealed #t)
  (nongenerative))

(define :method-adder
  (make-special-argument))

(define :method-alist
  (make-special-argument))

(define :method-alist-set!
  (make-special-argument))

(define-syntax define-generic
  (syntax-rules ()
    ((_ ?name)
     (define ?name (make-generic-function)))))

(define-syntax define-generic/merge
  (syntax-rules ()
    ((_ ?name ?gf0 ?gf ...)
     (define ?name
       (merge-generic-functions ?gf0 ?gf ...)))))

(define (make-generic-function)
  (let* ((method-alist	'())
	 (cache		#f)
	 (method-adder	(lambda (signature has-rest closure)
			  (set! method-alist
				(%add-method-to-method-alist method-alist
							     signature has-rest closure)))))
    (lambda args
      (if (and (pair? args)
      	       (special-argument? (car args)))
      	  (let ((arg (car args)))
      	    (cond ((eq? arg :method-adder)
		   (when cache
		     (hashtable-clear! cache))
      		   method-adder)
		  ((eq? arg :method-alist)
      		   method-alist)
		  ((eq? arg :method-alist-set!)
		   (when cache
		     (hashtable-clear! cache))
      		   (set! method-alist (cadr args)))
      		  (else
      		   (assertion-violation #f
      		     "internal error with invalid special argument"
      		     arg))))
	(let-syntax ((apply-function/stx (syntax-rules ()
					   ((_ ?closure)
					    (apply ?closure args))))
		     (consume-closure (syntax-rules ()
					((_ ?closure-list)
					 (begin0
					     (car ?closure-list)
					   (set! ?closure-list (cdr ?closure-list)))))))
	  (letrec* ((signature
		     (map record-type-of args))

		    (applicable-methods
		     (cond ((and cache (hashtable-ref cache signature #f))
			    => (lambda (methods) methods))
			   (else
			    (let ((methods (%compute-applicable-methods signature method-alist)))
			      (unless cache
				(set! cache (make-hashtable equal-hash equal?)))
			      (hashtable-set! cache signature methods)
			      methods))))

		    (method-called?  #f)

		    (is-a-next-method-available?
		     (lambda ()
		       (null? applicable-methods)))

		    (apply-function
		     (lambda (f) (apply-function/stx f)))

		    (call-methods
		     (lambda ()
		       (cond
			(method-called?
			 ;;We enter here only  if a method has been
			 ;;called  and,  in  its  body, a  call  to
			 ;;CALL-NEXT-METHOD is evaluated.
			 (when (null? applicable-methods)
			   (assertion-violation #f
			     "called next method but no more methods available"))
			 (apply-function/stx (consume-closure applicable-methods)))

			((null? applicable-methods)
			 ;;Raise an error if no applicable methods.
			 (assertion-violation #f
			   "no method defined for these argument classes"
			   (map record-type-name signature)))

			(else
			 ;;Apply the methods.
			 (set! method-called? #t)
			 (apply-function/stx (consume-closure applicable-methods)))))))
	    (parameterize ((next-method-func-parm call-methods)
			   (next-method-pred-parm is-a-next-method-available?))
	      (call-methods))))))))


;;;; syntaxes to define and add methods

(define-syntax declare-method
  ;;Define a new method and store it in the given generic function.
  ;;
  (syntax-rules ()

    ;;This is for the syntax:
    ;;
    ;;	(declare-method (doit (a <alpha>) (b <beta>))
    ;;	  ---)
    ;;
    ((_ (?generic-function . ?args) . ?body)
     (%collect-classes-and-arguments ?generic-function ?args () () . ?body))

    ;;This is for the syntax:
    ;;
    ;;	(declare-method doit ((a <alpha>) (b <beta>))
    ;;	  ---)
    ;;
    ((_ ?generic-function ?args . ?body)
     (%collect-classes-and-arguments ?generic-function ?args () () . ?body))))

(define-syntax %collect-classes-and-arguments
  ;;Analyse the list  of method arguments collecting a  list of names, a
  ;;list  of  classes and  a  boolean  representing  the rest  argument.
  ;;Finally call the ADD-METHOD syntax to add the method.
  ;;
  (syntax-rules ()
    ((_ ?generic-function ((?next-arg-name ?next-record-name) . ?args)
	(?record-name ...)
	(?arg-name    ...) . ?body)
     ;;Matches the  form when  the next argument  to be processed  has a
     ;;class.
     (%collect-classes-and-arguments ?generic-function ?args
				     (?record-name ... ?next-record-name)
				     (?arg-name    ... ?next-arg-name)
				     . ?body))

    ((_ ?generic-function (?next-arg-name . ?args) (?record-name ...) (?arg-name ...) . ?body)
     ;;Matches the  form when the next  argument to be  processed has no
     ;;class.
     (%collect-classes-and-arguments ?generic-function ?args
				     (?record-name ... <top>)
				     (?arg-name    ... ?next-arg-name)
				     . ?body))

    ((_ ?generic-function () (?record-name ...) (?arg-name ...) . ?body)
     ;;Matches the form  when all the arguments have  been processed and
     ;;NO  rest argument  is present.   This  MUST come  before the  one
     ;;below.
     (add-method ?generic-function (?record-name ...)
		 #f ;means no rest argument
		 (lambda (?arg-name ...) . ?body)))

    ((_ ?generic-function ?rest-name (?record-name ...) (?arg-name ...) . ?body)
     ;;Matches the form  when all the arguments have  been processed and
     ;;only the  rest argument is there.   This MUST come  after the one
     ;;above.
     (add-method ?generic-function (?record-name ...)
		 #t ;means rest argument is present
		 (lambda (?arg-name ... . ?rest-name) . ?body)))))

(define-syntax add-method
  (syntax-rules ()
    ((_ ?generic-function (?record-name ...) ?has-rest ?closure)
     ((?generic-function :method-adder)
      (list (record-type-descriptor ?record-name) ...)	;this is the signature
      ?has-rest ?closure))))


;;;; method alists
;;
;;The  collection of methods  in a  generic function  is an  alist; each
;;entry has the format:
;;
;;	((has-rest . signature) . closure)
;;
;;the key is a pair whose CAR  is the HAS-REST boolean, and whose CDR is
;;the  SIGNATURE of  the  method;  this allows  two  methods with  equal
;;signatures to be distinct if one supports rest arguments and the other
;;does not.
;;

(define make-method-entry-key		cons)

(define-syntax method-alist-cons
  (syntax-rules ()
    ((_ ?key ?closure ?method-alist)
     (cons (cons ?key ?closure) ?method-alist))))

(define method-entry-key		car)
(define method-entry-closure		cdr)

(define method-entry-accept-rest?	caar)
(define method-entry-signature		cdar)

(define method-entry-closure-set!	set-cdr!)


;;;; actually adding methods

(define (%add-method-to-method-alist method-alist signature has-rest closure)
  ;;Add a  method's entry to the  alist of methods;  return the modified
  ;;method alist.
  ;;
  ;;A new method entry is added  only if no method with the selected key
  ;;already  exists.  If  a  method  with the  key  already exists,  its
  ;;closure is overwritten with the new one.
  ;;
  (let ((key (make-method-entry-key has-rest signature)))
    (cond ((find (lambda (method-entry)
		   (for-all* eq? key (method-entry-key method-entry)))
		 method-alist)
	   => (lambda (method-entry)
		(method-entry-closure-set! method-entry closure)
		method-alist))
	  (else
	   (method-alist-cons key closure method-alist)))))


;;;; methods dispatching

(define (%compute-applicable-methods call-signature method-alist)
  ;;Filter out from  METHOD-ALIST the methods not applicable  to a tuple
  ;;of arguments with types in  the tuple CALL-SIGNATURE.  Then sort the
  ;;list of applicable  methods so that the more  specific are the first
  ;;ones.  Return the sorted list of applicable closures.
  ;;
  (map method-entry-closure
    (list-sort
     (lambda (method1 method2)
       (%more-specific-method? method1 method2 call-signature))
     (filter
	 (lambda (method)
	   (%applicable-method? call-signature
				(method-entry-signature    method)
				(method-entry-accept-rest? method)))
       method-alist))))

(define (%applicable-method? call-signature signature has-rest)
  ;;Return true if a method with SIGNATURE as tuple of arguments' record
  ;;types can be  applied to a tuple of  arguments having CALL-SIGNATURE
  ;;as record types.  HAS-REST must  be true if the method supports rest
  ;;arguments.
  (let ((len      (length signature))
	(call-len (length call-signature)))
    (cond
     ;;If SIGNATURE has  the same length of the  call signature, test it
     ;;for applicability.
     ((= call-len len)
      (for-all* record-subtype? call-signature signature))

     ;;If  the closure  supports rest  arguments, compare  only  as much
     ;;record types as there are in SIGNATURE.
     ((and has-rest (> call-len len))
      (for-all* record-subtype? (take-left call-signature len) signature))

     ;;This method is not applicable.
     (else #f))))

(define (%more-specific-method? method1 method2 call-signature)
  ;;Return true if METHOD1 is more specific than METHOD2 with respect to
  ;;CALL-SIGNATURE.   This  function   must  be  applied  to  applicable
  ;;methods.  The longest signature is more specific, by definition.
  ;;
  (let* ((signature1	(cdar method1))
	 (signature2	(cdar method2))
	 (len1		(length signature1))
	 (len2		(length signature2)))
    (cond ((> len1 len2) #t)
	  ((< len1 len2) #f)
	  (else ;(= len1 len2)
	   (let loop ((signature1     signature1)
		      (signature2     signature2)
		      (call-signature call-signature))
	     (if (null? signature1)

		 ;;If we  are here: The two signatures  have EQ?  values
		 ;;(and  equal  length).    We  want  this:  If  METHOD2
		 ;;supports  rest arguments and  METHOD1 does  not, then
		 ;;METHOD1  is  more  specific.   This test  reduces  to
		 ;;testing if METHOD2 supports rest arguments.
		 (method-entry-accept-rest? method2)

	       (let ((class1 (car signature1))
		     (class2 (car signature2)))
		 (cond
		  ((eq? class1 class2)
		   (loop (cdr signature1) (cdr signature2) (cdr call-signature)))
		  ((record-subtype? class1 class2) #t)
		  (else #f)))))))))


;;;; merging

(define (merge-generic-functions gf . generics)
  (let ((ma  (merge-method-alists (gf :method-alist)
				  (map (lambda (gf)
					 (gf :method-alist))
				    generics)))
	(new (make-generic-function)))
    (new :method-alist-set! ma)
    new))

(define-syntax merge-method-alists
  (syntax-rules ()
    ((_ ?ma ?method-alists)
     (let loop ((ma		(list-copy ?ma))
		(method-alists	?method-alists))
       (if (null? method-alists)
	   ma
	 (loop (merge-two-method-alists ma (car method-alists))
	       (cdr method-alists)))))))

(define-syntax merge-two-method-alists
  ;;Merge ?MA1 into ?MA and return a new alist.
  ;;
  (syntax-rules ()
    ((_ ?ma ?ma1)
     (let loop ((ma  ?ma)
		(ma1 ?ma1))
       (if (null? ma1)
	   ma
	 (loop (maybe-merge-method (car ma1) ma) (cdr ma1)))))))

(define-syntax maybe-merge-method
  ;;Add CANDIDATE-METHOD-ENTRY to METHOD-ALIST and return the new alist.
  ;;Adding happens  only if  a method with  the same signature  and rest
  ;;arguments support does not already exist in METHOD-ALIST.
  ;;
  (syntax-rules ()
    ((_ ?candidate-method-entry ?method-alist)
     (let* ((candidate-method-entry	?candidate-method-entry)
	    (method-alist		?method-alist)
	    (key			(method-entry-key candidate-method-entry)))
       (unless (find (lambda (method-entry)
		       (for-all* eq? key (method-entry-key method-entry)))
		     method-alist)
	 (cons candidate-method-entry method-alist))))))


;;;; predefined generic functions

(define-generic object->string)

(declare-method (object->string o)
  (call-with-string-output-port
   (lambda (port)
     (display o port))))


;;;; done

)

;;; end of file
