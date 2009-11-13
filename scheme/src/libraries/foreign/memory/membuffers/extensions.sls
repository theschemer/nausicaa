;;; -*- coding: utf-8-unix -*-
;;;
;;;Part of: Nausicaa/Scheme
;;;Contents: record extensions for (foreign memory membuffers)
;;;Date: Mon Oct  5, 2009
;;;
;;;Abstract
;;;
;;;
;;;
;;;Copyright (c) 2009 Marco Maggi <marcomaggi@gna.org>
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


(library (foreign memory membuffers extensions)
  (export
    <buffer*>
    %buffer-empty?
    %buffer-full?
    %buffer-free-size
    %buffer-used-size)
  (import (rnrs)
    (records)
    (only (foreign ffi pointers)
	  pointer=? pointer-diff)
    (for (foreign memory membuffers types) expand run)
    (for (foreign memory memblocks) expand run))


(define (%buffer-empty? buf)
  (let-syntax ((pointer-used	(identifier-syntax (<buffer>-pointer-used buf)))
	       (pointer-free	(identifier-syntax (<buffer>-pointer-free buf))))
    (pointer=? pointer-used pointer-free)))

(define (%buffer-full? buf)
  (let-syntax ((pointer		(identifier-syntax (<buffer>-pointer      buf)))
	       (pointer-free	(identifier-syntax (<buffer>-pointer-free buf)))
	       (size		(identifier-syntax (<buffer>-size         buf))))
    (= size (pointer-diff pointer-free pointer))))

(define (%buffer-free-size buf)
  (let-syntax ((pointer		(identifier-syntax (<buffer>-pointer      buf)))
	       (pointer-free	(identifier-syntax (<buffer>-pointer-free buf)))
	       (size		(identifier-syntax (<buffer>-size         buf))))
    (- size (pointer-diff pointer-free pointer))))

(define (%buffer-used-size buf)
  (let-syntax ((pointer-used	(identifier-syntax (<buffer>-pointer-used buf)))
	       (pointer-free	(identifier-syntax (<buffer>-pointer-free buf))))
    (pointer-diff pointer-free pointer-used)))

(define-record-extension <buffer*>
  (parent <buffer>)
  (fields (empty?	%buffer-empty?		#f)
	  (full?	%buffer-full?		#f)
	  (used-size	%buffer-used-size	#f)
	  (free-size	%buffer-free-size	#f)))


;;;; done

)

;;; end of file
