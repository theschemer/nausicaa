;;; -*- coding: utf-8-unix -*-
;;;
;;;Part of: Nausicaa/PostgreSQL
;;;Contents: condition object type definitions
;;;Date: Mon Feb 15, 2010
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


(library (foreign databases postgresql conditions)
  (export
    &connection
    make-connection-condition
    connection-condition?
    connection-condition

    &database
    make-database-condition
    database-condition?
    database-condition

    &query
    make-query-condition
    query-condition?
    query-condition

    &statement
    make-statement-condition
    statement-condition?
    statement-condition

;;; --------------------------------------------------------------------

    &postgresql-error
    make-postgresql-error-condition
    postgresql-error-condition?
    condition-postgresql-error-code

    &postgresql-opening-error
    make-postgresql-opening-error-condition
    postgresql-opening-error-condition?
    raise-postgresql-opening-error

    &postgresql-querying-error
    make-postgresql-querying-error-condition
    postgresql-querying-error-condition?
    raise-postgresql-querying-error

    &postgresql-preparing-error
    make-postgresql-preparing-error-condition
    postgresql-preparing-error-condition?
    raise-postgresql-preparing-error

    &postgresql-finalizing-error
    make-postgresql-finalizing-error-condition
    postgresql-finalizing-error-condition?
    raise-postgresql-finalizing-error

    &postgresql-resetting-error
    make-postgresql-resetting-error-condition
    postgresql-resetting-error-condition?
    raise-postgresql-resetting-error

    &postgresql-stepping-error
    make-postgresql-stepping-error-condition
    postgresql-stepping-error-condition?
    raise-postgresql-stepping-error

    (rename (&postgresql-finalizing-error			&postgresql-finalising-error)
	    (make-postgresql-finalizing-error-condition	make-postgresql-finalising-error-condition)
	    (postgresql-finalizing-error-condition?		postgresql-finalising-error-condition?)
	    (raise-postgresql-finalizing-error		raise-postgresql-finalising-error))

    )
  (import (rnrs))


(define-condition-type &connection
  &condition
  make-connection-condition
  connection-condition?
  (connection	connection-condition))

(define-condition-type &database
  &condition
  make-database-condition
  database-condition?
  (database	database-condition))

(define-condition-type &query
  &condition
  make-query-condition
  query-condition?
  (query	query-condition))

(define-condition-type &statement
  &condition
  make-statement-condition
  statement-condition?
  (statement	statement-condition))


(define-condition-type &postgresql-error
  &error
  make-postgresql-error-condition
  postgresql-error-condition?
  (code		condition-postgresql-error-code))

;;; --------------------------------------------------------------------

(define-condition-type &postgresql-opening-error
  &postgresql-error
  make-postgresql-opening-error-condition
  postgresql-opening-error-condition?)

(define-syntax raise-postgresql-opening-error
  (syntax-rules ()
    ((_ ?who ?message ?code ?database)
     (raise-continuable
      (condition (make-postgresql-opening-error-condition ?code)
		 (make-postgresql-database-condition ?database)
		 (make-who-condition ?who)
		 (make-message-condition ?message))))))

;;; --------------------------------------------------------------------

(define-condition-type &postgresql-querying-error
  &postgresql-error
  make-postgresql-querying-error-condition
  postgresql-querying-error-condition?)

(define-syntax raise-postgresql-querying-error
  (syntax-rules ()
    ((_ ?who ?message ?code ?session ?query)
     (raise-continuable
      (condition (make-postgresql-querying-error-condition ?code)
		 (make-postgresql-session-condition ?session)
		 (make-postgresql-query-condition ?query)
		 (make-who-condition ?who)
		 (make-message-condition ?message))))))

;;; --------------------------------------------------------------------

(define-condition-type &postgresql-preparing-error
  &postgresql-error
  make-postgresql-preparing-error-condition
  postgresql-preparing-error-condition?)

(define-syntax raise-postgresql-preparing-error
  (syntax-rules ()
    ((_ ?who ?message ?code ?session ?query)
     (raise
      (condition (make-postgresql-preparing-error-condition ?code)
		 (make-postgresql-session-condition ?session)
		 (make-postgresql-query-condition ?query)
		 (make-who-condition ?who)
		 (make-message-condition ?message))))))

;;; --------------------------------------------------------------------

(define-condition-type &postgresql-finalizing-error
  &postgresql-error
  make-postgresql-finalizing-error-condition
  postgresql-finalizing-error-condition?)

(define-syntax raise-postgresql-finalizing-error
  (syntax-rules ()
    ((_ ?who ?message ?code ?session ?statement)
     (raise
      (condition (make-postgresql-finalizing-error-condition ?code)
		 (make-postgresql-session-condition ?session)
		 (make-postgresql-statement-condition ?statement)
		 (make-who-condition ?who)
		 (make-message-condition ?message))))))

;;; --------------------------------------------------------------------

(define-condition-type &postgresql-resetting-error
  &postgresql-error
  make-postgresql-resetting-error-condition
  postgresql-resetting-error-condition?)

(define-syntax raise-postgresql-resetting-error
  (syntax-rules ()
    ((_ ?who ?message ?code ?session ?statement)
     (raise
      (condition (make-postgresql-resetting-error-condition ?code)
		 (make-postgresql-session-condition ?session)
		 (make-postgresql-statement-condition ?statement)
		 (make-who-condition ?who)
		 (make-message-condition ?message))))))

;;; --------------------------------------------------------------------

(define-condition-type &postgresql-stepping-error
  &postgresql-error
  make-postgresql-stepping-error-condition
  postgresql-stepping-error-condition?)

(define-syntax raise-postgresql-stepping-error
  (syntax-rules ()
    ((_ ?who ?message ?code ?session ?statement)
     (raise
      (condition (make-postgresql-stepping-error-condition ?code)
		 (make-postgresql-session-condition ?session)
		 (make-postgresql-statement-condition ?statement)
		 (make-who-condition ?who)
		 (make-message-condition ?message))))))


;;;; done

)

;;; end of file



;;;; done

)

;;; end of file
