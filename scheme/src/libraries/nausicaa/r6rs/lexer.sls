;;; -*- coding: utf-8 -*-
;;;
;;;Part of: Nausicaa/Scheme
;;;Contents: lexer for R6RS programs and libraries
;;;Date: Wed Dec 22, 2010
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
(library (nausicaa r6rs lexer)
  (export
    r6rs-lexer-table
    r6rs-nested-comment-lexer-table r6rs-line-comment-lexer-table
    r6rs-string-lexer-table r6rs-character-lexer-table

    read-string read-character read-nested-comment read-line-comment)
  (import (nausicaa)
    (nausicaa r6rs lexer-table)
    (nausicaa r6rs nested-comment-lexer-table)
    (nausicaa r6rs line-comment-lexer-table)
    (nausicaa r6rs string-lexer-table)
    (nausicaa r6rs character-lexer-table)
    (nausicaa parser-tools lexical-token)
    (nausicaa silex lexer))


(define (read-string IS)
  ;;Given  an input  system  from  which a  double  quote character  has
  ;;already  been consumed,  read  characters composing  an R6RS  string
  ;;stopping at the ending double quote.  Return the Scheme string.
  ;;
  ;;If an error occurs reading  the string: a condition object is raised
  ;;with  components &lexical,  &message, &who,  &irritants;  the single
  ;;value in the &irritants list is the string that caused the error.
  ;;
  ;;If end of  input is found reading the string:  a condition object is
  ;;raised  with components &lexical,  &message, &who,  &irritants.  The
  ;;single value in the irritants list is the EOF object.
  ;;
  (let-values (((port getter)	(open-string-output-port))
	       ((lexer)		(lexer-make-lexer r6rs-string-lexer-table IS)))
    (let next (((T <lexical-token>) (lexer)))
      (define (%error message)
	(raise
	 (condition (make-lexical-violation)
		    (make-message-condition message)
		    (make-who-condition 'read-string)
		    (make-irritants-condition (list T.value)))))
      (cond (T.end-of-input?
	     (%error "end of input found while reading string"))
	    (T.lexer-error?
	     (%error "lexical violation while reading string"))
	    ((eq? T 'STRING)
	     (getter))
	    (else
	     (display T port)
	     (next (lexer)))))))

(define (read-character IS)
  ;;Given an input system, read  a single character datum compliant with
  ;;R6RS.  Return the Scheme character.
  ;;
  ;;If  an error  occurs reading  the character:  a condition  object is
  ;;raised  with components  &lexical, &message,  &who,  &irritants; the
  ;;single value  in the &irritants list  is the string  that caused the
  ;;error.
  ;;
  ;;If end of  input is found reading the  character: a condition object
  ;;is raised with components &lexical, &message, &who, &irritants.  The
  ;;single value in the irritants list is the EOF object.
  ;;
  (let (((T <lexical-token>) ((lexer-make-lexer r6rs-character-lexer-table IS))))
    (define (%error message)
      (raise
       (condition (make-lexical-violation)
		  (make-message-condition message)
		  (make-who-condition 'read-string)
		  (make-irritants-condition (list T.value)))))
    (cond (T.end-of-input?
	   (%error "end of input found while reading character"))
	  (T.lexer-error?
	   (%error "lexical violation while reading character"))
	  (else T))))

(define (read-nested-comment IS)
  ;;Given  an input  system from  which the  opening sequence  of nested
  ;;comments "#|"  has already been consumed,  read characters composing
  ;;an R6RS  nested comment matching sequence "|#".   Return the comment
  ;;as Scheme string enclosed in "#|" and "|#" sequences.
  ;;
  ;;If an error occurs reading the nested comment: a condition object is
  ;;raised  with components  &lexical, &message,  &who,  &irritants; the
  ;;single value  in the &irritants list  is the string  that caused the
  ;;error.  Notice that this should never happen.
  ;;
  ;;If end  of input  is found reading  the nested comment:  a condition
  ;;object   is  raised  with   components  &lexical,   &message,  &who,
  ;;&irritants.   The single  value in  the  irritants list  is the  EOF
  ;;object.
  ;;
  (let-values (((port getter)	(open-string-output-port))
	       ((lexer)		(lexer-make-lexer r6rs-nested-comment-lexer-table IS))
	       ((count)		1))
    (display "#|" port)
    (let next (((T <lexical-token>) (lexer)))
      (define (%error message)
	(raise
	 (condition (make-lexical-violation)
		    (make-message-condition message)
		    (make-who-condition 'read-nested-comment)
		    (make-irritants-condition (list T.value)))))
      (cond (T.end-of-input?
	     (%error "end of input found while reading nested comment"))
	    (T.lexer-error? ;this should never happen
	     (%error "lexical violation while reading nested comment"))
	    ((eq? T 'CLOSE)
	     (decr! count)
	     (display "|#" port)
	     (if (zero? count)
		 (getter)
	       (next (lexer))))
	    ((eq? T 'OPEN)
	     (incr! count)
	     (display "#|" port)
	     (next (lexer)))
	    (else
	     (display T port)
	     (next (lexer)))))))

(define (read-line-comment IS)
  ;;Given  an  input system,  read  characters  composing  an R6RS  line
  ;;comment.  Return the string representing the comment.
  ;;
  ;;If an error  occurs reading the line comment:  a condition object is
  ;;raised  with components  &lexical, &message,  &who,  &irritants; the
  ;;single value  in the &irritants list  is the string  that caused the
  ;;error.
  ;;
  ;;If  end of  input is  found reading  the line  comment:  a condition
  ;;object   is  raised  with   components  &lexical,   &message,  &who,
  ;;&irritants.   The single  value in  the  irritants list  is the  EOF
  ;;object.
  ;;
  (let (((T <lexical-token>) ((lexer-make-lexer r6rs-line-comment-lexer-table IS))))
    (define (%error message)
      (raise
       (condition (make-lexical-violation)
		  (make-message-condition message)
		  (make-who-condition 'read-line-comment)
		  (make-irritants-condition (list T.value)))))
    (cond (T.end-of-input?
	   (%error "end of input found while reading line comment"))
	  (T.lexer-error?
	   (%error "lexical violation while reading line comment"))
	  (else T))))


;;;; done

)

;;; end of file
