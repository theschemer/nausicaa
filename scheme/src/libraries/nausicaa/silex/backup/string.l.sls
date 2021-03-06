(library (nausicaa silex string.l)
  (export
    string-tables)
  (import (rnrs)
(nausicaa silex input-system)
(nausicaa silex semantic)
)

;
; Table generated from the file string.l by SILex 1.0
;

(define string-tables
  (vector
   'all
   (lambda (yycontinue yygetc yyungetc)
     (lambda (yytext yyline yycolumn yyoffset)
       			(make-tok eof-tok	yytext yyline yycolumn)

;;; end of file
       ))
   (lambda (yycontinue yygetc yyungetc)
     (lambda (yytext yyline yycolumn yyoffset)
       (assertion-violation #f "invalid token")
       ))
   (vector
    #t
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yytext yyline yycolumn yyoffset)
             		(make-tok doublequote-tok yytext yyline yycolumn)
        ))
    #t
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yytext yyline yycolumn yyoffset)
           		(parse-escaped-char	yytext yyline yycolumn #\x7)
        ))
    #t
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yytext yyline yycolumn yyoffset)
           		(parse-escaped-char	yytext yyline yycolumn #\x8)
        ))
    #t
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yytext yyline yycolumn yyoffset)
           		(parse-escaped-char	yytext yyline yycolumn #\x9)
;;newline is special for SILex
        ))
    #t
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yytext yyline yycolumn yyoffset)
           		(parse-spec-char	yytext yyline yycolumn)
        ))
    #t
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yytext yyline yycolumn yyoffset)
           		(parse-escaped-char	yytext yyline yycolumn #\xB)
        ))
    #t
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yytext yyline yycolumn yyoffset)
           		(parse-escaped-char	yytext yyline yycolumn #\xC)
        ))
    #t
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yytext yyline yycolumn yyoffset)
           		(parse-escaped-char	yytext yyline yycolumn #\xD)
        ))
    #t
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yytext yyline yycolumn yyoffset)
                     	(parse-escaped-char	yytext yyline yycolumn #\x22)
        ))
    #t
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yytext yyline yycolumn yyoffset)
                   	(parse-escaped-char	yytext yyline yycolumn #\x5C)
        ))
    #f
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yyline yycolumn yyoffset)
                     	;;ignored
        (yycontinue)
        ))
    #t
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yytext yyline yycolumn yyoffset)
                   	(parse-inline-hex-escape yytext yyline yycolumn)
        ))
    #t
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yytext yyline yycolumn yyoffset)
   			(parse-ordinary-char	yytext yyline yycolumn)
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
          (user-action-3 #f)
          (user-action-4 #f)
          (user-action-5 #f)
          (user-action-6 #f)
          (user-action-7 #f)
          (user-action-8 #f)
          (user-action-9 #f)
          (user-action-10 #f)
          (user-action-11 #f)
          (user-action-12 #f)
          (start-go-to-end    (<input-system>-start-go-to-end	IS))
          (end-go-to-point    (<input-system>-end-go-to-point	IS))
          (init-lexeme        (<input-system>-init-lexeme	IS))
          (get-start-line     (<input-system>-get-start-line	IS))
          (get-start-column   (<input-system>-get-start-column	IS))
          (get-start-offset   (<input-system>-get-start-offset	IS))
          (peek-left-context  (<input-system>-peek-left-context	IS))
          (peek-char          (<input-system>-peek-char		IS))
          (read-char          (<input-system>-read-char		IS))
          (get-start-end-text (<input-system>-get-start-end-text IS))
          (user-getc          (<input-system>-user-getc		IS))
          (user-ungetc        (<input-system>-user-ungetc	IS))
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
          (action-3
           (lambda (yyline yycolumn yyoffset)
             (let ((yytext (get-start-end-text)))
               (start-go-to-end)
               (user-action-3 yytext yyline yycolumn yyoffset))))
          (action-4
           (lambda (yyline yycolumn yyoffset)
             (let ((yytext (get-start-end-text)))
               (start-go-to-end)
               (user-action-4 yytext yyline yycolumn yyoffset))))
          (action-5
           (lambda (yyline yycolumn yyoffset)
             (let ((yytext (get-start-end-text)))
               (start-go-to-end)
               (user-action-5 yytext yyline yycolumn yyoffset))))
          (action-6
           (lambda (yyline yycolumn yyoffset)
             (let ((yytext (get-start-end-text)))
               (start-go-to-end)
               (user-action-6 yytext yyline yycolumn yyoffset))))
          (action-7
           (lambda (yyline yycolumn yyoffset)
             (let ((yytext (get-start-end-text)))
               (start-go-to-end)
               (user-action-7 yytext yyline yycolumn yyoffset))))
          (action-8
           (lambda (yyline yycolumn yyoffset)
             (let ((yytext (get-start-end-text)))
               (start-go-to-end)
               (user-action-8 yytext yyline yycolumn yyoffset))))
          (action-9
           (lambda (yyline yycolumn yyoffset)
             (let ((yytext (get-start-end-text)))
               (start-go-to-end)
               (user-action-9 yytext yyline yycolumn yyoffset))))
          (action-10
           (lambda (yyline yycolumn yyoffset)
             (start-go-to-end)
             (user-action-10 yyline yycolumn yyoffset)))
          (action-11
           (lambda (yyline yycolumn yyoffset)
             (let ((yytext (get-start-end-text)))
               (start-go-to-end)
               (user-action-11 yytext yyline yycolumn yyoffset))))
          (action-12
           (lambda (yyline yycolumn yyoffset)
             (let ((yytext (get-start-end-text)))
               (start-go-to-end)
               (user-action-12 yytext yyline yycolumn yyoffset))))
          (state-0
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (< c 35)
                       (if (< c 34)
                           (state-1 action)
                           (state-3 action))
                       (if (= c 92)
                           (state-2 action)
                           (state-1 action)))
                   action))))
          (state-1
           (lambda (action)
             (end-go-to-point)
             action-12))
          (state-2
           (lambda (action)
             (end-go-to-point)
             (let ((c (read-char)))
               (if c
                   (if (< c 117)
                       (if (< c 93)
                           (if (< c 14)
                               (if (< c 10)
                                   (if (< c 9)
                                       action-12
                                       (state-5 action-12))
                                   (if (< c 11)
                                       (state-7 action-12)
                                       (if (< c 13)
                                           action-12
                                           (state-6 action-12))))
                               (if (< c 34)
                                   (if (= c 32)
                                       (state-5 action-12)
                                       action-12)
                                   (if (< c 35)
                                       (state-9 action-12)
                                       (if (< c 92)
                                           action-12
                                           (state-8 action-12)))))
                           (if (< c 103)
                               (if (< c 98)
                                   (if (< c 97)
                                       action-12
                                       (state-16 action-12))
                                   (if (< c 99)
                                       (state-15 action-12)
                                       (if (< c 102)
                                           action-12
                                           (state-11 action-12))))
                               (if (< c 114)
                                   (if (= c 110)
                                       (state-13 action-12)
                                       action-12)
                                   (if (< c 115)
                                       (state-10 action-12)
                                       (if (< c 116)
                                           action-12
                                           (state-14 action-12))))))
                       (if (< c 6158)
                           (if (< c 133)
                               (if (< c 119)
                                   (if (< c 118)
                                       action-12
                                       (state-12 action-12))
                                   (if (= c 120)
                                       (state-4 action-12)
                                       action-12))
                               (if (< c 161)
                                   (if (< c 134)
                                       (state-7 action-12)
                                       (if (< c 160)
                                           action-12
                                           (state-5 action-12)))
                                   (if (= c 5760)
                                       (state-5 action-12)
                                       action-12)))
                           (if (< c 8239)
                               (if (< c 8203)
                                   (if (< c 6159)
                                       (state-5 action-12)
                                       (if (< c 8192)
                                           action-12
                                           (state-5 action-12)))
                                   (if (= c 8232)
                                       (state-7 action-12)
                                       action-12))
                               (if (< c 8288)
                                   (if (< c 8240)
                                       (state-5 action-12)
                                       (if (< c 8287)
                                           action-12
                                           (state-5 action-12)))
                                   (if (= c 12288)
                                       (state-5 action-12)
                                       action-12)))))
                   action-12))))
          (state-3
           (lambda (action)
             (end-go-to-point)
             action-0))
          (state-4
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (< c 65)
                       (if (< c 48)
                           action
                           (if (< c 58)
                               (state-17 action)
                               action))
                       (if (< c 97)
                           (if (< c 71)
                               (state-17 action)
                               action)
                           (if (< c 103)
                               (state-17 action)
                               action)))
                   action))))
          (state-5
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (< c 5761)
                       (if (< c 32)
                           (if (< c 11)
                               (if (< c 9)
                                   action
                                   (if (< c 10)
                                       (state-5 action)
                                       (state-7 action)))
                               (if (= c 13)
                                   (state-6 action)
                                   action))
                           (if (< c 134)
                               (if (< c 33)
                                   (state-5 action)
                                   (if (< c 133)
                                       action
                                       (state-7 action)))
                               (if (< c 161)
                                   (if (< c 160)
                                       action
                                       (state-5 action))
                                   (if (< c 5760)
                                       action
                                       (state-5 action)))))
                       (if (< c 8233)
                           (if (< c 8192)
                               (if (= c 6158)
                                   (state-5 action)
                                   action)
                               (if (< c 8203)
                                   (state-5 action)
                                   (if (< c 8232)
                                       action
                                       (state-7 action))))
                           (if (< c 8287)
                               (if (= c 8239)
                                   (state-5 action)
                                   action)
                               (if (< c 12288)
                                   (if (< c 8288)
                                       (state-5 action)
                                       action)
                                   (if (< c 12289)
                                       (state-5 action)
                                       action)))))
                   action))))
          (state-6
           (lambda (action)
             (end-go-to-point)
             (let ((c (read-char)))
               (if c
                   (if (< c 5761)
                       (if (< c 133)
                           (if (< c 11)
                               (if (< c 9)
                                   action-10
                                   (state-7 action-10))
                               (if (= c 32)
                                   (state-7 action-10)
                                   action-10))
                           (if (< c 160)
                               (if (< c 134)
                                   (state-7 action-10)
                                   action-10)
                               (if (< c 161)
                                   (state-7 action-10)
                                   (if (< c 5760)
                                       action-10
                                       (state-7 action-10)))))
                       (if (< c 8239)
                           (if (< c 6159)
                               (if (< c 6158)
                                   action-10
                                   (state-7 action-10))
                               (if (< c 8192)
                                   action-10
                                   (if (< c 8203)
                                       (state-7 action-10)
                                       action-10)))
                           (if (< c 8288)
                               (if (< c 8240)
                                   (state-7 action-10)
                                   (if (< c 8287)
                                       action-10
                                       (state-7 action-10)))
                               (if (= c 12288)
                                   (state-7 action-10)
                                   action-10))))
                   action-10))))
          (state-7
           (lambda (action)
             (end-go-to-point)
             (let ((c (read-char)))
               (if c
                   (if (< c 6158)
                       (if (< c 33)
                           (if (< c 10)
                               (if (< c 9)
                                   action-10
                                   (state-7 action-10))
                               (if (< c 32)
                                   action-10
                                   (state-7 action-10)))
                           (if (< c 161)
                               (if (< c 160)
                                   action-10
                                   (state-7 action-10))
                               (if (= c 5760)
                                   (state-7 action-10)
                                   action-10)))
                       (if (< c 8240)
                           (if (< c 8192)
                               (if (< c 6159)
                                   (state-7 action-10)
                                   action-10)
                               (if (< c 8203)
                                   (state-7 action-10)
                                   (if (< c 8239)
                                       action-10
                                       (state-7 action-10))))
                           (if (< c 8288)
                               (if (< c 8287)
                                   action-10
                                   (state-7 action-10))
                               (if (= c 12288)
                                   (state-7 action-10)
                                   action-10))))
                   action-10))))
          (state-8
           (lambda (action)
             (end-go-to-point)
             action-9))
          (state-9
           (lambda (action)
             (end-go-to-point)
             action-8))
          (state-10
           (lambda (action)
             (end-go-to-point)
             action-7))
          (state-11
           (lambda (action)
             (end-go-to-point)
             action-6))
          (state-12
           (lambda (action)
             (end-go-to-point)
             action-5))
          (state-13
           (lambda (action)
             (end-go-to-point)
             action-4))
          (state-14
           (lambda (action)
             (end-go-to-point)
             action-3))
          (state-15
           (lambda (action)
             (end-go-to-point)
             action-2))
          (state-16
           (lambda (action)
             (end-go-to-point)
             action-1))
          (state-17
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (< c 60)
                       (if (< c 58)
                           (if (< c 48)
                               action
                               (state-17 action))
                           (if (< c 59)
                               action
                               (state-18 action)))
                       (if (< c 71)
                           (if (< c 65)
                               action
                               (state-17 action))
                           (if (< c 97)
                               action
                               (if (< c 103)
                                   (state-17 action)
                                   action))))
                   action))))
          (state-18
           (lambda (action)
             (end-go-to-point)
             action-11))
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
       (set! user-action-3 ((vector-ref rules-pre-action 7)
                            final-lexer user-getc user-ungetc))
       (set! user-action-4 ((vector-ref rules-pre-action 9)
                            final-lexer user-getc user-ungetc))
       (set! user-action-5 ((vector-ref rules-pre-action 11)
                            final-lexer user-getc user-ungetc))
       (set! user-action-6 ((vector-ref rules-pre-action 13)
                            final-lexer user-getc user-ungetc))
       (set! user-action-7 ((vector-ref rules-pre-action 15)
                            final-lexer user-getc user-ungetc))
       (set! user-action-8 ((vector-ref rules-pre-action 17)
                            final-lexer user-getc user-ungetc))
       (set! user-action-9 ((vector-ref rules-pre-action 19)
                            final-lexer user-getc user-ungetc))
       (set! user-action-10 ((vector-ref rules-pre-action 21)
                             final-lexer user-getc user-ungetc))
       (set! user-action-11 ((vector-ref rules-pre-action 23)
                             final-lexer user-getc user-ungetc))
       (set! user-action-12 ((vector-ref rules-pre-action 25)
                             final-lexer user-getc user-ungetc))
       final-lexer))))

) ; end of library

