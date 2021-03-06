#!r6rs
(library (nausicaa r6rs parser-table)
  (export make-r6rs-parser)
  (import (rnrs) (nausicaa lalr lr-driver)
    (nausicaa parser-tools source-location)
    (nausicaa parser-tools lexical-token)
    (nausicaa language sentinel)
    (nausicaa r6rs datum-processing))
  (define (make-r6rs-parser)
    (lr-driver
      '#(((*default* . *error*) (OPAREN . 24) (OBRACKET . 25)
          (SHARPPAREN . 26) (SHARPVU8PAREN . 27) (TICK . 28)
          (BACKTICK . 29) (COMMA . 30) (COMMAAT . 31) (SHARPTICK . 32)
          (SHARPBACKTICK . 33) (SHARPCOMMA . 34) (SHARPCOMMAAT . 35)
          (WHITESPACE . 36) (LINEENDING . 37) (SHARPSEMICOLON . 38)
          (IDENTIFIER . 39) (BOOLEAN . 40) (NUMBER . 41)
          (CHARACTER . 42) (STRING . 43) (LINECOMMENT . 44)
          (NESTEDCOMMENT . 45) (SHARPBANGR6RS . 46) (SHARPBANG . 47))
         ((*default* . *error*) (*eoi* . 48)) ((*default* . -2))
         ((*default* . -3) (SHARPBANG . 47) (SHARPBANGR6RS . 46)
          (NESTEDCOMMENT . 45) (LINECOMMENT . 44) (STRING . 43)
          (CHARACTER . 42) (NUMBER . 41) (BOOLEAN . 40)
          (IDENTIFIER . 39) (SHARPSEMICOLON . 38) (LINEENDING . 37)
          (WHITESPACE . 36) (SHARPCOMMAAT . 35) (SHARPCOMMA . 34)
          (SHARPBACKTICK . 33) (SHARPTICK . 32) (COMMAAT . 31)
          (COMMA . 30) (BACKTICK . 29) (TICK . 28)
          (SHARPVU8PAREN . 27) (SHARPPAREN . 26) (OBRACKET . 25)
          (OPAREN . 24))
         ((*default* . -5)) ((*default* . -6)) ((*default* . -7))
         ((*default* . -9)) ((*default* . -8)) ((*default* . -12))
         ((*default* . -13)) ((*default* . -10)) ((*default* . -11))
         ((*default* . -14)) ((*default* . -15)) ((*default* . -16))
         ((*default* . -17)) ((*default* . -18)) ((*default* . -19))
         ((*default* . -20)) ((*default* . -21)) ((*default* . -22))
         ((*default* . -52) (SHARPBANG . 47) (SHARPBANGR6RS . 46) (NESTEDCOMMENT . 45)
           (LINECOMMENT . 44) (SHARPSEMICOLON . 38) (LINEENDING . 37)
           (WHITESPACE . 36))
         ((*default* . -56))
         ((*default* . *error*) (OPAREN . 24) (CPAREN . 54)
          (OBRACKET . 25) (SHARPPAREN . 26) (SHARPVU8PAREN . 27)
          (TICK . 28) (BACKTICK . 29) (COMMA . 30) (COMMAAT . 31)
          (SHARPTICK . 32) (SHARPBACKTICK . 33) (SHARPCOMMA . 34)
          (SHARPCOMMAAT . 35) (WHITESPACE . 36) (LINEENDING . 37)
          (SHARPSEMICOLON . 38) (IDENTIFIER . 39) (BOOLEAN . 40)
          (NUMBER . 41) (CHARACTER . 42) (STRING . 43)
          (LINECOMMENT . 44) (NESTEDCOMMENT . 45) (SHARPBANGR6RS . 46)
          (SHARPBANG . 47))
         ((*default* . *error*) (OPAREN . 24) (OBRACKET . 25)
          (CBRACKET . 57) (SHARPPAREN . 26) (SHARPVU8PAREN . 27)
          (TICK . 28) (BACKTICK . 29) (COMMA . 30) (COMMAAT . 31)
          (SHARPTICK . 32) (SHARPBACKTICK . 33) (SHARPCOMMA . 34)
          (SHARPCOMMAAT . 35) (WHITESPACE . 36) (LINEENDING . 37)
          (SHARPSEMICOLON . 38) (IDENTIFIER . 39) (BOOLEAN . 40)
          (NUMBER . 41) (CHARACTER . 42) (STRING . 43)
          (LINECOMMENT . 44) (NESTEDCOMMENT . 45) (SHARPBANGR6RS . 46)
          (SHARPBANG . 47))
         ((*default* . *error*) (OPAREN . 24) (CPAREN . 60)
          (OBRACKET . 25) (SHARPPAREN . 26) (SHARPVU8PAREN . 27)
          (TICK . 28) (BACKTICK . 29) (COMMA . 30) (COMMAAT . 31)
          (SHARPTICK . 32) (SHARPBACKTICK . 33) (SHARPCOMMA . 34)
          (SHARPCOMMAAT . 35) (WHITESPACE . 36) (LINEENDING . 37)
          (SHARPSEMICOLON . 38) (IDENTIFIER . 39) (BOOLEAN . 40)
          (NUMBER . 41) (CHARACTER . 42) (STRING . 43)
          (LINECOMMENT . 44) (NESTEDCOMMENT . 45) (SHARPBANGR6RS . 46)
          (SHARPBANG . 47))
         ((*default* . *error*) (OPAREN . 24) (CPAREN . 63)
          (OBRACKET . 25) (SHARPPAREN . 26) (SHARPVU8PAREN . 27)
          (TICK . 28) (BACKTICK . 29) (COMMA . 30) (COMMAAT . 31)
          (SHARPTICK . 32) (SHARPBACKTICK . 33) (SHARPCOMMA . 34)
          (SHARPCOMMAAT . 35) (WHITESPACE . 36) (LINEENDING . 37)
          (SHARPSEMICOLON . 38) (IDENTIFIER . 39) (BOOLEAN . 40)
          (NUMBER . 41) (CHARACTER . 42) (STRING . 43)
          (LINECOMMENT . 44) (NESTEDCOMMENT . 45) (SHARPBANGR6RS . 46)
          (SHARPBANG . 47))
         ((*default* . *error*) (OPAREN . 24) (OBRACKET . 25)
          (SHARPPAREN . 26) (SHARPVU8PAREN . 27) (TICK . 28)
          (BACKTICK . 29) (COMMA . 30) (COMMAAT . 31) (SHARPTICK . 32)
          (SHARPBACKTICK . 33) (SHARPCOMMA . 34) (SHARPCOMMAAT . 35)
          (WHITESPACE . 36) (LINEENDING . 37) (SHARPSEMICOLON . 38)
          (IDENTIFIER . 39) (BOOLEAN . 40) (NUMBER . 41)
          (CHARACTER . 42) (STRING . 43) (LINECOMMENT . 44)
          (NESTEDCOMMENT . 45) (SHARPBANGR6RS . 46) (SHARPBANG . 47))
         ((*default* . *error*) (OPAREN . 24) (OBRACKET . 25)
          (SHARPPAREN . 26) (SHARPVU8PAREN . 27) (TICK . 28)
          (BACKTICK . 29) (COMMA . 30) (COMMAAT . 31) (SHARPTICK . 32)
          (SHARPBACKTICK . 33) (SHARPCOMMA . 34) (SHARPCOMMAAT . 35)
          (WHITESPACE . 36) (LINEENDING . 37) (SHARPSEMICOLON . 38)
          (IDENTIFIER . 39) (BOOLEAN . 40) (NUMBER . 41)
          (CHARACTER . 42) (STRING . 43) (LINECOMMENT . 44)
          (NESTEDCOMMENT . 45) (SHARPBANGR6RS . 46) (SHARPBANG . 47))
         ((*default* . *error*) (OPAREN . 24) (OBRACKET . 25)
          (SHARPPAREN . 26) (SHARPVU8PAREN . 27) (TICK . 28)
          (BACKTICK . 29) (COMMA . 30) (COMMAAT . 31) (SHARPTICK . 32)
          (SHARPBACKTICK . 33) (SHARPCOMMA . 34) (SHARPCOMMAAT . 35)
          (WHITESPACE . 36) (LINEENDING . 37) (SHARPSEMICOLON . 38)
          (IDENTIFIER . 39) (BOOLEAN . 40) (NUMBER . 41)
          (CHARACTER . 42) (STRING . 43) (LINECOMMENT . 44)
          (NESTEDCOMMENT . 45) (SHARPBANGR6RS . 46) (SHARPBANG . 47))
         ((*default* . *error*) (OPAREN . 24) (OBRACKET . 25)
          (SHARPPAREN . 26) (SHARPVU8PAREN . 27) (TICK . 28)
          (BACKTICK . 29) (COMMA . 30) (COMMAAT . 31) (SHARPTICK . 32)
          (SHARPBACKTICK . 33) (SHARPCOMMA . 34) (SHARPCOMMAAT . 35)
          (WHITESPACE . 36) (LINEENDING . 37) (SHARPSEMICOLON . 38)
          (IDENTIFIER . 39) (BOOLEAN . 40) (NUMBER . 41)
          (CHARACTER . 42) (STRING . 43) (LINECOMMENT . 44)
          (NESTEDCOMMENT . 45) (SHARPBANGR6RS . 46) (SHARPBANG . 47))
         ((*default* . *error*) (OPAREN . 24) (OBRACKET . 25)
          (SHARPPAREN . 26) (SHARPVU8PAREN . 27) (TICK . 28)
          (BACKTICK . 29) (COMMA . 30) (COMMAAT . 31) (SHARPTICK . 32)
          (SHARPBACKTICK . 33) (SHARPCOMMA . 34) (SHARPCOMMAAT . 35)
          (WHITESPACE . 36) (LINEENDING . 37) (SHARPSEMICOLON . 38)
          (IDENTIFIER . 39) (BOOLEAN . 40) (NUMBER . 41)
          (CHARACTER . 42) (STRING . 43) (LINECOMMENT . 44)
          (NESTEDCOMMENT . 45) (SHARPBANGR6RS . 46) (SHARPBANG . 47))
         ((*default* . *error*) (OPAREN . 24) (OBRACKET . 25)
          (SHARPPAREN . 26) (SHARPVU8PAREN . 27) (TICK . 28)
          (BACKTICK . 29) (COMMA . 30) (COMMAAT . 31) (SHARPTICK . 32)
          (SHARPBACKTICK . 33) (SHARPCOMMA . 34) (SHARPCOMMAAT . 35)
          (WHITESPACE . 36) (LINEENDING . 37) (SHARPSEMICOLON . 38)
          (IDENTIFIER . 39) (BOOLEAN . 40) (NUMBER . 41)
          (CHARACTER . 42) (STRING . 43) (LINECOMMENT . 44)
          (NESTEDCOMMENT . 45) (SHARPBANGR6RS . 46) (SHARPBANG . 47))
         ((*default* . *error*) (OPAREN . 24) (OBRACKET . 25)
          (SHARPPAREN . 26) (SHARPVU8PAREN . 27) (TICK . 28)
          (BACKTICK . 29) (COMMA . 30) (COMMAAT . 31) (SHARPTICK . 32)
          (SHARPBACKTICK . 33) (SHARPCOMMA . 34) (SHARPCOMMAAT . 35)
          (WHITESPACE . 36) (LINEENDING . 37) (SHARPSEMICOLON . 38)
          (IDENTIFIER . 39) (BOOLEAN . 40) (NUMBER . 41)
          (CHARACTER . 42) (STRING . 43) (LINECOMMENT . 44)
          (NESTEDCOMMENT . 45) (SHARPBANGR6RS . 46) (SHARPBANG . 47))
         ((*default* . *error*) (OPAREN . 24) (OBRACKET . 25)
          (SHARPPAREN . 26) (SHARPVU8PAREN . 27) (TICK . 28)
          (BACKTICK . 29) (COMMA . 30) (COMMAAT . 31) (SHARPTICK . 32)
          (SHARPBACKTICK . 33) (SHARPCOMMA . 34) (SHARPCOMMAAT . 35)
          (WHITESPACE . 36) (LINEENDING . 37) (SHARPSEMICOLON . 38)
          (IDENTIFIER . 39) (BOOLEAN . 40) (NUMBER . 41)
          (CHARACTER . 42) (STRING . 43) (LINECOMMENT . 44)
          (NESTEDCOMMENT . 45) (SHARPBANGR6RS . 46) (SHARPBANG . 47))
         ((*default* . -54)) ((*default* . -55))
         ((*default* . *error*) (OPAREN . 24) (OBRACKET . 25)
          (SHARPPAREN . 26) (SHARPVU8PAREN . 27) (TICK . 28)
          (BACKTICK . 29) (COMMA . 30) (COMMAAT . 31) (SHARPTICK . 32)
          (SHARPBACKTICK . 33) (SHARPCOMMA . 34) (SHARPCOMMAAT . 35)
          (WHITESPACE . 36) (LINEENDING . 37) (SHARPSEMICOLON . 38)
          (IDENTIFIER . 39) (BOOLEAN . 40) (NUMBER . 41)
          (CHARACTER . 42) (STRING . 43) (LINECOMMENT . 44)
          (NESTEDCOMMENT . 45) (SHARPBANGR6RS . 46) (SHARPBANG . 47))
         ((*default* . -23)) ((*default* . -24)) ((*default* . -25))
         ((*default* . -26)) ((*default* . -27)) ((*default* . -59))
         ((*default* . -60)) ((*default* . -61)) ((*default* . -62))
         ((*default* . -1) (*eoi* . accept)) ((*default* . -4))
         ((*default* . -57) (SHARPBANG . 47) (SHARPBANGR6RS . 46) (NESTEDCOMMENT . 45)
           (LINECOMMENT . 44) (SHARPSEMICOLON . 38) (LINEENDING . 37)
           (WHITESPACE . 36))
         ((*default* . -53))
         ((*default* . *error*) (OPAREN . 24) (CPAREN . 54)
          (OBRACKET . 25) (SHARPPAREN . 26) (SHARPVU8PAREN . 27)
          (TICK . 28) (BACKTICK . 29) (COMMA . 30) (COMMAAT . 31)
          (DOT . 77) (SHARPTICK . 32) (SHARPBACKTICK . 33)
          (SHARPCOMMA . 34) (SHARPCOMMAAT . 35) (WHITESPACE . 36)
          (LINEENDING . 37) (SHARPSEMICOLON . 38) (IDENTIFIER . 39)
          (BOOLEAN . 40) (NUMBER . 41) (CHARACTER . 42) (STRING . 43)
          (LINECOMMENT . 44) (NESTEDCOMMENT . 45) (SHARPBANGR6RS . 46)
          (SHARPBANG . 47))
         ((*default* . -30)) ((*default* . -32))
         ((*default* . *error*) (OPAREN . 24) (OBRACKET . 25)
          (CBRACKET . 57) (SHARPPAREN . 26) (SHARPVU8PAREN . 27)
          (TICK . 28) (BACKTICK . 29) (COMMA . 30) (COMMAAT . 31)
          (DOT . 80) (SHARPTICK . 32) (SHARPBACKTICK . 33)
          (SHARPCOMMA . 34) (SHARPCOMMAAT . 35) (WHITESPACE . 36)
          (LINEENDING . 37) (SHARPSEMICOLON . 38) (IDENTIFIER . 39)
          (BOOLEAN . 40) (NUMBER . 41) (CHARACTER . 42) (STRING . 43)
          (LINECOMMENT . 44) (NESTEDCOMMENT . 45) (SHARPBANGR6RS . 46)
          (SHARPBANG . 47))
         ((*default* . -31)) ((*default* . -35))
         ((*default* . *error*) (OPAREN . 24) (CPAREN . 60)
          (OBRACKET . 25) (SHARPPAREN . 26) (SHARPVU8PAREN . 27)
          (TICK . 28) (BACKTICK . 29) (COMMA . 30) (COMMAAT . 31)
          (SHARPTICK . 32) (SHARPBACKTICK . 33) (SHARPCOMMA . 34)
          (SHARPCOMMAAT . 35) (WHITESPACE . 36) (LINEENDING . 37)
          (SHARPSEMICOLON . 38) (IDENTIFIER . 39) (BOOLEAN . 40)
          (NUMBER . 41) (CHARACTER . 42) (STRING . 43)
          (LINECOMMENT . 44) (NESTEDCOMMENT . 45) (SHARPBANGR6RS . 46)
          (SHARPBANG . 47))
         ((*default* . -38)) ((*default* . -39))
         ((*default* . *error*) (OPAREN . 24) (CPAREN . 63)
          (OBRACKET . 25) (SHARPPAREN . 26) (SHARPVU8PAREN . 27)
          (TICK . 28) (BACKTICK . 29) (COMMA . 30) (COMMAAT . 31)
          (SHARPTICK . 32) (SHARPBACKTICK . 33) (SHARPCOMMA . 34)
          (SHARPCOMMAAT . 35) (WHITESPACE . 36) (LINEENDING . 37)
          (SHARPSEMICOLON . 38) (IDENTIFIER . 39) (BOOLEAN . 40)
          (NUMBER . 41) (CHARACTER . 42) (STRING . 43)
          (LINECOMMENT . 44) (NESTEDCOMMENT . 45) (SHARPBANGR6RS . 46)
          (SHARPBANG . 47))
         ((*default* . -41)) ((*default* . -42)) ((*default* . -44))
         ((*default* . -45)) ((*default* . -46)) ((*default* . -47))
         ((*default* . -48)) ((*default* . -49)) ((*default* . -50))
         ((*default* . -51)) ((*default* . -64))
         ((*default* . -22) (SHARPBANG . 47) (SHARPBANGR6RS . 46)
          (NESTEDCOMMENT . 45) (LINECOMMENT . 44) (STRING . 43)
          (CHARACTER . 42) (NUMBER . 41) (BOOLEAN . 40)
          (IDENTIFIER . 39) (SHARPSEMICOLON . 38) (LINEENDING . 37)
          (WHITESPACE . 36) (SHARPCOMMAAT . 35) (SHARPCOMMA . 34)
          (SHARPBACKTICK . 33) (SHARPTICK . 32) (COMMAAT . 31)
          (COMMA . 30) (BACKTICK . 29) (TICK . 28)
          (SHARPVU8PAREN . 27) (SHARPPAREN . 26) (OBRACKET . 25)
          (OPAREN . 24))
         ((*default* . -58))
         ((*default* . *error*) (OPAREN . 24) (CPAREN . 54)
          (OBRACKET . 25) (SHARPPAREN . 26) (SHARPVU8PAREN . 27)
          (TICK . 28) (BACKTICK . 29) (COMMA . 30) (COMMAAT . 31)
          (DOT . 84) (SHARPTICK . 32) (SHARPBACKTICK . 33)
          (SHARPCOMMA . 34) (SHARPCOMMAAT . 35) (WHITESPACE . 36)
          (LINEENDING . 37) (SHARPSEMICOLON . 38) (IDENTIFIER . 39)
          (BOOLEAN . 40) (NUMBER . 41) (CHARACTER . 42) (STRING . 43)
          (LINECOMMENT . 44) (NESTEDCOMMENT . 45) (SHARPBANGR6RS . 46)
          (SHARPBANG . 47))
         ((*default* . -34))
         ((*default* . *error*) (OPAREN . 24) (OBRACKET . 25)
          (SHARPPAREN . 26) (SHARPVU8PAREN . 27) (TICK . 28)
          (BACKTICK . 29) (COMMA . 30) (COMMAAT . 31) (SHARPTICK . 32)
          (SHARPBACKTICK . 33) (SHARPCOMMA . 34) (SHARPCOMMAAT . 35)
          (WHITESPACE . 36) (LINEENDING . 37) (SHARPSEMICOLON . 38)
          (IDENTIFIER . 39) (BOOLEAN . 40) (NUMBER . 41)
          (CHARACTER . 42) (STRING . 43) (LINECOMMENT . 44)
          (NESTEDCOMMENT . 45) (SHARPBANGR6RS . 46) (SHARPBANG . 47))
         ((*default* . *error*) (OPAREN . 24) (OBRACKET . 25)
          (CBRACKET . 57) (SHARPPAREN . 26) (SHARPVU8PAREN . 27)
          (TICK . 28) (BACKTICK . 29) (COMMA . 30) (COMMAAT . 31)
          (DOT . 86) (SHARPTICK . 32) (SHARPBACKTICK . 33)
          (SHARPCOMMA . 34) (SHARPCOMMAAT . 35) (WHITESPACE . 36)
          (LINEENDING . 37) (SHARPSEMICOLON . 38) (IDENTIFIER . 39)
          (BOOLEAN . 40) (NUMBER . 41) (CHARACTER . 42) (STRING . 43)
          (LINECOMMENT . 44) (NESTEDCOMMENT . 45) (SHARPBANGR6RS . 46)
          (SHARPBANG . 47))
         ((*default* . -37))
         ((*default* . *error*) (OPAREN . 24) (OBRACKET . 25)
          (SHARPPAREN . 26) (SHARPVU8PAREN . 27) (TICK . 28)
          (BACKTICK . 29) (COMMA . 30) (COMMAAT . 31) (SHARPTICK . 32)
          (SHARPBACKTICK . 33) (SHARPCOMMA . 34) (SHARPCOMMAAT . 35)
          (WHITESPACE . 36) (LINEENDING . 37) (SHARPSEMICOLON . 38)
          (IDENTIFIER . 39) (BOOLEAN . 40) (NUMBER . 41)
          (CHARACTER . 42) (STRING . 43) (LINECOMMENT . 44)
          (NESTEDCOMMENT . 45) (SHARPBANGR6RS . 46) (SHARPBANG . 47))
         ((*default* . -40)) ((*default* . -43)) ((*default* . -63))
         ((*default* . *error*) (OPAREN . 24) (OBRACKET . 25)
          (SHARPPAREN . 26) (SHARPVU8PAREN . 27) (TICK . 28)
          (BACKTICK . 29) (COMMA . 30) (COMMAAT . 31) (SHARPTICK . 32)
          (SHARPBACKTICK . 33) (SHARPCOMMA . 34) (SHARPCOMMAAT . 35)
          (WHITESPACE . 36) (LINEENDING . 37) (SHARPSEMICOLON . 38)
          (IDENTIFIER . 39) (BOOLEAN . 40) (NUMBER . 41)
          (CHARACTER . 42) (STRING . 43) (LINECOMMENT . 44)
          (NESTEDCOMMENT . 45) (SHARPBANGR6RS . 46) (SHARPBANG . 47))
         ((*default* . *error*) (CPAREN . 89))
         ((*default* . *error*) (OPAREN . 24) (OBRACKET . 25)
          (SHARPPAREN . 26) (SHARPVU8PAREN . 27) (TICK . 28)
          (BACKTICK . 29) (COMMA . 30) (COMMAAT . 31) (SHARPTICK . 32)
          (SHARPBACKTICK . 33) (SHARPCOMMA . 34) (SHARPCOMMAAT . 35)
          (WHITESPACE . 36) (LINEENDING . 37) (SHARPSEMICOLON . 38)
          (IDENTIFIER . 39) (BOOLEAN . 40) (NUMBER . 41)
          (CHARACTER . 42) (STRING . 43) (LINECOMMENT . 44)
          (NESTEDCOMMENT . 45) (SHARPBANGR6RS . 46) (SHARPBANG . 47))
         ((*default* . *error*) (CBRACKET . 91))
         ((*default* . *error*) (CPAREN . 92)) ((*default* . -28))
         ((*default* . *error*) (CBRACKET . 93)) ((*default* . -29))
         ((*default* . -33)) ((*default* . -36)))
      (vector
       '((28 . 23) (26 . 22) (25 . 21) (24 . 20) (23 . 19) (22 . 18)
         (21 . 17) (20 . 16) (19 . 15) (18 . 14) (17 . 13) (15 . 12)
         (13 . 11) (10 . 10) (9 . 9) (8 . 8) (7 . 7) (6 . 6) (5 . 5)
         (4 . 4) (3 . 3) (2 . 2) (1 . 1))
       '() '()
       '((28 . 23) (26 . 22) (25 . 21) (24 . 20) (23 . 19) (22 . 18)
         (21 . 17) (20 . 16) (19 . 15) (18 . 14) (17 . 13) (15 . 12)
         (13 . 11) (10 . 10) (9 . 9) (8 . 8) (7 . 7) (6 . 6) (5 . 5)
         (4 . 4) (3 . 3) (2 . 49))
       '() '() '() '() '() '() '() '() '() '() '() '() '() '() '()
       '() '() '() '((28 . 23) (27 . 51) (26 . 50)) '()
       '((28 . 23) (26 . 22) (25 . 21) (24 . 20) (23 . 19) (22 . 18)
         (21 . 17) (20 . 16) (19 . 15) (18 . 14) (17 . 13) (15 . 12)
         (13 . 11) (11 . 53) (10 . 10) (9 . 9) (8 . 8) (7 . 7)
         (6 . 6) (5 . 5) (4 . 4) (3 . 52))
       '((28 . 23) (26 . 22) (25 . 21) (24 . 20) (23 . 19) (22 . 18)
         (21 . 17) (20 . 16) (19 . 15) (18 . 14) (17 . 13) (15 . 12)
         (13 . 11) (12 . 56) (10 . 10) (9 . 9) (8 . 8) (7 . 7)
         (6 . 6) (5 . 5) (4 . 4) (3 . 55))
       '((28 . 23) (26 . 22) (25 . 21) (24 . 20) (23 . 19) (22 . 18)
         (21 . 17) (20 . 16) (19 . 15) (18 . 14) (17 . 13) (15 . 12)
         (14 . 59) (13 . 11) (10 . 10) (9 . 9) (8 . 8) (7 . 7)
         (6 . 6) (5 . 5) (4 . 4) (3 . 58))
       '((28 . 23) (26 . 22) (25 . 21) (24 . 20) (23 . 19) (22 . 18)
         (21 . 17) (20 . 16) (19 . 15) (18 . 14) (17 . 13) (16 . 62)
         (15 . 12) (13 . 11) (10 . 10) (9 . 9) (8 . 8) (7 . 7)
         (6 . 6) (5 . 5) (4 . 4) (3 . 61))
       '((28 . 23) (26 . 22) (25 . 21) (24 . 20) (23 . 19) (22 . 18)
         (21 . 17) (20 . 16) (19 . 15) (18 . 14) (17 . 13) (15 . 12)
         (13 . 11) (10 . 10) (9 . 9) (8 . 8) (7 . 7) (6 . 6) (5 . 5)
         (4 . 4) (3 . 64))
       '((28 . 23) (26 . 22) (25 . 21) (24 . 20) (23 . 19) (22 . 18)
         (21 . 17) (20 . 16) (19 . 15) (18 . 14) (17 . 13) (15 . 12)
         (13 . 11) (10 . 10) (9 . 9) (8 . 8) (7 . 7) (6 . 6) (5 . 5)
         (4 . 4) (3 . 65))
       '((28 . 23) (26 . 22) (25 . 21) (24 . 20) (23 . 19) (22 . 18)
         (21 . 17) (20 . 16) (19 . 15) (18 . 14) (17 . 13) (15 . 12)
         (13 . 11) (10 . 10) (9 . 9) (8 . 8) (7 . 7) (6 . 6) (5 . 5)
         (4 . 4) (3 . 66))
       '((28 . 23) (26 . 22) (25 . 21) (24 . 20) (23 . 19) (22 . 18)
         (21 . 17) (20 . 16) (19 . 15) (18 . 14) (17 . 13) (15 . 12)
         (13 . 11) (10 . 10) (9 . 9) (8 . 8) (7 . 7) (6 . 6) (5 . 5)
         (4 . 4) (3 . 67))
       '((28 . 23) (26 . 22) (25 . 21) (24 . 20) (23 . 19) (22 . 18)
         (21 . 17) (20 . 16) (19 . 15) (18 . 14) (17 . 13) (15 . 12)
         (13 . 11) (10 . 10) (9 . 9) (8 . 8) (7 . 7) (6 . 6) (5 . 5)
         (4 . 4) (3 . 68))
       '((28 . 23) (26 . 22) (25 . 21) (24 . 20) (23 . 19) (22 . 18)
         (21 . 17) (20 . 16) (19 . 15) (18 . 14) (17 . 13) (15 . 12)
         (13 . 11) (10 . 10) (9 . 9) (8 . 8) (7 . 7) (6 . 6) (5 . 5)
         (4 . 4) (3 . 69))
       '((28 . 23) (26 . 22) (25 . 21) (24 . 20) (23 . 19) (22 . 18)
         (21 . 17) (20 . 16) (19 . 15) (18 . 14) (17 . 13) (15 . 12)
         (13 . 11) (10 . 10) (9 . 9) (8 . 8) (7 . 7) (6 . 6) (5 . 5)
         (4 . 4) (3 . 70))
       '((28 . 23) (26 . 22) (25 . 21) (24 . 20) (23 . 19) (22 . 18)
         (21 . 17) (20 . 16) (19 . 15) (18 . 14) (17 . 13) (15 . 12)
         (13 . 11) (10 . 10) (9 . 9) (8 . 8) (7 . 7) (6 . 6) (5 . 5)
         (4 . 4) (3 . 71))
       '() '()
       '((28 . 23) (26 . 22) (25 . 73) (24 . 20) (23 . 19) (22 . 18)
         (21 . 17) (20 . 16) (19 . 15) (18 . 14) (17 . 13) (15 . 12)
         (13 . 11) (10 . 10) (9 . 9) (8 . 8) (7 . 7) (6 . 6) (5 . 5)
         (4 . 4) (3 . 72))
       '() '() '() '() '() '() '() '() '() '() '()
       '((28 . 23) (27 . 74) (26 . 50)) '()
       '((28 . 23) (26 . 22) (25 . 21) (24 . 20) (23 . 19) (22 . 18)
         (21 . 17) (20 . 16) (19 . 15) (18 . 14) (17 . 13) (15 . 12)
         (13 . 11) (11 . 76) (10 . 10) (9 . 9) (8 . 8) (7 . 7)
         (6 . 6) (5 . 5) (4 . 4) (3 . 75))
       '() '()
       '((28 . 23) (26 . 22) (25 . 21) (24 . 20) (23 . 19) (22 . 18)
         (21 . 17) (20 . 16) (19 . 15) (18 . 14) (17 . 13) (15 . 12)
         (13 . 11) (12 . 79) (10 . 10) (9 . 9) (8 . 8) (7 . 7)
         (6 . 6) (5 . 5) (4 . 4) (3 . 78))
       '() '()
       '((28 . 23) (26 . 22) (25 . 21) (24 . 20) (23 . 19) (22 . 18)
         (21 . 17) (20 . 16) (19 . 15) (18 . 14) (17 . 13) (15 . 12)
         (14 . 81) (13 . 11) (10 . 10) (9 . 9) (8 . 8) (7 . 7)
         (6 . 6) (5 . 5) (4 . 4) (3 . 58))
       '() '()
       '((28 . 23) (26 . 22) (25 . 21) (24 . 20) (23 . 19) (22 . 18)
         (21 . 17) (20 . 16) (19 . 15) (18 . 14) (17 . 13) (16 . 82)
         (15 . 12) (13 . 11) (10 . 10) (9 . 9) (8 . 8) (7 . 7)
         (6 . 6) (5 . 5) (4 . 4) (3 . 61))
       '() '() '() '() '() '() '() '() '() '() '()
       '((28 . 23) (26 . 22) (25 . 21) (24 . 20) (23 . 19) (22 . 18)
         (21 . 17) (20 . 16) (19 . 15) (18 . 14) (17 . 13) (15 . 12)
         (13 . 11) (10 . 10) (9 . 9) (8 . 8) (7 . 7) (6 . 6) (5 . 5)
         (4 . 4) (3 . 83))
       '()
       '((28 . 23) (26 . 22) (25 . 21) (24 . 20) (23 . 19) (22 . 18)
         (21 . 17) (20 . 16) (19 . 15) (18 . 14) (17 . 13) (15 . 12)
         (13 . 11) (11 . 76) (10 . 10) (9 . 9) (8 . 8) (7 . 7)
         (6 . 6) (5 . 5) (4 . 4) (3 . 75))
       '()
       '((28 . 23) (26 . 22) (25 . 21) (24 . 20) (23 . 19) (22 . 18)
         (21 . 17) (20 . 16) (19 . 15) (18 . 14) (17 . 13) (15 . 12)
         (13 . 11) (10 . 10) (9 . 9) (8 . 8) (7 . 7) (6 . 6) (5 . 5)
         (4 . 4) (3 . 85))
       '((28 . 23) (26 . 22) (25 . 21) (24 . 20) (23 . 19) (22 . 18)
         (21 . 17) (20 . 16) (19 . 15) (18 . 14) (17 . 13) (15 . 12)
         (13 . 11) (12 . 79) (10 . 10) (9 . 9) (8 . 8) (7 . 7)
         (6 . 6) (5 . 5) (4 . 4) (3 . 78))
       '()
       '((28 . 23) (26 . 22) (25 . 21) (24 . 20) (23 . 19) (22 . 18)
         (21 . 17) (20 . 16) (19 . 15) (18 . 14) (17 . 13) (15 . 12)
         (13 . 11) (10 . 10) (9 . 9) (8 . 8) (7 . 7) (6 . 6) (5 . 5)
         (4 . 4) (3 . 87))
       '() '() '()
       '((28 . 23) (26 . 22) (25 . 21) (24 . 20) (23 . 19) (22 . 18)
         (21 . 17) (20 . 16) (19 . 15) (18 . 14) (17 . 13) (15 . 12)
         (13 . 11) (10 . 10) (9 . 9) (8 . 8) (7 . 7) (6 . 6) (5 . 5)
         (4 . 4) (3 . 88))
       '()
       '((28 . 23) (26 . 22) (25 . 21) (24 . 20) (23 . 19) (22 . 18)
         (21 . 17) (20 . 16) (19 . 15) (18 . 14) (17 . 13) (15 . 12)
         (13 . 11) (10 . 10) (9 . 9) (8 . 8) (7 . 7) (6 . 6) (5 . 5)
         (4 . 4) (3 . 90))
       '() '() '() '() '() '() '())
      (vector '()
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $2 $1 . yy-stack-values)
         $1)
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $1 . yy-stack-values)
         (yy-reduce-pop-and-push 1 1 ((list-of-datums-maker) yypushback yycustom $1)
           yy-stack-states yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $1 . yy-stack-values)
         (yy-reduce-pop-and-push 1 2 (list $1) yy-stack-states
           yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $2 $1 . yy-stack-values)
         (yy-reduce-pop-and-push 2 2 (cons $1 $2) yy-stack-states
           yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $1 . yy-stack-values)
         (yy-reduce-pop-and-push 1 3 $1 yy-stack-states
           yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $1 . yy-stack-values)
         (yy-reduce-pop-and-push 1 3 $1 yy-stack-states
           yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $1 . yy-stack-values)
         (yy-reduce-pop-and-push 1 3 $1 yy-stack-states
           yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $1 . yy-stack-values)
         (yy-reduce-pop-and-push 1 3 $1 yy-stack-states
           yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $1 . yy-stack-values)
         (yy-reduce-pop-and-push 1 3 $1 yy-stack-states
           yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $1 . yy-stack-values)
         (yy-reduce-pop-and-push 1 3 $1 yy-stack-states
           yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $1 . yy-stack-values)
         (yy-reduce-pop-and-push 1 3 $1 yy-stack-states
           yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $1 . yy-stack-values)
         (yy-reduce-pop-and-push 1 3 $1 yy-stack-states
           yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $1 . yy-stack-values)
         (yy-reduce-pop-and-push 1 3 $1 yy-stack-states
           yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $1 . yy-stack-values)
         (yy-reduce-pop-and-push 1 3 $1 yy-stack-states
           yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $1 . yy-stack-values)
         (yy-reduce-pop-and-push 1 3 $1 yy-stack-states
           yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $1 . yy-stack-values)
         (yy-reduce-pop-and-push 1 3 $1 yy-stack-states
           yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $1 . yy-stack-values)
         (yy-reduce-pop-and-push 1 3 $1 yy-stack-states
           yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $1 . yy-stack-values)
         (yy-reduce-pop-and-push 1 3 $1 yy-stack-states
           yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $1 . yy-stack-values)
         (yy-reduce-pop-and-push 1 3 $1 yy-stack-states
           yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $1 . yy-stack-values)
         (yy-reduce-pop-and-push 1 3 $1 yy-stack-states
           yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $1 . yy-stack-values)
         (yy-reduce-pop-and-push 1 3 $1 yy-stack-states
           yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $1 . yy-stack-values)
         (yy-reduce-pop-and-push 1 3 $1 yy-stack-states
           yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $1 . yy-stack-values)
         (yy-reduce-pop-and-push 1 4 ((identifier-datum-maker) yypushback yycustom $1)
           yy-stack-states yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $1 . yy-stack-values)
         (yy-reduce-pop-and-push 1 5 ((boolean-datum-maker) yypushback yycustom $1)
           yy-stack-states yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $1 . yy-stack-values)
         (yy-reduce-pop-and-push 1 6 ((number-datum-maker) yypushback yycustom $1)
           yy-stack-states yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $1 . yy-stack-values)
         (yy-reduce-pop-and-push 1 7 ((character-datum-maker) yypushback yycustom $1)
           yy-stack-states yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $1 . yy-stack-values)
         (yy-reduce-pop-and-push 1 8 ((string-datum-maker) yypushback yycustom $1)
           yy-stack-states yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $5 $4 $3 $2 $1 . yy-stack-values)
         (yy-reduce-pop-and-push 5 9 ((pair-datum-maker) yypushback yycustom $2 $4)
           yy-stack-states yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $5 $4 $3 $2 $1 . yy-stack-values)
         (yy-reduce-pop-and-push 5 9 ((pair-datum-maker) yypushback yycustom $2 $4)
           yy-stack-states yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $2 $1 . yy-stack-values)
         (yy-reduce-pop-and-push 2 10 ((list-datum-maker) yypushback yycustom $2)
           yy-stack-states yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $2 $1 . yy-stack-values)
         (yy-reduce-pop-and-push 2 10 ((list-datum-maker) yypushback yycustom $2)
           yy-stack-states yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $1 . yy-stack-values)
         (yy-reduce-pop-and-push 1 11 '() yy-stack-states
           yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $4 $3 $2 $1 . yy-stack-values)
         (yy-reduce-pop-and-push 4 11 (cons $1 $3) yy-stack-states
           yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $2 $1 . yy-stack-values)
         (yy-reduce-pop-and-push 2 11 (cons $1 $2) yy-stack-states
           yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $1 . yy-stack-values)
         (yy-reduce-pop-and-push 1 12 '() yy-stack-states
           yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $4 $3 $2 $1 . yy-stack-values)
         (yy-reduce-pop-and-push 4 12 (cons $1 $3) yy-stack-states
           yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $2 $1 . yy-stack-values)
         (yy-reduce-pop-and-push 2 12 (cons $1 $2) yy-stack-states
           yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $2 $1 . yy-stack-values)
         (yy-reduce-pop-and-push 2 13 ((vector-datum-maker) yypushback yycustom $2)
           yy-stack-states yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $1 . yy-stack-values)
         (yy-reduce-pop-and-push 1 14 '() yy-stack-states
           yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $2 $1 . yy-stack-values)
         (yy-reduce-pop-and-push 2 14 (cons $1 $2) yy-stack-states
           yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $2 $1 . yy-stack-values)
         (yy-reduce-pop-and-push 2 15 ((bytevector-datum-maker) yypushback yycustom $2)
           yy-stack-states yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $1 . yy-stack-values)
         (yy-reduce-pop-and-push 1 16 '() yy-stack-states
           yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $2 $1 . yy-stack-values)
         (yy-reduce-pop-and-push 2 16 (cons $1 $2) yy-stack-states
           yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $2 $1 . yy-stack-values)
         (yy-reduce-pop-and-push 2 17 ((quoted-datum-maker) yypushback yycustom $2)
           yy-stack-states yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $2 $1 . yy-stack-values)
         (yy-reduce-pop-and-push 2 18 ((quasiquoted-datum-maker) yypushback yycustom $2)
           yy-stack-states yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $2 $1 . yy-stack-values)
         (yy-reduce-pop-and-push 2 19 ((unquoted-datum-maker) yypushback yycustom $2)
           yy-stack-states yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $2 $1 . yy-stack-values)
         (yy-reduce-pop-and-push 2 20
           ((unquoted-splicing-datum-maker) yypushback yycustom $2)
           yy-stack-states yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $2 $1 . yy-stack-values)
         (yy-reduce-pop-and-push 2 21 ((syntax-datum-maker) yypushback yycustom $2)
           yy-stack-states yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $2 $1 . yy-stack-values)
         (yy-reduce-pop-and-push 2 22 ((quasisyntax-datum-maker) yypushback yycustom $2)
           yy-stack-states yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $2 $1 . yy-stack-values)
         (yy-reduce-pop-and-push 2 23 ((unsyntax-datum-maker) yypushback yycustom $2)
           yy-stack-states yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $2 $1 . yy-stack-values)
         (yy-reduce-pop-and-push 2 24
           ((unsyntax-splicing-datum-maker) yypushback yycustom $2)
           yy-stack-states yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $1 . yy-stack-values)
         (yy-reduce-pop-and-push 1 25
           ((interlexeme-space-datum-maker)
             yypushback
             yycustom
             (list $1))
           yy-stack-states yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $2 $1 . yy-stack-values)
         (yy-reduce-pop-and-push 2 25
           ((interlexeme-space-datum-maker)
             yypushback
             yycustom
             (cons $1 $2))
           yy-stack-states yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $1 . yy-stack-values)
         (yy-reduce-pop-and-push 1 26 ((whitespace-datum-maker) yypushback yycustom $1)
           yy-stack-states yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $1 . yy-stack-values)
         (yy-reduce-pop-and-push 1 26 ((whitespace-datum-maker) yypushback yycustom $1)
           yy-stack-states yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $1 . yy-stack-values)
         (yy-reduce-pop-and-push 1 26 $1 yy-stack-states
           yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $1 . yy-stack-values)
         (yy-reduce-pop-and-push 1 27 (list $1) yy-stack-states
           yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $2 $1 . yy-stack-values)
         (yy-reduce-pop-and-push 2 27 (cons $1 $2) yy-stack-states
           yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $1 . yy-stack-values)
         (yy-reduce-pop-and-push 1 28 ((line-comment-datum-maker) yypushback yycustom $1)
           yy-stack-states yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $1 . yy-stack-values)
         (yy-reduce-pop-and-push 1 28 ((nested-comment-datum-maker) yypushback yycustom $1)
           yy-stack-states yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $1 . yy-stack-values)
         (yy-reduce-pop-and-push 1 28 ((sharp-bang-r6rs-datum-maker) yypushback yycustom $1)
           yy-stack-states yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $1 . yy-stack-values)
         (yy-reduce-pop-and-push 1 28 ((sharp-bang-datum-maker) yypushback yycustom $1)
           yy-stack-states yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $3 $2 $1 . yy-stack-values)
         (yy-reduce-pop-and-push 3 28
           ((sharp-semicolon-datum-maker) yypushback yycustom $2 $3)
           yy-stack-states yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $2 $1 . yy-stack-values)
         (yy-reduce-pop-and-push 2 28
           ((sharp-semicolon-datum-maker) yypushback yycustom #f $2)
           yy-stack-states yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $2 $1 . yy-stack-values)
         (yy-reduce-pop-and-push 2 29 sentinel yy-stack-states
           yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $2 $1 . yy-stack-values)
         (yy-reduce-pop-and-push 2 30 sentinel yy-stack-states
           yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $2 $1 . yy-stack-values)
         (yy-reduce-pop-and-push 2 30 (cons $1 $2) yy-stack-states
           yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $2 $1 . yy-stack-values)
         (yy-reduce-pop-and-push 2 31 sentinel yy-stack-states
           yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $2 $1 . yy-stack-values)
         (yy-reduce-pop-and-push 2 32 sentinel yy-stack-states
           yy-stack-values))
       (lambda (yy-reduce-pop-and-push yypushback yycustom
                yy-stack-states $2 $1 . yy-stack-values)
         (yy-reduce-pop-and-push 2 32 (cons $1 $2) yy-stack-states
           yy-stack-values))))))
