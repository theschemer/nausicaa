;;; Copyright (c) 2008 Derick Eddington
;;;
;;; Permission is  hereby granted, free of charge,  to any person
;;; obtaining   a   copy   of   this  software   and   associated
;;; documentation files (the "Software"), to deal in the Software
;;; without restriction, including  without limitation the rights
;;; to use, copy, modify, merge, publish, distribute, sublicense,
;;; and/or sell copies of the  Software, and to permit persons to
;;; whom  the Software  is furnished  to  do so,  subject to  the
;;; following conditions:
;;;
;;; The above  copyright notice and this  permission notice shall
;;; be  included in  all copies  or substantial  portions  of the
;;; Software.
;;;
;;; Except as contained in this  notice, the name(s) of the above
;;; copyright  holders  shall  not  be  used  in  advertising  or
;;; otherwise to promote the sale,  use or other dealings in this
;;; Software without prior written authorization.
;;;
;;; THE  SOFTWARE IS PROVIDED  "AS IS",  WITHOUT WARRANTY  OF ANY
;;; KIND, EXPRESS  OR IMPLIED, INCLUDING  BUT NOT LIMITED  TO THE
;;; WARRANTIES  OF  MERCHANTABILITY,  FITNESS  FOR  A  PARTICULAR
;;; PURPOSE AND  NONINFRINGEMENT.  IN NO EVENT  SHALL THE AUTHORS
;;; OR  COPYRIGHT HOLDERS  BE LIABLE  FOR ANY  CLAIM,  DAMAGES OR
;;; OTHER LIABILITY,  WHETHER IN AN  ACTION OF CONTRACT,  TORT OR
;;; OTHERWISE,  ARISING FROM, OUT  OF OR  IN CONNECTION  WITH THE
;;; SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#!r6rs
(import
  (rnrs)
  (rnrs mutable-pairs)
  (srfi format)
  (srfi lightweight-testing))

(check-set-mode! 'report-failed)

#;(define (format-lots n f fmt-str . args)
  (let loop ([i 0] [r #f])
    (if (= i n)
      r
      (loop (+ 1 i) (apply f fmt-str args)))))

(define-syntax expect
   (syntax-rules ()
     [(_ expected expr)
      (check expr => expected)]))

;;;===================================================

(expect (format "test ~s" 'me) (format #f "test ~a" "me"))

(expect  " 0.333" (format "~6,3F" 1/3)) ;;; "  .333" OK

(expect "  12" (format "~4F" 12))

(expect "  12.346" (format "~8,3F" 12.3456))

(expect "123.346" (format "~6,3F" 123.3456))

(expect "123.346" (format "~4,3F" 123.3456))

(expect "0.000+1.949i" (format "~8,3F" (sqrt -3.8)))

(expect " 32.00" (format "~6,2F" 32))

(expect "    32" (format "~6F" 32))

(expect "  32.0" (format "~6F" 32.)) ;; "   32." OK
;; NB: (not (and (exact? 32.) (integer? 32.)))

(expect "  3.2e46" (format "~8F" 32e45))

(expect " 3.2e-44" (format "~8,1F" 32e-45))

(expect "  3.2e21" (format "~8F" 32e20))

(expect "3200000.0" (format "~8F" 32e5)) ;; OK; prefer: "   3.2e6"

(expect "  3200.0" (format "~8F" 32e2)) ;; "   3200." OK

(expect " 3.20e11" (format "~8,2F" 32e10))

(expect "      1.2345" (format "~12F" 1.2345))

(expect "        1.23" (format "~12,2F" 1.2345))

(expect "       1.235" (format "~12,3F" 1.2345))

(expect "        0.000+1.949i" (format "~20,3F" (sqrt -3.8)))

(expect "0.000+1.949i" (format "~8,3F" (sqrt -3.8)))

(expect " 3.46e11" (format "~8,2F" 3.4567e11))

(expect "#0=(a b c . #0#)"
        (format "~w" (let ( (c (list 'a 'b 'c)) ) (set-cdr! (cddr c) c) c)))

(expect "
"
        (format "~A~A~&" (list->string (list #\newline)) ""))

(expect "a new test"
        (format "~a ~? ~a" 'a "~a" '(new) 'test))

(expect "a \"new\" test"
        (format "~a ~? ~a" 'a "~s" '("new") 'test))

;; from SLIB

(define-syntax test
   (syntax-rules ()
     [(test <format-args> <expected>)
      (check (apply format <format-args>) => <expected>)]))

(test '("abc") "abc")
(test '("~a" 10) "10")
(test '("~a" -1.2) "-1.2")
(test '("~a" a) "a")
(test '("~a" #t) "#t")
(test '("~a" #f) "#f")
(test '("~a" "abc") "abc")
(test '("~a" #(1 2 3)) "#(1 2 3)")
(test '("~a" ()) "()")
(test '("~a" (a)) "(a)")
(test '("~a" (a b)) "(a b)")
(test '("~a" (a (b c) d)) "(a (b c) d)")
(test '("~a" (a . b)) "(a . b)")
(test '("~a" (a (b c . d))) "(a (b c . d))")

; # argument test

(test '("~a ~a" 10 20) "10 20")
(test '("~a abc ~a def" 10 20) "10 abc 20 def")

; numerical test

(test '("~d" 100) "100")
(test '("~x" 100) "64")
(test '("~o" 100) "144")
(test '("~b" 100) "1100100")


; character test

(test '("~c" #\a) "a")


; tilde test

(test '("~~~~") "~~")


; whitespace character test

(test '("~%") "
")
(test '("~&") "
")
(test '("abc~&") "abc
")
(test '("abc~&def") "abc
def")
(test '("~&") "
")
(test '("~_~_~_") "   ")



; indirection test

(test '("~a ~? ~a" 10 "~a ~a" (20 30) 40) "10 20 30 40")



; slashify test

(test '("~s" "abc") "\"abc\"")
(test '("~s" "abc \\ abc") "\"abc \\\\ abc\"")
(test '("~a" "abc \\ abc") "abc \\ abc")
(test '("~s" "abc \" abc") "\"abc \\\" abc\"")
(test '("~a" "abc \" abc") "abc \" abc")
(test '("~s" #\space) "#\\space")
;(test '("~s" #\newline) "#\\newline")
(test '("~s" #\a) "#\\a")
(test '("~s" (a "b" c)) "(a \"b\" c)")
(test '("~a" (a "b" c)) "(a b c)")


; fixed floating points

  (test '("~6,2f" 3.14159) "  3.14")
  (test '("~6,1f" 3.14159) "   3.1")
  (test '("~6,0f" 3.14159) "    3.")
  (test '("~5,1f" 0) "  0.0")
  (test '("~10,7f" 3.14159) " 3.1415900")
  (test '("~10,7f" -3.14159) "-3.1415900")
  (test '("~6,3f" 0.0)    " 0.000")
  (test '("~6,4f" 0.007)  "  7e-3") ;; OK; prefer: "0.0070"
  (test '("~6,3f" 0.007)  "  7e-3") ;; OK; prefer: " 0.007"
  (test '("~6,2f" 0.007)  "  7e-3") ;; OK; prefer: "  0.01"
  (test '("~3,2f" 0.007)  "7e-3")   ;; OK; prefer:  ".01"
  (test '("~3,2f" -0.007) "-7e-3")  ;; OK; prefer: "-.01"
  (test '("~6,3f" 12345.6789) "12345.679")
  (test '("~6f" 23.4) "  23.4")
  (test '("~6f" 1234.5) "1234.5")
  (test '("~6f" 12345678) "12345678")
  (test '("~6,2f" 123.56789) "123.57")
  (test '("~6f" 123.0) " 123.0")
  (test '("~6f" -123.0) "-123.0")
  (test '("~6f" 0.0) "   0.0")
  (test '("~3,1f" 3.141) "3.1")
  (test '("~2,0f" 3.141) "3.")
  (test '("~1f" 3.141) "3.141")
  (test '("~f" 123.56789) "123.56789")
  (test '("~f" -314.0) "-314.0")
  (test '("~f" 1e4)       "1e4")       ;; OK; prefer: "10000.0"
  (test '("~f" -1.23e10)  "-1.23e10")  ;; OK
  (test '("~f" 1e-4)      "1e-4")      ;; OK; prefer: "0.0001"
  (test '("~f" -1.23e-10) "-1.23e-10") ;; OK


(check-report)

;; #!eof
