;;; -*- coding: utf-8-unix -*-
;;;
;;;Part of: Nausicaa/Scheme
;;;Contents: queue type definition
;;;Date: Wed Oct 14, 2009
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

(library (queues types)
  (export
    <queue>		<queue-rtd>
    make-<queue>	<queue>?
    <queue>-first-pair	<queue>-first-pair-set!
    <queue>-last-pair	<queue>-last-pair-set!)
  (import (rnrs))
  (define-record-type <queue>
    (fields (mutable first-pair)
	    (mutable last-pair)))
  (define <queue-rtd>
    (record-type-descriptor <queue>)))

;;; end of file
