(library (nausicaa silex regexp.l)
  (export
    regexp-tables)
  (import (rnrs)
(nausicaa silex lexer)
(nausicaa silex semantic)
)

;
; Table generated from the file regexp.l by SILex 1.0
;

(define regexp-tables
  (vector
   'all
   (lambda (yycontinue yygetc yyungetc)
     (lambda (yytext yyline yycolumn yyoffset)
                          (make-tok eof-tok           yytext yyline yycolumn)

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
                          (make-tok hblank-tok        yytext yyline yycolumn)
        ))
    #t
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yytext yyline yycolumn yyoffset)
                          (make-tok vblank-tok        yytext yyline yycolumn)
        ))
    #t
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yytext yyline yycolumn yyoffset)
                          (make-tok pipe-tok          yytext yyline yycolumn)
        ))
    #t
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yytext yyline yycolumn yyoffset)
                          (make-tok question-tok      yytext yyline yycolumn)
        ))
    #t
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yytext yyline yycolumn yyoffset)
                          (make-tok plus-tok          yytext yyline yycolumn)
        ))
    #t
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yytext yyline yycolumn yyoffset)
                          (make-tok star-tok          yytext yyline yycolumn)
        ))
    #t
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yytext yyline yycolumn yyoffset)
                          (make-tok lpar-tok          yytext yyline yycolumn)
        ))
    #t
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yytext yyline yycolumn yyoffset)
                          (make-tok rpar-tok          yytext yyline yycolumn)
        ))
    #t
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yytext yyline yycolumn yyoffset)
                          (make-tok dot-tok           yytext yyline yycolumn)
        ))
    #t
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yytext yyline yycolumn yyoffset)
                          (make-tok lbrack-tok        yytext yyline yycolumn)
        ))
    #t
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yytext yyline yycolumn yyoffset)
                          (make-tok lbrack-rbrack-tok yytext yyline yycolumn)
        ))
    #t
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yytext yyline yycolumn yyoffset)
                          (make-tok lbrack-caret-tok  yytext yyline yycolumn)
        ))
    #t
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yytext yyline yycolumn yyoffset)
                          (make-tok lbrack-minus-tok  yytext yyline yycolumn)
        ))
    #t
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yytext yyline yycolumn yyoffset)
                          (parse-id-ref               yytext yyline yycolumn)
        ))
    #t
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yytext yyline yycolumn yyoffset)
                          (parse-power-m              yytext yyline yycolumn)
        ))
    #t
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yytext yyline yycolumn yyoffset)
                          (parse-power-m-inf          yytext yyline yycolumn)
        ))
    #t
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yytext yyline yycolumn yyoffset)
                          (parse-power-m-n            yytext yyline yycolumn)
        ))
    #t
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yytext yyline yycolumn yyoffset)
                          (make-tok illegal-tok       yytext yyline yycolumn)
        ))
    #t
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yytext yyline yycolumn yyoffset)
                          (make-tok doublequote-tok   yytext yyline yycolumn)
        ))
    #t
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yytext yyline yycolumn yyoffset)
                          (parse-spec-char            yytext yyline yycolumn)
        ))
    #t
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yytext yyline yycolumn yyoffset)
                          (parse-digits-char          yytext yyline yycolumn)
        ))
    #t
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yytext yyline yycolumn yyoffset)
                          (parse-digits-char          yytext yyline yycolumn)
        ))
    #t
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yytext yyline yycolumn yyoffset)
                  	  (parse-hex-digits-char      yytext yyline yycolumn)
        ))
    #t
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yytext yyline yycolumn yyoffset)
                          (parse-quoted-char          yytext yyline yycolumn)
        ))
    #t
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yytext yyline yycolumn yyoffset)
                          (make-tok caret-tok         yytext yyline yycolumn)
        ))
    #t
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yytext yyline yycolumn yyoffset)
                          (make-tok dollar-tok        yytext yyline yycolumn)
        ))
    #t
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yytext yyline yycolumn yyoffset)
                          (parse-ordinary-char        yytext yyline yycolumn)
        ))
    #t
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yytext yyline yycolumn yyoffset)
                          (make-tok <<EOF>>-tok       yytext yyline yycolumn)
        ))
    #t
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yytext yyline yycolumn yyoffset)
                          (make-tok <<ERROR>>-tok     yytext yyline yycolumn)
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
          (user-action-13 #f)
          (user-action-14 #f)
          (user-action-15 #f)
          (user-action-16 #f)
          (user-action-17 #f)
          (user-action-18 #f)
          (user-action-19 #f)
          (user-action-20 #f)
          (user-action-21 #f)
          (user-action-22 #f)
          (user-action-23 #f)
          (user-action-24 #f)
          (user-action-25 #f)
          (user-action-26 #f)
          (user-action-27 #f)
          (user-action-28 #f)
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
             (let ((yytext (get-start-end-text)))
               (start-go-to-end)
               (user-action-10 yytext yyline yycolumn yyoffset))))
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
          (action-13
           (lambda (yyline yycolumn yyoffset)
             (let ((yytext (get-start-end-text)))
               (start-go-to-end)
               (user-action-13 yytext yyline yycolumn yyoffset))))
          (action-14
           (lambda (yyline yycolumn yyoffset)
             (let ((yytext (get-start-end-text)))
               (start-go-to-end)
               (user-action-14 yytext yyline yycolumn yyoffset))))
          (action-15
           (lambda (yyline yycolumn yyoffset)
             (let ((yytext (get-start-end-text)))
               (start-go-to-end)
               (user-action-15 yytext yyline yycolumn yyoffset))))
          (action-16
           (lambda (yyline yycolumn yyoffset)
             (let ((yytext (get-start-end-text)))
               (start-go-to-end)
               (user-action-16 yytext yyline yycolumn yyoffset))))
          (action-17
           (lambda (yyline yycolumn yyoffset)
             (let ((yytext (get-start-end-text)))
               (start-go-to-end)
               (user-action-17 yytext yyline yycolumn yyoffset))))
          (action-18
           (lambda (yyline yycolumn yyoffset)
             (let ((yytext (get-start-end-text)))
               (start-go-to-end)
               (user-action-18 yytext yyline yycolumn yyoffset))))
          (action-19
           (lambda (yyline yycolumn yyoffset)
             (let ((yytext (get-start-end-text)))
               (start-go-to-end)
               (user-action-19 yytext yyline yycolumn yyoffset))))
          (action-20
           (lambda (yyline yycolumn yyoffset)
             (let ((yytext (get-start-end-text)))
               (start-go-to-end)
               (user-action-20 yytext yyline yycolumn yyoffset))))
          (action-21
           (lambda (yyline yycolumn yyoffset)
             (let ((yytext (get-start-end-text)))
               (start-go-to-end)
               (user-action-21 yytext yyline yycolumn yyoffset))))
          (action-22
           (lambda (yyline yycolumn yyoffset)
             (let ((yytext (get-start-end-text)))
               (start-go-to-end)
               (user-action-22 yytext yyline yycolumn yyoffset))))
          (action-23
           (lambda (yyline yycolumn yyoffset)
             (let ((yytext (get-start-end-text)))
               (start-go-to-end)
               (user-action-23 yytext yyline yycolumn yyoffset))))
          (action-24
           (lambda (yyline yycolumn yyoffset)
             (let ((yytext (get-start-end-text)))
               (start-go-to-end)
               (user-action-24 yytext yyline yycolumn yyoffset))))
          (action-25
           (lambda (yyline yycolumn yyoffset)
             (let ((yytext (get-start-end-text)))
               (start-go-to-end)
               (user-action-25 yytext yyline yycolumn yyoffset))))
          (action-26
           (lambda (yyline yycolumn yyoffset)
             (let ((yytext (get-start-end-text)))
               (start-go-to-end)
               (user-action-26 yytext yyline yycolumn yyoffset))))
          (action-27
           (lambda (yyline yycolumn yyoffset)
             (let ((yytext (get-start-end-text)))
               (start-go-to-end)
               (user-action-27 yytext yyline yycolumn yyoffset))))
          (action-28
           (lambda (yyline yycolumn yyoffset)
             (let ((yytext (get-start-end-text)))
               (start-go-to-end)
               (user-action-28 yytext yyline yycolumn yyoffset))))
          (state-0
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (< c 46)
                       (if (< c 35)
                           (if (< c 11)
                               (if (< c 9)
                                   (state-2 action)
                                   (if (< c 10)
                                       (state-19 action)
                                       (state-17 action)))
                               (if (< c 33)
                                   (if (< c 32)
                                       (state-2 action)
                                       (state-19 action))
                                   (if (< c 34)
                                       (state-2 action)
                                       (state-7 action))))
                           (if (< c 41)
                               (if (< c 37)
                                   (if (< c 36)
                                       (state-5 action)
                                       (state-3 action))
                                   (if (< c 40)
                                       (state-2 action)
                                       (state-12 action)))
                               (if (< c 43)
                                   (if (< c 42)
                                       (state-11 action)
                                       (state-13 action))
                                   (if (< c 44)
                                       (state-14 action)
                                       (state-2 action)))))
                       (if (< c 91)
                           (if (< c 60)
                               (if (< c 47)
                                   (state-10 action)
                                   (if (< c 59)
                                       (state-2 action)
                                       (state-18 action)))
                               (if (< c 63)
                                   (if (< c 61)
                                       (state-1 action)
                                       (state-2 action))
                                   (if (< c 64)
                                       (state-15 action)
                                       (state-2 action))))
                           (if (< c 95)
                               (if (< c 93)
                                   (if (< c 92)
                                       (state-9 action)
                                       (state-6 action))
                                   (if (< c 94)
                                       (state-2 action)
                                       (state-4 action)))
                               (if (< c 124)
                                   (if (< c 123)
                                       (state-2 action)
                                       (state-8 action))
                                   (if (< c 125)
                                       (state-16 action)
                                       (state-2 action))))))
                   action))))
          (state-1
           (lambda (action)
             (end-go-to-point)
             (let ((c (read-char)))
               (if c
                   (if (= c 60)
                       (state-20 action-26)
                       action-26)
                   action-26))))
          (state-2
           (lambda (action)
             (end-go-to-point)
             action-26))
          (state-3
           (lambda (action)
             (end-go-to-point)
             action-25))
          (state-4
           (lambda (action)
             (end-go-to-point)
             action-24))
          (state-5
           (lambda (action)
             (end-go-to-point)
             (let ((c (read-char)))
               (if c
                   (if (= c 120)
                       (state-21 action-26)
                       action-26)
                   action-26))))
          (state-6
           (lambda (action)
             (end-go-to-point)
             (let ((c (read-char)))
               (if c
                   (if (< c 48)
                       (if (= c 45)
                           (state-23 action-26)
                           (state-22 action-26))
                       (if (< c 110)
                           (if (< c 58)
                               (state-24 action-26)
                               (state-22 action-26))
                           (if (< c 111)
                               (state-25 action-26)
                               (state-22 action-26))))
                   action-26))))
          (state-7
           (lambda (action)
             (end-go-to-point)
             action-18))
          (state-8
           (lambda (action)
             (end-go-to-point)
             (let ((c (read-char)))
               (if c
                   (if (< c 60)
                       (if (< c 44)
                           (if (< c 36)
                               (if (= c 33)
                                   (state-31 action-17)
                                   action-17)
                               (if (< c 42)
                                   (if (< c 39)
                                       (state-31 action-17)
                                       action-17)
                                   (if (< c 43)
                                       (state-31 action-17)
                                       (state-29 action-17))))
                           (if (< c 47)
                               (if (< c 45)
                                   action-17
                                   (if (< c 46)
                                       (state-27 action-17)
                                       (state-28 action-17)))
                               (if (< c 58)
                                   (if (< c 48)
                                       (state-31 action-17)
                                       (state-26 action-17))
                                   (if (< c 59)
                                       (state-31 action-17)
                                       action-17))))
                       (if (< c 96)
                           (if (< c 91)
                               (if (= c 64)
                                   action-17
                                   (state-31 action-17))
                               (if (< c 93)
                                   (if (< c 92)
                                       action-17
                                       (state-30 action-17))
                                   (if (< c 94)
                                       action-17
                                       (state-31 action-17))))
                           (if (< c 126)
                               (if (< c 97)
                                   action-17
                                   (if (< c 123)
                                       (state-31 action-17)
                                       action-17))
                               (if (< c 161)
                                   (if (< c 127)
                                       (state-31 action-17)
                                       action-17)
                                   (if (< c 17907978)
                                       (state-31 action-17)
                                       action-17)))))
                   action-17))))
          (state-9
           (lambda (action)
             (end-go-to-point)
             (let ((c (read-char)))
               (if c
                   (if (< c 93)
                       (if (= c 45)
                           (state-32 action-9)
                           action-9)
                       (if (< c 94)
                           (state-34 action-9)
                           (if (< c 95)
                               (state-33 action-9)
                               action-9)))
                   action-9))))
          (state-10
           (lambda (action)
             (end-go-to-point)
             action-8))
          (state-11
           (lambda (action)
             (end-go-to-point)
             action-7))
          (state-12
           (lambda (action)
             (end-go-to-point)
             action-6))
          (state-13
           (lambda (action)
             (end-go-to-point)
             action-5))
          (state-14
           (lambda (action)
             (end-go-to-point)
             action-4))
          (state-15
           (lambda (action)
             (end-go-to-point)
             action-3))
          (state-16
           (lambda (action)
             (end-go-to-point)
             action-2))
          (state-17
           (lambda (action)
             (end-go-to-point)
             action-1))
          (state-18
           (lambda (action)
             (end-go-to-point)
             (let ((c (read-char)))
               (if c
                   (if (= c 10)
                       action-0
                       (state-35 action-0))
                   action-0))))
          (state-19
           (lambda (action)
             (end-go-to-point)
             action-0))
          (state-20
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 69)
                       (state-36 action)
                       action)
                   action))))
          (state-21
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (< c 65)
                       (if (< c 48)
                           action
                           (if (< c 58)
                               (state-37 action)
                               action))
                       (if (< c 97)
                           (if (< c 71)
                               (state-37 action)
                               action)
                           (if (< c 103)
                               (state-37 action)
                               action)))
                   action))))
          (state-22
           (lambda (action)
             (end-go-to-point)
             action-23))
          (state-23
           (lambda (action)
             (end-go-to-point)
             (let ((c (read-char)))
               (if c
                   (if (< c 48)
                       action-23
                       (if (< c 58)
                           (state-38 action-23)
                           action-23))
                   action-23))))
          (state-24
           (lambda (action)
             (end-go-to-point)
             (let ((c (read-char)))
               (if c
                   (if (< c 48)
                       action-20
                       (if (< c 58)
                           (state-39 action-20)
                           action-20))
                   action-20))))
          (state-25
           (lambda (action)
             (end-go-to-point)
             action-19))
          (state-26
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (< c 48)
                       (if (= c 44)
                           (state-40 action)
                           action)
                       (if (< c 125)
                           (if (< c 58)
                               (state-26 action)
                               action)
                           (if (< c 126)
                               (state-41 action)
                               action)))
                   action))))
          (state-27
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (< c 63)
                       (if (< c 62)
                           action
                           (state-42 action))
                       (if (= c 125)
                           (state-43 action)
                           action))
                   action))))
          (state-28
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 46)
                       (state-44 action)
                       action)
                   action))))
          (state-29
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 125)
                       (state-43 action)
                       action)
                   action))))
          (state-30
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 120)
                       (state-45 action)
                       action)
                   action))))
          (state-31
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (< c 92)
                       (if (< c 42)
                           (if (< c 34)
                               (if (< c 33)
                                   action
                                   (state-31 action))
                               (if (< c 36)
                                   action
                                   (if (< c 39)
                                       (state-31 action)
                                       action)))
                           (if (< c 59)
                               (if (= c 44)
                                   action
                                   (state-31 action))
                               (if (< c 60)
                                   action
                                   (if (< c 91)
                                       (state-31 action)
                                       action))))
                       (if (< c 123)
                           (if (< c 94)
                               (if (< c 93)
                                   (state-46 action)
                                   action)
                               (if (= c 96)
                                   action
                                   (state-31 action)))
                           (if (< c 127)
                               (if (< c 125)
                                   action
                                   (if (< c 126)
                                       (state-43 action)
                                       (state-31 action)))
                               (if (< c 161)
                                   action
                                   (if (< c 17907978)
                                       (state-31 action)
                                       action)))))
                   action))))
          (state-32
           (lambda (action)
             (end-go-to-point)
             action-12))
          (state-33
           (lambda (action)
             (end-go-to-point)
             action-11))
          (state-34
           (lambda (action)
             (end-go-to-point)
             action-10))
          (state-35
           (lambda (action)
             (end-go-to-point)
             (let ((c (read-char)))
               (if c
                   (if (= c 10)
                       action-0
                       (state-35 action-0))
                   action-0))))
          (state-36
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (< c 80)
                       (if (< c 79)
                           action
                           (state-48 action))
                       (if (= c 82)
                           (state-47 action)
                           action))
                   action))))
          (state-37
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (< c 60)
                       (if (< c 58)
                           (if (< c 48)
                               action
                               (state-37 action))
                           (if (< c 59)
                               action
                               (state-49 action)))
                       (if (< c 71)
                           (if (< c 65)
                               action
                               (state-37 action))
                           (if (< c 97)
                               action
                               (if (< c 103)
                                   (state-37 action)
                                   action))))
                   action))))
          (state-38
           (lambda (action)
             (end-go-to-point)
             (let ((c (read-char)))
               (if c
                   (if (< c 48)
                       action-21
                       (if (< c 58)
                           (state-38 action-21)
                           action-21))
                   action-21))))
          (state-39
           (lambda (action)
             (end-go-to-point)
             (let ((c (read-char)))
               (if c
                   (if (< c 48)
                       action-20
                       (if (< c 58)
                           (state-39 action-20)
                           action-20))
                   action-20))))
          (state-40
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (< c 58)
                       (if (< c 48)
                           action
                           (state-50 action))
                       (if (= c 125)
                           (state-51 action)
                           action))
                   action))))
          (state-41
           (lambda (action)
             (end-go-to-point)
             action-14))
          (state-42
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (< c 92)
                       (if (< c 42)
                           (if (< c 34)
                               (if (< c 33)
                                   action
                                   (state-42 action))
                               (if (< c 36)
                                   action
                                   (if (< c 39)
                                       (state-42 action)
                                       action)))
                           (if (< c 59)
                               (if (= c 44)
                                   action
                                   (state-42 action))
                               (if (< c 60)
                                   action
                                   (if (< c 91)
                                       (state-42 action)
                                       action))))
                       (if (< c 123)
                           (if (< c 94)
                               (if (< c 93)
                                   (state-52 action)
                                   action)
                               (if (= c 96)
                                   action
                                   (state-42 action)))
                           (if (< c 127)
                               (if (< c 125)
                                   action
                                   (if (< c 126)
                                       (state-43 action)
                                       (state-42 action)))
                               (if (< c 161)
                                   action
                                   (if (< c 17907978)
                                       (state-42 action)
                                       action)))))
                   action))))
          (state-43
           (lambda (action)
             (end-go-to-point)
             action-13))
          (state-44
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 46)
                       (state-29 action)
                       action)
                   action))))
          (state-45
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (< c 65)
                       (if (< c 48)
                           action
                           (if (< c 58)
                               (state-53 action)
                               action))
                       (if (< c 97)
                           (if (< c 71)
                               (state-53 action)
                               action)
                           (if (< c 103)
                               (state-53 action)
                               action)))
                   action))))
          (state-46
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 120)
                       (state-54 action)
                       action)
                   action))))
          (state-47
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 82)
                       (state-55 action)
                       action)
                   action))))
          (state-48
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 70)
                       (state-56 action)
                       action)
                   action))))
          (state-49
           (lambda (action)
             (end-go-to-point)
             action-22))
          (state-50
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (< c 58)
                       (if (< c 48)
                           action
                           (state-50 action))
                       (if (= c 125)
                           (state-57 action)
                           action))
                   action))))
          (state-51
           (lambda (action)
             (end-go-to-point)
             action-15))
          (state-52
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 120)
                       (state-58 action)
                       action)
                   action))))
          (state-53
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (< c 60)
                       (if (< c 58)
                           (if (< c 48)
                               action
                               (state-53 action))
                           (if (< c 59)
                               action
                               (state-31 action)))
                       (if (< c 71)
                           (if (< c 65)
                               action
                               (state-53 action))
                           (if (< c 97)
                               action
                               (if (< c 103)
                                   (state-53 action)
                                   action))))
                   action))))
          (state-54
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (< c 65)
                       (if (< c 48)
                           action
                           (if (< c 58)
                               (state-59 action)
                               action))
                       (if (< c 97)
                           (if (< c 71)
                               (state-59 action)
                               action)
                           (if (< c 103)
                               (state-59 action)
                               action)))
                   action))))
          (state-55
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 79)
                       (state-60 action)
                       action)
                   action))))
          (state-56
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 62)
                       (state-61 action)
                       action)
                   action))))
          (state-57
           (lambda (action)
             (end-go-to-point)
             action-16))
          (state-58
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (< c 65)
                       (if (< c 48)
                           action
                           (if (< c 58)
                               (state-62 action)
                               action))
                       (if (< c 97)
                           (if (< c 71)
                               (state-62 action)
                               action)
                           (if (< c 103)
                               (state-62 action)
                               action)))
                   action))))
          (state-59
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (< c 60)
                       (if (< c 58)
                           (if (< c 48)
                               action
                               (state-59 action))
                           (if (< c 59)
                               action
                               (state-31 action)))
                       (if (< c 71)
                           (if (< c 65)
                               action
                               (state-59 action))
                           (if (< c 97)
                               action
                               (if (< c 103)
                                   (state-59 action)
                                   action))))
                   action))))
          (state-60
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 82)
                       (state-63 action)
                       action)
                   action))))
          (state-61
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 62)
                       (state-64 action)
                       action)
                   action))))
          (state-62
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (< c 60)
                       (if (< c 58)
                           (if (< c 48)
                               action
                               (state-62 action))
                           (if (< c 59)
                               action
                               (state-42 action)))
                       (if (< c 71)
                           (if (< c 65)
                               action
                               (state-62 action))
                           (if (< c 97)
                               action
                               (if (< c 103)
                                   (state-62 action)
                                   action))))
                   action))))
          (state-63
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 62)
                       (state-65 action)
                       action)
                   action))))
          (state-64
           (lambda (action)
             (end-go-to-point)
             action-27))
          (state-65
           (lambda (action)
             (let ((c (read-char)))
               (if c
                   (if (= c 62)
                       (state-66 action)
                       action)
                   action))))
          (state-66
           (lambda (action)
             (end-go-to-point)
             action-28))
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
       (set! user-action-13 ((vector-ref rules-pre-action 27)
                             final-lexer user-getc user-ungetc))
       (set! user-action-14 ((vector-ref rules-pre-action 29)
                             final-lexer user-getc user-ungetc))
       (set! user-action-15 ((vector-ref rules-pre-action 31)
                             final-lexer user-getc user-ungetc))
       (set! user-action-16 ((vector-ref rules-pre-action 33)
                             final-lexer user-getc user-ungetc))
       (set! user-action-17 ((vector-ref rules-pre-action 35)
                             final-lexer user-getc user-ungetc))
       (set! user-action-18 ((vector-ref rules-pre-action 37)
                             final-lexer user-getc user-ungetc))
       (set! user-action-19 ((vector-ref rules-pre-action 39)
                             final-lexer user-getc user-ungetc))
       (set! user-action-20 ((vector-ref rules-pre-action 41)
                             final-lexer user-getc user-ungetc))
       (set! user-action-21 ((vector-ref rules-pre-action 43)
                             final-lexer user-getc user-ungetc))
       (set! user-action-22 ((vector-ref rules-pre-action 45)
                             final-lexer user-getc user-ungetc))
       (set! user-action-23 ((vector-ref rules-pre-action 47)
                             final-lexer user-getc user-ungetc))
       (set! user-action-24 ((vector-ref rules-pre-action 49)
                             final-lexer user-getc user-ungetc))
       (set! user-action-25 ((vector-ref rules-pre-action 51)
                             final-lexer user-getc user-ungetc))
       (set! user-action-26 ((vector-ref rules-pre-action 53)
                             final-lexer user-getc user-ungetc))
       (set! user-action-27 ((vector-ref rules-pre-action 55)
                             final-lexer user-getc user-ungetc))
       (set! user-action-28 ((vector-ref rules-pre-action 57)
                             final-lexer user-getc user-ungetc))
       final-lexer))))

) ; end of library

