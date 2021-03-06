#!r6rs
(library (nausicaa email addresses quoted-text-lexer)
  (export
    quoted-text-table)
  (import (rnrs)
(nausicaa silex input-system)
(nausicaa email addresses common)
(nausicaa parser-tools lexical-token)
(nausicaa parser-tools source-location)
)

;
; Table generated from the file quoted-text.l by SILex 1.0
;

(define quoted-text-table
  (vector
   'all
   (lambda (yycontinue yygetc yyungetc)
     (lambda (yytext yyline yycolumn yyoffset)
       			(make-<lexical-token>
			 '*eoi*
			 (make-<source-location> #f yyline yycolumn yyoffset)
			 (eof-object)
			 0)
       ))
   (lambda (yycontinue yygetc yyungetc)
     (lambda (yytext yyline yycolumn yyoffset)
         		(make-<lexical-token>
			 '*lexer-error*
			 (make-<source-location> #f yyline yycolumn yyoffset)
			 yytext
			 (string-length yytext))

;;; end of file
       ))
   (vector
    #f
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yyline yycolumn yyoffset)
              		'QUOTED-TEXT-CLOSE
        ))
    #t
    (lambda (yycontinue yygetc yyungetc)
      (lambda (yytext yyline yycolumn yyoffset)
             		(unquote-string yytext)
        )))
   'decision-trees
   0
   0
   '#((35 (34 1 3) (= 92 2 1)) (35 (34 1 err) (= 92 2 1)) (= 92 2 1) err)
   '#((#f . #f) (1 . 1) (1 . 1) (0 . 0))))

) ; end of library

