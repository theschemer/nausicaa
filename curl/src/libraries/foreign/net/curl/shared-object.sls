;;; -*- coding: utf-8-unix -*-
;;;
;;;Part of: Nausicaa/cURL
;;;Contents: curl library loader
;;;Date: Mon Nov 16, 2009
;;;
;;;Abstract
;;;
;;;
;;;
;;;Copyright (c) 2009 Marco Maggi <marco.maggi-ipsu@poste.it>
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


(library (foreign net curl shared-object)
  (export curl-shared-object)
  (import (rnrs)
    (foreign ffi)
    (foreign net curl sizeof))
  (define-shared-object curl-shared-object
    CURL_SHARED_OBJECT))

;;; end of file
