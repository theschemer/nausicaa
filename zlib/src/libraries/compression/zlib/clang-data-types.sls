;;; (compression zlib clang-data-types) --
;;;
;;;Part of: Nausicaa
;;;Contents: foreign library C language type mapping
;;;Date: Fri Jun 18, 2010
;;;
;;;Abstract
;;;
;;;
;;;
;;;Copyright (c) 2010 Marco Maggi <marco.maggi-ipsu@poste.it>
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


(library
  (compression zlib clang-data-types)
  (export
    clang-foreign-type->clang-external-type
    clang-maybe-foreign-type->clang-external-type
    enum-clang-foreign-types
    clang-foreign-types)
  (import (rnrs))
  (define-enumeration
    enum-clang-foreign-types
    (uInt uLong
          z_off_t
          z_streamp
          gz_headerp
          gzFile
          z_stream
          gz_header)
    clang-foreign-types)
  (define
    (clang-foreign-type->clang-external-type type)
    (case type
          ((uInt) 'unsigned-int)
          ((uLong) 'unsigned-int)
          ((z_off_t) 'unsigned-int)
          ((z_streamp) 'pointer)
          ((gz_headerp) 'pointer)
          ((gzFile) 'pointer)
          ((z_stream) 'z_stream)
          ((gz_header) 'gz_header)
          (else #f)))
  (define
    (clang-maybe-foreign-type->clang-external-type
      type)
    (or (clang-foreign-type->clang-external-type type)
        type)))


;;; end of file
