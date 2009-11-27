;;; -*- coding: utf-8-unix -*-
;;;
;;;Part of: Nausicaa/Scheme
;;;Contents: record type definitions for (foreign memory ---)
;;;Date: Tue Sep 29, 2009
;;;
;;;Abstract
;;;
;;;	Export  the definitions  of  the record  types  required by  the
;;;	various  (foreign  memory  ---)   libraries.   They  are  in  an
;;;	independent library so  that they can be made  available in both
;;;	the run and expand phases.
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


(library (foreign memory memblocks)
  (export
    <memblock>			<memblock-rtd>
    make-<memblock>		<memblock>?
    <memblock>-pointer		<memblock>-pointer-set!
    <memblock>-size		<memblock>-size-set!
    <memblock>-alloc-size	<memblock>-alloc-size-set!

    memblock-null
    memblock-shallow-clone	memblock-deep-clone
    memblock->string-hex	string-hex->memblock
    memblock-head		memblock-tail
    memblock-head?		memblock-tail?
    memblock&tail-head		memblock&head-tail
    )
  (import (rnrs)
    (rnrs mutable-strings)
    (foreign ffi pointers)
    (only (foreign ffi peekers-and-pokers)
	  pointer-ref-c-uint8
	  pointer-set-c-uint8!)
    (only (foreign memory operations) memcpy))


(define-record-type <memblock>
  (fields (mutable pointer)	 ;pointer to the allocated block
	  (mutable size)	 ;official number of bytes
	  (mutable alloc-size))) ;number of allocated bytes

(define <memblock-rtd>
  (record-type-descriptor <memblock>))

(define (memblock-null)
  (make-<memblock> pointer-null 0 0))

(define (memblock-shallow-clone mb)
  (make-<memblock> (<memblock>-pointer mb)
		   (<memblock>-size    mb)
		   #f))

(define (memblock-deep-clone mb malloc)
  (let* ((size (<memblock>-size mb))
	 (ptr  (malloc size)))
    (memcpy ptr (<memblock>-pointer mb) size)
    (make-<memblock> ptr size size)))


(define (memblock->string-hex mb)
  ;;Slow but fine for debugging purposes.
  ;;
  (let* ((ptr (<memblock>-pointer mb))
	 (len (<memblock>-size    mb))
	 (str (make-string (* 2 len))))
    (do ((i 0 (+ 1 i))
	 (j 0 (+ 1 j)))
	((= i len)
	 str)
      (let ((hex (number->string (pointer-ref-c-uint8 ptr i) 16)))
	(if (= 1 (string-length hex))
	    (begin
	      (string-set! str j #\0)
	      (set! j (+ 1 j))
	      (string-set! str j (string-ref hex 0)))
	  (begin
	    (string-set! str j (string-ref hex 0))
	    (set! j (+ 1 j))
	    (string-set! str j (string-ref hex 1))))))))

(define (string-hex->memblock str malloc)
  ;;Slow but fine for debugging purposes.
  ;;
  (let* ((len	(string-length str))
	 (size	(/ len 2))
	 (ptr	(malloc size)))
    (do ((i  0 (+ 2 i))
	 (i2 2 (+ 2 i2))
	 (j  0 (+ 1 j)))
	((= i len)
	 (make-<memblock> ptr size size))
      (pointer-set-c-uint8! ptr j (string->number (substring str i i2) 16)))))


(define (memblock-tail block tail.len)
  (let ((block.ptr	(<memblock>-pointer block))
	(block.len	(<memblock>-size    block)))
    (assert (<= tail.len block.len))
    (make-<memblock> (pointer-add block.ptr (- block.len tail.len)) tail.len #f)))

(define (memblock-head block head.size)
  (let ((block.ptr	(<memblock>-pointer block))
	(block.len	(<memblock>-size    block)))
    (assert (<= head.size block.len))
    (make-<memblock> block.ptr head.size #f)))

(define (memblock-tail? block tail)
  (let ((block.ptr	(<memblock>-pointer block))
	(block.len	(<memblock>-size    block))
	(tail.ptr	(<memblock>-pointer tail))
	(tail.len	(<memblock>-size    tail)))
    (and (pointer<=? block.ptr tail.ptr)
	 (pointer=? (pointer-add block.ptr block.len)
		    (pointer-add tail.ptr  tail.len)))))

(define (memblock-head? block head)
  (let ((block.ptr	(<memblock>-pointer block))
	(block.len	(<memblock>-size    block))
	(head.ptr	(<memblock>-pointer head))
	(head.len	(<memblock>-size    head)))
    (and (pointer=? block.ptr head.ptr)
	 (<= head.len block.len))))

(define (memblock&head-tail block head)
  (let ((block.ptr	(<memblock>-pointer block))
	(block.len	(<memblock>-size    block))
	(head.ptr	(<memblock>-pointer head))
	(head.len	(<memblock>-size    head)))
    (assert (pointer=? block.ptr head.ptr))
    (assert (<= head.len block.len))
    (make-<memblock> (pointer-add block.ptr head.len) (- block.len head.len) #f)))

(define (memblock&tail-head block tail)
  (let ((block.ptr	(<memblock>-pointer block))
	(block.len	(<memblock>-size    block))
	(tail.ptr	(<memblock>-pointer tail))
	(tail.len	(<memblock>-size    tail)))
    (assert (pointer<=? block.ptr tail.ptr))
    (assert (<= tail.len block.len))
    (make-<memblock> block.ptr (- block.len tail.len) #f)))


;;;; done

)

;;; end of file
