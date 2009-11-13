;;; -*- coding: utf-8-unix -*-
;;;
;;;Part of: Nausicaa/SQLite
;;;Contents: tests for primitives
;;;Date: Fri Nov 13, 2009
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
  (foreign databases sqlite primitives)
  (foreign databases sqlite sizeof)
  (checks))

(check-set-mode! 'report-failed)
(display "*** testing SQLite primitives\n")


;;;; helpers

(define-syntax with-database
  (syntax-rules ()
    ((_ (?name ?pathname) ?form ...)
     (let ((?name ?pathname))
       (dynamic-wind
	   (lambda ()
	     (when (file-exists? ?name)
	       (delete-file ?name)))
	   (lambda ()
	     ?form ...)
	   (lambda ()
	     (when (file-exists? ?name)
	       (delete-file ?name))))))))


(parametrise ((check-test-name	'version))

  (check
      (sqlite-libversion-number)
    => SQLITE_VERSION_NUMBER)

  #t)


(parametrise ((check-test-name	'open-close))

  (check
      (with-database (pathname "callback-0.db")
		     (let ((db (sqlite-open pathname)))
		       (sqlite-close db)))
    => 0)

  (check
      (let ((db (sqlite-open-v2 ":memory:"
				(bitwise-ior SQLITE_OPEN_READWRITE SQLITE_OPEN_NOMUTEX)
				pointer-null)))
	(sqlite-close db))
    => 0)

  #t)


(parametrise ((check-test-name	'callback))

  (check
      (let ((session	(sqlite-open ":memory:"))
	    (cback	(make-sqlite-exec-callback
			 (lambda (custom-data row)
			   (write row)(newline)
			   0))))
	(sqlite-exec session "create table alpha
				(key INTEGER PRIMARY KEY, data TEXT, num double);
                                insert into alpha (data, num)
					values ('This is sample data', 3);
                                insert into alpha (data, num)
					values ('More sample data',6 );
				insert into alpha (data, num)
					values ('And a little more', 9);"
		     pointer-null)
	(sqlite-exec session "select * from alpha;" cback)
	(sqlite-close session))
    => 0)

  #t)


;;;; done

(check-report)

;;; end of file
