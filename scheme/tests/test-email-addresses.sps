;;; -*- coding: utf-8-unix -*-
;;;
;;;Part of: Nausicaa/Scheme
;;;Contents: tests for the email addresses library
;;;Date: Thu Jul 30, 2009
;;;
;;;Abstract
;;;
;;;
;;;
;;;Copyright (c) 2009 Marco Maggi <marcomaggi@gna.org>
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
  (checks)
  (email addresses)
  (email addresses quoted-text-lexer)
  (email addresses comments-lexer)
  (email addresses domain-literals-lexer)
  (email addresses lexer)
  (silex lexer)
  (lalr common)
  (rnrs mutable-strings))

(check-set-mode! 'report-failed)
(display "*** testing email addresses\n")


(parameterise ((check-test-name 'quoted-text-lexer))

  (define (tokenise-string string)
    ;;This  is just  a  lexer, it  does  not check  for the  terminating
    ;;double-quote.
    (let* ((IS		(lexer-make-IS :string string :counters 'all))
	   (lexer	(lexer-make-lexer quoted-text-table IS))
	   (out		'()))
      (do ((token (lexer) (lexer)))
	  ((lexical-token?/end-of-input token)
	   (reverse out))
	(set! out (cons token out)))))

;;; --------------------------------------------------------------------

  (check	;empty string
      (tokenise-string "")
    => '())

  (check	;empty string
      (tokenise-string "\"")
    => '(QUOTED-TEXT-CLOSE))

  (check	;a string
      (tokenise-string "ciao")
    => '("ciao"))

  (check	;a string
      (tokenise-string "ciao\"")
    => '("ciao" QUOTED-TEXT-CLOSE))

  (check	;a string
      (tokenise-string "\\a\"")
    => '("\\a" QUOTED-TEXT-CLOSE))

  (check ;a string with utf-8 character
      (tokenise-string "cioé\"")
    => '("cioé" QUOTED-TEXT-CLOSE))

  (check	;nested double quotes
      (tokenise-string "ciao \\\"hello\\\" salut\"")
    => '("ciao \\\"hello\\\" salut"  QUOTED-TEXT-CLOSE))

  #t)


(parameterise ((check-test-name 'comment-lexer))

  (define (tokenise-comment string)
    ((recursion (lex IS)
       (let ((lexer (lexer-make-lexer comments-table IS))
	     (text  ""))
	 (do ((token  (lexer) (lexer)))
	     ((eq? token 'COMMENT-CLOSE)
	      text)
	   (set! text (string-append
		       text
		       (if (eq? token 'COMMENT-OPEN)
			   (string-append "(" (lex IS) ")")
			 token))))))
     (lexer-make-IS :string string :counters 'all)))

;;; --------------------------------------------------------------------

  (check
      (tokenise-comment "ciao)")
    => "ciao")

  (check
      (tokenise-comment "ciao (hello) salut)")
    => "ciao (hello) salut")

  (check
      (tokenise-comment "((ciao (hello) salut)))")
    => "((ciao (hello) salut))")

  (check
      (tokenise-comment "((ciao (((((()))))) salut)))")
    => "((ciao (((((()))))) salut))")

  #t)


(parameterise ((check-test-name 'domain-literal-lexer))

  (define (tokenise-domain-literal string)
    (let* ((IS    (lexer-make-IS :string string :counters 'all))
	   (lexer (lexer-make-lexer domain-literals-table IS)))
      (let loop ((token (lexer))
		 (toks  '()))
	(if (lexical-token?/end-of-input token)
	    (reverse toks)
	  (loop (lexer) (cons token toks))))))

;;; --------------------------------------------------------------------

  (check
      (map lexical-token-category (tokenise-domain-literal "]"))
    => '(DOMAIN-LITERAL-CLOSE))

  (check
      (map lexical-token-category (tokenise-domain-literal "123]"))
    => '(DOMAIN-LITERAL-INTEGER DOMAIN-LITERAL-CLOSE))

  (check
      (map lexical-token-category (tokenise-domain-literal ".123]"))
    => '(DOT DOMAIN-LITERAL-INTEGER DOMAIN-LITERAL-CLOSE))

  (check
      (map lexical-token-category (tokenise-domain-literal "1.2.3.4]"))
    => '(DOMAIN-LITERAL-INTEGER
	 DOT DOMAIN-LITERAL-INTEGER
	 DOT DOMAIN-LITERAL-INTEGER
	 DOT DOMAIN-LITERAL-INTEGER
	 DOMAIN-LITERAL-CLOSE))

  #t)


(parameterise ((check-test-name 'lexer))

  (define (doit string)
    (map (lambda (token)
	   (cons (lexical-token-category token)
		 (lexical-token-value    token)))
      (address->tokens (lexer-make-IS :string string :counters 'all))))

  (check
    (parameterise ((debugging #f))
      (doit "simons@rhein.de"))
    => '((ATOM . "simons")
	 (AT . #\@)
	 (ATOM . "rhein")
	 (DOT . #\.)
	 (ATOM . "de")))

  (check
      (doit "<simons@rhein.de>")
    => '((ANGLE-OPEN . #\<)
	 (ATOM . "simons")
	 (AT . #\@)
	 (ATOM . "rhein")
	 (DOT . #\.)
	 (ATOM . "de")
	 (ANGLE-CLOSE . #\>)))

  (check
      (doit "\"Peter Simons\" <simons@rhein.de>")
    => '((QUOTED-TEXT . "Peter Simons")
	 (ANGLE-OPEN . #\<)
	 (ATOM . "simons")
	 (AT . #\@)
	 (ATOM . "rhein")
	 (DOT . #\.)
	 (ATOM . "de")
	 (ANGLE-CLOSE . #\>)))

  (check
      (doit "Peter Simons <simons@rhein.de>")
    => '((ATOM . "Peter")
	 (ATOM . "Simons")
	 (ANGLE-OPEN . #\<)
	 (ATOM . "simons")
	 (AT . #\@)
	 (ATOM . "rhein")
	 (DOT . #\.)
	 (ATOM . "de")
	 (ANGLE-CLOSE . #\>)))

  (check
      (doit "Peter Simons <sim(him)ons@rhein.de>")
    => '((ATOM . "Peter")
	 (ATOM . "Simons")
	 (ANGLE-OPEN . #\<)
	 (ATOM . "simons")
	 (AT . #\@)
	 (ATOM . "rhein")
	 (DOT . #\.)
	 (ATOM . "de")
	 (ANGLE-CLOSE . #\>)))

  (check
      (doit "testing my parser : peter.simons@gmd.de,
            (peter.)simons@rhein.de ,,,,,
         testing my parser <simons@ieee.org>,
         it rules <@peti.gmd.de,@listserv.gmd.de:simons @ cys .de>
         ;
         ,
         peter.simons@acm.org")
    => '((ATOM . "testing")
	 (ATOM . "my")
	 (ATOM . "parser")
	 (COLON . #\:)
	 (ATOM . "peter")
	 (DOT . #\.)
	 (ATOM . "simons")
	 (AT . #\@)
	 (ATOM . "gmd")
	 (DOT . #\.)
	 (ATOM . "de")
	 (COMMA . #\,)
	 (COMMENT . "peter.")
	 (ATOM . "simons")
	 (AT . #\@)
	 (ATOM . "rhein")
	 (DOT . #\.)
	 (ATOM . "de")
	 (COMMA . #\,)
	 (COMMA . #\,)
	 (COMMA . #\,)
	 (COMMA . #\,)
	 (COMMA . #\,)
	 (ATOM . "testing")
	 (ATOM . "my")
	 (ATOM . "parser")
	 (ANGLE-OPEN . #\<)
	 (ATOM . "simons")
	 (AT . #\@)
	 (ATOM . "ieee")
	 (DOT . #\.)
	 (ATOM . "org")
	 (ANGLE-CLOSE . #\>)
	 (COMMA . #\,)
	 (ATOM . "it")
	 (ATOM . "rules")
	 (ANGLE-OPEN . #\<)
	 (AT . #\@)
	 (ATOM . "peti")
	 (DOT . #\.)
	 (ATOM . "gmd")
	 (DOT . #\.)
	 (ATOM . "de")
	 (COMMA . #\,)
	 (AT . #\@)
	 (ATOM . "listserv")
	 (DOT . #\.)
	 (ATOM . "gmd")
	 (DOT . #\.)
	 (ATOM . "de")
	 (COLON . #\:)
	 (ATOM . "simons")
	 (AT . #\@)
	 (ATOM . "cys")
	 (DOT . #\.)
	 (ATOM . "de")
	 (ANGLE-CLOSE . #\>)
	 (SEMICOLON . #\;)
	 (COMMA . #\,)
	 (ATOM . "peter")
	 (DOT . #\.)
	 (ATOM . "simons")
	 (AT . #\@)
	 (ATOM . "acm")
	 (DOT . #\.)
	 (ATOM . "org")))

  (check
      (doit "=?ISO-8859-15?Q?Andr=E9s_Garc=EDa?= <fandom@spamme.telefonica.net>")
    => '((ATOM . "=?ISO-8859-15?Q?Andr=E9s_Garc=EDa?=")
	 (ANGLE-OPEN . #\<)
	 (ATOM . "fandom")
	 (AT . #\@)
	 (ATOM . "spamme")
	 (DOT . #\.)
	 (ATOM . "telefonica")
	 (DOT . #\.)
	 (ATOM . "net")
	 (ANGLE-CLOSE . #\>)))

  (check
      (doit "=?iso-8859-1?q?Ulrich_Sch=F6bel?= <ulrich@outvert.com>")
    => '((ATOM . "=?iso-8859-1?q?Ulrich_Sch=F6bel?=")
	 (ANGLE-OPEN . #\<)
	 (ATOM . "ulrich")
	 (AT . #\@)
	 (ATOM . "outvert")
	 (DOT . #\.)
	 (ATOM . "com")
	 (ANGLE-CLOSE . #\>)))

  (check
      (doit " \"Steve Redler IV, Tcl2006 Conference Program Chair\" <steve@sr-tech.com>")
    => '((QUOTED-TEXT . "Steve Redler IV, Tcl2006 Conference Program Chair")
	 (ANGLE-OPEN . #\<)
	 (ATOM . "steve")
	 (AT . #\@)
	 (ATOM . "sr-tech")
	 (DOT . #\.)
	 (ATOM . "com")
	 (ANGLE-CLOSE . #\>)))

  (check
      (doit "\"Peter Simons\" (Peter Simons) <simons@rhein.de>")
    => '((QUOTED-TEXT . "Peter Simons")
	 (COMMENT . "Peter Simons")
	 (ANGLE-OPEN . #\<)
	 (ATOM . "simons")
	 (AT . #\@)
	 (ATOM . "rhein")
	 (DOT . #\.)
	 (ATOM . "de")
	 (ANGLE-CLOSE . #\>)))

  (check 'this
      (doit "simons@[1.2.3.4].de")
    => '((ATOM . "simons")
	 (AT . #\@)
	 (DOMAIN-LITERAL-OPEN . "[")
	 (DOMAIN-LITERAL-INTEGER . "1")
	 (DOT . ".")
	 (DOMAIN-LITERAL-INTEGER . "2")
	 (DOT . ".")
	 (DOMAIN-LITERAL-INTEGER . "3")
	 (DOT . ".")
	 (DOMAIN-LITERAL-INTEGER . "4")
	 (DOMAIN-LITERAL-CLOSE . "]")
	 (DOT . #\.)
	 (ATOM . "de")))

  #t)


;;;; parser, domain

;; (define (parse-domain string)
;;   (call-with-string-output-port
;;       (lambda (port)
;; 	(domain-display (address-parse-domain (make-address-lexer :string string))
;; 			port))))

;; (check
;;     (parse-domain "alpha")
;;   => "#<domain -- alpha>")

;; (check
;;     (parse-domain "alpha.beta.delta")
;;   => "#<domain -- alpha.beta.delta>")

;; (check
;;     (guard (exc (else (condition-message exc)))
;;       (parse-domain "alpha."))
;;   => "found end of address while parsing address domain")

;; (check
;;     (guard (exc (else (condition-message exc)))
;;       (parse-domain "alpha.beta."))
;;   => "found end of address while parsing address domain")



;;;; parser, local part

;; (define (parse-local-part string)
;;   (call-with-string-output-port
;;       (lambda (port)
;; 	(local-part-display (address-parse-local-part (make-address-lexer :string string))
;; 			    port))))

;; (check
;;     (parse-local-part "alpha")
;;   => "#<local-part -- alpha>")

;; (check
;;     (parse-local-part "alpha.beta.delta")
;;   => "#<local-part -- alpha.beta.delta>")

;; (check
;;     (guard (exc (else (condition-message exc)))
;;       (parse-local-part "alpha."))
;;   => "found end of address while parsing address local part")

;; (check
;;     (guard (exc (else (condition-message exc)))
;;       (parse-local-part "alpha.beta."))
;;   => "found end of address while parsing address local part")



;;;; parser, addr-spec

;; (define (parse-addr-spec string)
;;   (call-with-string-output-port
;;       (lambda (port)
;; 	(addr-spec-display (address-parse-addr-spec (make-address-lexer :string string))
;; 			   port))))

;; (write    (address->tokens :string "marcomaggi@gna.org"))(newline)

;; (check
;;     (parse-addr-spec "marcomaggi@gna.org")
;;   => "#<addr-spec -- marcomaggi@gna.org>")


;;;; done

(check-report)

;;; end of file
