;;;
;;;Part of: Nausicaa/POSIX
;;;Contents: interface to the Linux file descriptor libraries
;;;Date: Fri Jan 22, 2010
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


(library (nausicaa linux fd)
  (export
    pipe2	pipe2-function
    )
  (import (rnrs)
    (nausicaa posix helpers)
    (prefix (nausicaa linux fd primitives) primitive:))


(define-parametrised pipe2 flags)




;;;; done

)

;;; end of file
