;;; -*- coding: utf-8-unix -*-
;;;
;;;Part of: Nausicaa/SQLite
;;;Contents: tests for platform
;;;Date: Thu Oct 29, 2009
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


(import (nausicaa)
  (compensations)
  (foreign memory)
  (foreign cstrings)
  (foreign databases sqlite platform)
  (foreign databases sqlite sizeof)
  (checks))

(check-set-mode! 'report-failed)
(display "*** testing SQLite platform\n")


(parametrise ((check-test-name	'version))

  (check
      (sqlite3_libversion_number)
    => SQLITE_VERSION_NUMBER)

  #t)


;;;; done

(check-report)

;;; end of file
