(library (nausicaa r6rs character-lexer-table)
  (export
    r6rs-character-lexer-table)
  (import (rnrs) (nausicaa silex lexer)(nausicaa silex default-error-handler)(nausicaa parser-tools lexical-token)(nausicaa parser-tools source-location))

;
; Table generated from the file character-lexer-table.l by SILex 1.0
;

(define r6rs-character-lexer-table
  (vector
   'all
   (lambda (yycontinue yygetc yyungetc)
     (lambda (yytext yyline yycolumn yyoffset)
       			(silex-default-eof-handler)
       ))
   (lambda (yycontinue yygetc yyungetc)
     (lambda (yytext yyline yycolumn yyoffset)
         		(silex-default-error-handler)

;;; end of file
       ))
   (vector
    #t
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yytext yyline yycolumn yyoffset)
                 	(cond
			  ((string=? yytext "#\\nul")		#\nul)
			  ((string=? yytext "#\\alarm")		#\alarm)
			  ((string=? yytext "#\\backspace")	#\backspace)
			  ((string=? yytext "#\\tab")		#\tab)
			  ((string=? yytext "#\\linefeed")	#\linefeed)
			  ((string=? yytext "#\\newline")	#\newline)
			  ((string=? yytext "#\\vtab")		#\vtab)
			  ((string=? yytext "#\\page")		#\page)
			  ((string=? yytext "#\\return")	#\return)
			  ((string=? yytext "#\\esc")		#\esc)
			  ((string=? yytext "#\\space")		#\space)
			  ((string=? yytext "#\\delete")	#\delete)
			  (else
			   ;;Notice that this should never happen.
			   (assertion-violation 'r6rs-character-lexer-table
			     "internal error, invalid named character" yytext)))
        ))
    #t
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yytext yyline yycolumn yyoffset)
               		(let* ((len (string-length yytext))
			       (num (string->number (substring yytext 3 len) 16)))
			  (if (or (<= 0 num #xD7FF) (<= #xE000 num #x10FFFF))
			      (integer->char num)
			    (make-<lexical-token> '*lexer-error*
						  (make-<source-location> #f yyline yycolumn yyoffset)
						  yytext len)))
        ))
    #t
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yytext yyline yycolumn yyoffset)
                   	(string-ref yytext 2)
        )))
   'code
   (lambda (<<EOF>>-pre-action
            <<ERROR>>-pre-action
            rules-pre-action
            IS)
     (letrec
         ((user-action-<<EOF>> #f)
          (user-action-<<ERROR>> #f)
          (user-action-0 #f)
          (user-action-1 #f)
          (user-action-2 #f)
          (start-go-to-end    (:input-system-start-go-to-end	IS))
          (end-go-to-point    (:input-system-end-go-to-point	IS))
          (init-lexeme        (:input-system-init-lexeme	IS))
          (get-start-line     (:input-system-get-start-line	IS))
          (get-start-column   (:input-system-get-start-column	IS))
          (get-start-offset   (:input-system-get-start-offset	IS))
          (peek-left-context  (:input-system-peek-left-context	IS))
          (peek-char          (:input-system-peek-char		IS))
          (read-char          (:input-system-read-char		IS))
          (get-start-end-text (:input-system-get-start-end-text IS))
          (user-getc          (:input-system-user-getc		IS))
          (user-ungetc        (:input-system-user-ungetc	IS))
          (action-<<EOF>>
           (lambda (yyline yycolumn yyoffset)
             (user-action-<<EOF>> "" yyline yycolumn yyoffset)))
          (action-<<ERROR>>
           (lambda (yyline yycolumn yyoffset)
             (user-action-<<ERROR>> "" yyline yycolumn yyoffset)))
          (action-0
           (lambda (yyline yycolumn yyoffset)
             (let ((yytext (get-start-end-text)))
               (start-go-to-end)
               (user-action-0 yytext yyline yycolumn yyoffset))))
          (action-1
           (lambda (yyline yycolumn yyoffset)
             (let ((yytext (get-start-end-text)))
               (start-go-to-end)
               (user-action-1 yytext yyline yycolumn yyoffset))))
          (action-2
           (lambda (yyline yycolumn yyoffset)
             (let ((yytext (get-start-end-text)))
               (start-go-to-end)
               (user-action-2 yytext yyline yycolumn yyoffset))))
          (state-0
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 35)
                       (state-1 action)
                       action)
                   action))))
          (state-1
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 92)
                       (state-2 action)
                       action)
                   action))))
          (state-2
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (< c 110)
                       (if (< c 99)
                           (if (< c 11)
                               (if (< c 10)
                                   (state-3 action)
                                   action)
                               (if (< c 97)
                                   (state-3 action)
                                   (if (< c 98)
                                       (state-15 action)
                                       (state-14 action))))
                           (if (< c 102)
                               (if (< c 100)
                                   (state-3 action)
                                   (if (< c 101)
                                       (state-5 action)
                                       (state-7 action)))
                               (if (= c 108)
                                   (state-12 action)
                                   (state-3 action))))
                       (if (< c 116)
                           (if (< c 113)
                               (if (< c 111)
                                   (state-11 action)
                                   (if (< c 112)
                                       (state-3 action)
                                       (state-9 action)))
                               (if (< c 114)
                                   (state-3 action)
                                   (if (< c 115)
                                       (state-8 action)
                                       (state-6 action))))
                           (if (< c 119)
                               (if (< c 117)
                                   (state-13 action)
                                   (if (< c 118)
                                       (state-3 action)
                                       (state-10 action)))
                               (if (= c 120)
                                   (state-4 action)
                                   (state-3 action)))))
                   action))))
          (state-3
           (lambda (action)
             (end-go-to-point)
             action-2))
          (state-4
           (lambda (action)
             (end-go-to-point)
             (let ((c (read-char)))
               (if c
                   (if (< c 65)
                       (if (< c 48)
                           action-2
                           (if (< c 58)
                               (state-16 action-2)
                               action-2))
                       (if (< c 97)
                           (if (< c 71)
                               (state-16 action-2)
                               action-2)
                           (if (< c 103)
                               (state-16 action-2)
                               action-2)))
                   action-2))))
          (state-5
           (lambda (action)
             (end-go-to-point)
             (let ((c (read-char)))
               (if c
                   (if (= c 101)
                       (state-17 action-2)
                       action-2)
                   action-2))))
          (state-6
           (lambda (action)
             (end-go-to-point)
             (let ((c (read-char)))
               (if c
                   (if (= c 112)
                       (state-18 action-2)
                       action-2)
                   action-2))))
          (state-7
           (lambda (action)
             (end-go-to-point)
             (let ((c (read-char)))
               (if c
                   (if (= c 115)
                       (state-19 action-2)
                       action-2)
                   action-2))))
          (state-8
           (lambda (action)
             (end-go-to-point)
             (let ((c (read-char)))
               (if c
                   (if (= c 101)
                       (state-20 action-2)
                       action-2)
                   action-2))))
          (state-9
           (lambda (action)
             (end-go-to-point)
             (let ((c (read-char)))
               (if c
                   (if (= c 97)
                       (state-21 action-2)
                       action-2)
                   action-2))))
          (state-10
           (lambda (action)
             (end-go-to-point)
             (let ((c (read-char)))
               (if c
                   (if (= c 116)
                       (state-22 action-2)
                       action-2)
                   action-2))))
          (state-11
           (lambda (action)
             (end-go-to-point)
             (let ((c (read-char)))
               (if c
                   (if (< c 102)
                       (if (< c 101)
                           action-2
                           (state-23 action-2))
                       (if (= c 117)
                           (state-24 action-2)
                           action-2))
                   action-2))))
          (state-12
           (lambda (action)
             (end-go-to-point)
             (let ((c (read-char)))
               (if c
                   (if (= c 105)
                       (state-25 action-2)
                       action-2)
                   action-2))))
          (state-13
           (lambda (action)
             (end-go-to-point)
             (let ((c (read-char)))
               (if c
                   (if (= c 97)
                       (state-26 action-2)
                       action-2)
                   action-2))))
          (state-14
           (lambda (action)
             (end-go-to-point)
             (let ((c (read-char)))
               (if c
                   (if (= c 97)
                       (state-27 action-2)
                       action-2)
                   action-2))))
          (state-15
           (lambda (action)
             (end-go-to-point)
             (let ((c (read-char)))
               (if c
                   (if (= c 108)
                       (state-28 action-2)
                       action-2)
                   action-2))))
          (state-16
           (lambda (action)
             (end-go-to-point)
             (let ((c (read-char)))
               (if c
                   (if (< c 65)
                       (if (< c 48)
                           action-1
                           (if (< c 58)
                               (state-16 action-1)
                               action-1))
                       (if (< c 97)
                           (if (< c 71)
                               (state-16 action-1)
                               action-1)
                           (if (< c 103)
                               (state-16 action-1)
                               action-1)))
                   action-1))))
          (state-17
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 108)
                       (state-29 action)
                       action)
                   action))))
          (state-18
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 97)
                       (state-30 action)
                       action)
                   action))))
          (state-19
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 99)
                       (state-31 action)
                       action)
                   action))))
          (state-20
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 116)
                       (state-32 action)
                       action)
                   action))))
          (state-21
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 103)
                       (state-33 action)
                       action)
                   action))))
          (state-22
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 97)
                       (state-34 action)
                       action)
                   action))))
          (state-23
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 119)
                       (state-35 action)
                       action)
                   action))))
          (state-24
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 108)
                       (state-31 action)
                       action)
                   action))))
          (state-25
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 110)
                       (state-36 action)
                       action)
                   action))))
          (state-26
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 98)
                       (state-31 action)
                       action)
                   action))))
          (state-27
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 99)
                       (state-37 action)
                       action)
                   action))))
          (state-28
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 97)
                       (state-38 action)
                       action)
                   action))))
          (state-29
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 101)
                       (state-39 action)
                       action)
                   action))))
          (state-30
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 99)
                       (state-40 action)
                       action)
                   action))))
          (state-31
           (lambda (action)
             (end-go-to-point)
             action-0))
          (state-32
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 117)
                       (state-41 action)
                       action)
                   action))))
          (state-33
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 101)
                       (state-31 action)
                       action)
                   action))))
          (state-34
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 98)
                       (state-31 action)
                       action)
                   action))))
          (state-35
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 108)
                       (state-42 action)
                       action)
                   action))))
          (state-36
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 101)
                       (state-43 action)
                       action)
                   action))))
          (state-37
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 107)
                       (state-44 action)
                       action)
                   action))))
          (state-38
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 114)
                       (state-45 action)
                       action)
                   action))))
          (state-39
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 116)
                       (state-46 action)
                       action)
                   action))))
          (state-40
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 101)
                       (state-31 action)
                       action)
                   action))))
          (state-41
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 114)
                       (state-47 action)
                       action)
                   action))))
          (state-42
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 105)
                       (state-48 action)
                       action)
                   action))))
          (state-43
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 102)
                       (state-49 action)
                       action)
                   action))))
          (state-44
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 115)
                       (state-50 action)
                       action)
                   action))))
          (state-45
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 109)
                       (state-31 action)
                       action)
                   action))))
          (state-46
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 101)
                       (state-31 action)
                       action)
                   action))))
          (state-47
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 110)
                       (state-31 action)
                       action)
                   action))))
          (state-48
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 110)
                       (state-51 action)
                       action)
                   action))))
          (state-49
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 101)
                       (state-52 action)
                       action)
                   action))))
          (state-50
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 112)
                       (state-53 action)
                       action)
                   action))))
          (state-51
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 101)
                       (state-31 action)
                       action)
                   action))))
          (state-52
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 101)
                       (state-54 action)
                       action)
                   action))))
          (state-53
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 97)
                       (state-55 action)
                       action)
                   action))))
          (state-54
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 100)
                       (state-31 action)
                       action)
                   action))))
          (state-55
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 99)
                       (state-56 action)
                       action)
                   action))))
          (state-56
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 101)
                       (state-31 action)
                       action)
                   action))))
          (start-automaton
           (lambda ()
             (if (peek-char)
                 (state-0 action-<<ERROR>>)
               action-<<EOF>>)))
          (final-lexer
           (lambda ()
             (init-lexeme)
             (let ((yyline (get-start-line))
                   (yycolumn (get-start-column))
                   (yyoffset (get-start-offset)))
               ((start-automaton) yyline yycolumn yyoffset)))))
       (set! user-action-<<EOF>> (<<EOF>>-pre-action
                                  final-lexer user-getc user-ungetc))
       (set! user-action-<<ERROR>> (<<ERROR>>-pre-action
                                    final-lexer user-getc user-ungetc))
       (set! user-action-0 ((vector-ref rules-pre-action 1)
                            final-lexer user-getc user-ungetc))
       (set! user-action-1 ((vector-ref rules-pre-action 3)
                            final-lexer user-getc user-ungetc))
       (set! user-action-2 ((vector-ref rules-pre-action 5)
                            final-lexer user-getc user-ungetc))
       final-lexer))))

) ; end of library

