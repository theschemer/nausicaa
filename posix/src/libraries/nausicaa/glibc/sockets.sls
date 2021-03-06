;;; -*- coding: utf-8-unix -*-
;;;
;;;Part of: Nausicaa/POSIX
;;;Contents: parametrised interface to sockets functions
;;;Date: Tue Jan 19, 2010
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


(library (nausicaa glibc sockets)
  (export

    ;; host names
    gethostbyname2		gethostbyname2_r
    gethostbyname_r		gethostbyaddr_r
    )
  (import (rnrs)
    (nausicaa posix helpers)
    (nausicaa posix typedefs)
    (prefix (nausicaa glibc sockets primitives) primitive:))


(define-parametrised gethostbyname2 host-name address-format)
(define-parametrised gethostbyname_r host-name)
(define-parametrised gethostbyname2_r host-name address-format)
(define-parametrised gethostbyaddr_r address-bytevector)


;;;; done

)

;;; end of file
