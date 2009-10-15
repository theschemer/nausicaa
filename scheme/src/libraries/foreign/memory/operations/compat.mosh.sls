;;;
;;;Part of: Nausicaa/Scheme
;;;Contents: compatibility raw memory operations functions for Mosh
;;;Date: Tue Oct 13, 2009
;;;
;;;Abstract
;;;
;;;
;;;
;;;Copyright (c) 2008, 2009 Marco Maggi <marcomaggi@gna.org>
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


(library (foreign memory operations compat)
  (export memset memmove memcpy memcmp)
  (import (rnrs)
    (mosh ffi))

  (define self (open-shared-library ""))

  (define memset
    (make-c-function self 'void* 'memset '(void* int int)))

  (define memmove
    (make-c-function self 'void* 'memmove '(void* void* int)))

  (define memcpy
    (make-c-function self 'void* 'memcpy '(void* void* int)))

  (define memcmp
    (make-c-function self 'int 'memcmp '(void* void* int))))

;;; end of file