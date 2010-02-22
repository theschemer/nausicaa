;;; -*- coding: utf-8-unix -*-
;;;
;;;Part of: Nausicaa/PostgreSQL
;;;Contents: primitive functions
;;;Date: Fri Feb 12, 2010
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


(library (foreign databases postgresql primitives)
  (export

    ;; connection handling
    connect-start			;; PQconnectStart
    connect-poll			;; PQconnectPoll
    connect-db				;; PQconnectdb
    set-db-login			;; PQsetdbLogin
    set-db				;; PQsetdb
    connect-finish			;; PQfinish
    reset-start				;; PQresetStart
    reset-poll				;; PQresetPoll
    reset				;; PQreset

    ;; connection inspection
    status				;; PQstatus
    status/ok?
    status/bad?
    status/started?
    status/made?
    status/awaiting-response?
    status/auth-ok?
    status/setenv?
    status/ssl-startup?
    status/needed?

    connection-defaults			;; PQconndefaults
    connection-info-parse		;; PQconninfoParse

    connection-database			;; PQdb
    connection-user			;; PQuser
    connection-password			;; PQpass
    connection-host			;; PQhost
    connection-port			;; PQport
    connection-tty			;; PQtty
    connection-options			;; PQoptions
    connection-socket			;; PQsocket
    connection-transaction-status	;; PQtransactionStatus
    connection-parameter-status		;; PQparameterStatus
    connection-protocol-version		;; PQprotocolVersion
    connection-server-version		;; PQserverVersion
    connection-error-message		;; PQerrorMessage
    connection-backend-pid		;; PQbackendPID
    connection-needs-password		;; PQconnectionNeedsPassword
    connection-used-password		;; PQconnectionUsedPassword
    connection-get-ssl			;; PQgetssl

    ;; executing queries
    clear-result			;; PQclear
    exec-script				;; PQexec
    exec-parametrised-query		;; PQexecParams
    prepare-statement			;; PQprepare
    describe-prepared-statement		;; PQdescribePrepared
    exec-prepared-statement		;; PQexecPrepared

    ;; inspecting query results
    result-status			;; PQresultStatus
    status->string			;; PQresStatus
    result-error-message		;; PQresultErrorMessage
    result-error-field			;; PQresultErrorField

    ;; extracting informations from query results
    result-number-of-tuples		;; PQntuples
    result-tuple-index?
    assert-result-tuple-index
    result-number-of-fields		;; PQnfields
    result-field-index?
    assert-result-field-index
    result-field-name			;; PQfname
    result-field-name?
    assert-result-field-name
    result-field-number			;; PQfnumber
    result-column-table-oid		;; PQftable
    result-table-column-number		;; PQftablecol
    result-column-format-code		;; PQfformat
    result-column-type-oid		;; PQftype
    result-type-modifier		;; PQfmod
    result-column-size			;; PQfsize
    result-null-value?			;; PQgetisnull
    result-value-length			;; PQgetlength
    result-get-value			;; PQgetvalue
    result-get-value/text		;; PQgetvalue
    result-get-value/binary		;; PQgetvalue
    result-number-of-parameters		;; PQnparams
    result-parameter-index?
    assert-result-parameter-index
    result-parameter-type-oid		;; PQparamtype
    result-command-status		;; PQcmdStatus
    result-affected-rows		;; PQcmdTuples
    result-new-row-oid			;; PQoidValue

    ;; escaping
    escape-string-conn			;; PQescapeStringConn
    escape-bytes-conn			;; PQescapeByteaConn
    escape-bytes-conn/bv
    unescape-bytes			;; PQunescapeBytea
    unescape-bytes/bv

    ;;
    set-non-blocking			;; PQsetnonblocking

    ;; miscellaneous
    describe-portal			;; PQdescribePortal

    (rename (PQconninfoFree			conninfo-free)
	    (PQgetCancel			get-cancel)
	    (PQfreeCancel			free-cancel)
	    (PQcancel				cancel)
	    (PQrequestCancel			request-cancel)
	    (PQclientEncoding			client-encoding)
	    (PQsetClientEncoding		set-client-encoding)
	    (PQinitSSL				init-ssl)
	    (PQinitOpenSSL			init-open-ssl)
	    (PQsetErrorVerbosity		set-error-verbosity)
	    (PQtrace				trace)
	    (PQuntrace				untrace)
	    (PQsetNoticeReceiver		set-notice-receiver)
	    (PQsetNoticeProcessor		set-notice-processor)
	    (PQregisterThreadLock		register-thread-lock)
	    (PQsendQuery			send-query)
	    (PQsendQueryParams			send-query-params)
	    (PQsendPrepare			send-prepare)
	    (PQsendQueryPrepared		send-query-prepared)
	    (PQgetResult			get-result)
	    (PQisBusy				is-busy)
	    (PQconsumeInput			consume-input)
	    (PQnotifies				notifies)
	    (PQputCopyData			put-copy-data)
	    (PQputCopyEnd			put-copy-end)
	    (PQgetCopyData			get-copy-data)
	    (PQgetline				getline)
	    (PQputline				putline)
	    (PQgetlineAsync			getline-async)
	    (PQputnbytes			putnbytes)
	    (PQendcopy				endcopy)
	    (PQisnonblocking			isnonblocking)
	    (PQisthreadsafe			isthreadsafe)
	    (PQflush				flush)
	    (PQfn				fn)
	    (PQbinaryTuples			binary-tuples)
	    (PQoidStatus			oid-status)
	    (PQsendDescribePrepared		send-describe-prepared)
	    (PQsendDescribePortal		send-describe-portal)
	    (PQfreemem				freemem)
	    (PQmakeEmptyPGresult		make-empty-pg-result)
	    (PQcopyResult			copy-result)
	    (PQsetResultAttrs			set-result-attrs)
	    (PQresultAlloc			result-alloc)
	    (PQsetvalue				setvalue)
	    (PQprint				print)
	    (PQdisplayTuples			display-tuples)
	    (PQprintTuples			print-tuples)
	    (lo_open				lo-open)
	    (lo_close				lo-close)
	    (lo_read				lo-read)
	    (lo_write				lo-write)
	    (lo_lseek				lo-lseek)
	    (lo_creat				lo-creat)
	    (lo_create				lo-create)
	    (lo_tell				lo-tell)
	    (lo_truncate			lo-truncate)
	    (lo_unlink				lo-unlink)
	    (lo_import				lo-import)
	    (lo_import_with_oid			lo-import-with-oid)
	    (lo_export				lo-export)
	    (PQmblen				mblen)
	    (PQdsplen				dsplen)
	    (PQenv2encoding			env2encoding)
	    (PQencryptPassword			encrypt-password)
	    (pg_char_to_encoding		char-to-encoding)
	    (pg_encoding_to_char		encoding-to-char)
	    (pg_valid_server_encoding_id	valid-server-encoding-id)
	    (PQescapeString			escape-string)
	    (PQescapeBytea			escape-bytea)

	    (PQfreeNotify			free-notify)
	    (InvalidOid				invalid-oid)
	    (PQnoPasswordSupplied		no-password-supplied)))
  (import (rnrs)
    (begin0)
    (receive)
    (compensations)
    (foreign ffi)
    (only (foreign ffi sizeof)
	  sizeof-int-array
	  sizeof-pointer-array)
    (foreign memory)
    (foreign cstrings)
    (foreign databases postgresql typedefs)
    (foreign databases postgresql enumerations)
    (foreign databases postgresql conditions)
    (foreign databases postgresql platform)
    (foreign databases postgresql sizeof))


;;;; connections management

(define (%do-connect who func info)
  (with-compensations
    (let ((p (func (string->cstring/c info))))
      (if (pointer-null? p)
	  (raise-out-of-memory who #f)
	(pointer->connection p)))))

(define connect-db
  (case-lambda
   (()
    (connect-db ""))
   ((info)
    (%do-connect 'connect-db PQconnectdb info))))

(define connect-start
  (case-lambda
   (()
    (connect-start ""))
   ((info)
    (%do-connect 'connect-start PQconnectStart info))))

(define (connect-poll conn)
  (let ((v (PQconnectPoll (connection->pointer conn))))
    (if (= v PGRES_POLLING_FAILED)
	(raise
	 (condition (make-postgresql-error-condition)
		    (make-connection-condition conn)
		    (make-who-condition 'connect-poll)
		    (make-message-condition (connection-error-message))))
      (value->polling-status v))))

(define (connect-poll* conn)
  (value->polling-status (PQconnectPoll (connection->pointer conn))))

(define (set-db-login pghost pgport pgoptions pgtty dbname login pwd)
  ;;Deprecated.
  ;;
  (define (%arg val)
    (if val
	(string->cstring/c val)
      pointer-null))
  (with-compensations
    (let ((p (PQsetdbLogin (%arg pghost) (%arg pgport) (%arg pgoptions) (%arg pgtty)
			   (%arg dbname) (%arg login) (%arg pwd))))
      (if (pointer-null? p)
	  (raise-out-of-memory 'set-db-login #f)
	(pointer->connection p)))))

(define (set-db pghost pgport pgoptions pgtty dbname)
  ;;Deprecated.
  ;;
  (set-db-login pghost pgport pgoptions pgtty dbname #f #f))

(define (connect-finish conn)
  (PQfinish (connection->pointer conn)))

(define (reset conn)
  (PQreset (connection->pointer conn)))

(define (reset-start conn)
  (if (PQconnectStart (connection->pointer conn)) #t #f))

(define (reset-poll conn)
  (let ((v (PQresetPoll (connection->pointer conn))))
    (if (= v PGRES_POLLING_FAILED)
	(raise
	 (condition (make-postgresql-error-condition)
		    (make-connection-condition conn)
		    (make-who-condition 'connect-poll)
		    (make-message-condition (connection-error-message))))
      (value->polling-status v))))

(define (reset-poll* conn)
  (value->polling-status (PQresetPoll (connection->pointer conn))))

(define (%connect-options-array->list arry*)
  (let loop ((arry* arry*) (ell '()))
    (if (pointer-null? (struct-PQconninfoOption-keyword-ref arry*))
	ell
      (loop (pointer-add arry* strideof-PQconninfoOption)
	    (cons (pointer-><connect-option> arry*) ell)))))

(define (connection-defaults)
  (with-compensations
    (letrec ((arry* (compensate
			(PQconndefaults)
		      (with
		       (unless (pointer-null? arry*)
			 (PQconninfoFree arry*))))))
      (if (pointer-null? arry*)
	  (raise-out-of-memory 'connection-defaults #f)
	(%connect-options-array->list arry*)))))

(define (connection-info-parse info)
  (with-compensations
    (let ((errmsg* (malloc-small/c)))
      (letrec ((arry* (compensate
			  (PQconninfoParse (string->cstring/c info) errmsg*)
			(with
			 (unless (pointer-null? arry*)
			   (PQconninfoFree arry*))))))
	(if (pointer-null? arry*)
	    (let ((msg* (pointer-ref-c-pointer errmsg* 0)))
	      (if (pointer-null? msg*)
		  (raise-out-of-memory 'connection-info-parse #f)
		(begin
		  (push-compensation (primitive-free msg*))
		  (error 'connection-info-parse (cstring->string msg*) info))))
	  (%connect-options-array->list arry*))))))


;;;; inspection

(define (status conn)
  (value->connection-status (PQstatus (connection->pointer conn))))

(define (%status? status conn)
  (= status (PQstatus (connection->pointer conn))))

(define (status/ok? conn)
  (%status? CONNECTION_OK conn))

(define (status/bad? conn)
  (%status? CONNECTION_BAD conn))

(define (status/started? conn)
  (%status? CONNECTION_STARTED conn))

(define (status/made? conn)
  (%status? CONNECTION_MADE conn))

(define (status/awaiting-response? conn)
  (%status? CONNECTION_AWAITING_RESPONSE conn))

(define (status/auth-ok? conn)
  (%status? CONNECTION_AUTH_OK conn))

(define (status/setenv? conn)
  (%status? CONNECTION_SETENV conn))

(define (status/ssl-startup? conn)
  (%status? CONNECTION_SSL_STARTUP conn))

(define (status/needed? conn)
  (%status? CONNECTION_NEEDED conn))

;;; --------------------------------------------------------------------

;;;I have  verified by  inspecting the source  code of Libpq  in release
;;;8.4.2  that  the  pointers   returned  by  the  following  inspection
;;;functions, reference a string in the state of CONN; we do NOT have to
;;;release it (Marco Maggi.  Wed Feb 17, 2010).

(define (connection-database conn)
  (let ((p (PQdb (connection->pointer conn))))
    (if (pointer-null? p) #f  (cstring->string p))))

(define (connection-user conn)
  (let ((p (PQuser (connection->pointer conn))))
    (if (pointer-null? p) #f  (cstring->string p))))

(define (connection-password conn)
  (let ((p (PQpass (connection->pointer conn))))
    (if (pointer-null? p) #f  (cstring->string p))))

(define (connection-host conn)
  (let ((p (PQhost (connection->pointer conn))))
    (if (pointer-null? p) #f  (cstring->string p))))

(define (connection-port conn)
  (let ((p (PQport (connection->pointer conn))))
    (if (pointer-null? p) #f  (cstring->string p))))

(define (connection-tty conn)
  (let ((p (PQtty (connection->pointer conn))))
    (if (pointer-null? p) #f  (cstring->string p))))

(define (connection-options conn)
  (let ((p (PQoptions (connection->pointer conn))))
    (if (pointer-null? p) #f  (cstring->string p))))

(define (connection-socket conn)
  (integer-><fd> (PQsocket (connection->pointer conn))))

(define (connection-transaction-status conn)
  (value->transaction-status (PQtransactionStatus (connection->pointer conn))))

(define (connection-parameter-status conn parm-name)
  (with-compensations
    (let ((p (PQparameterStatus (connection->pointer conn) (string->cstring/c parm-name))))
      (if (pointer-null? p) #f (cstring->string p)))))

(define (connection-protocol-version conn)
  (PQprotocolVersion (connection->pointer conn)))

(define (connection-server-version conn)
  (PQserverVersion (connection->pointer conn)))

(define (connection-error-message conn)
  (let ((p (PQerrorMessage (connection->pointer conn))))
    (if (pointer-null? p) #f (cstring->string p))))

(define (connection-backend-pid conn)
  (integer->pid (PQbackendPID (connection->pointer conn))))

(define (connection-needs-password conn)
  (not (zero? (PQconnectionNeedsPassword (connection->pointer conn)))))

(define (connection-used-password conn)
  (not (zero? (PQconnectionUsedPassword (connection->pointer conn)))))

(define (connection-get-ssl conn)
  (let ((p (PQgetssl (connection->pointer conn))))
    (if (pointer-null? p) #f (pointer->ssl p))))


;;;; executing queries

(define (clear-result result)
  (PQclear (query-result->pointer result)))

(define (exec-script conn query)
  (with-compensations
    (let ((p (PQexec (connection->pointer conn) (string->cstring/c query))))
      (if (pointer-null? p)
	  (raise
	   (condition (make-postgresql-error-condition)
		      (make-connection-condition conn)
		      (make-query-string-condition query)
		      (make-who-condition 'exec-script)
		      (make-message-condition (connection-error-message))))
	(pointer->query-result p)))))

(define (exec-parametrised-query conn query parms textual-result?)
  (with-compensations
    (let* ((number-of-parms	(length parms))
	   (param-types*	(malloc-block/c (sizeof-Oid-array number-of-parms)))
	   (param-values*	(malloc-block/c (sizeof-pointer-array number-of-parms)))
	   (param-lengths*	(malloc-block/c (sizeof-int-array number-of-parms)))
	   (param-formats*	(malloc-block/c (sizeof-int-array number-of-parms))))

      (do ((i 0 (+ 1 i))
	   (parms parms (cdr parms)))
	  ((= i number-of-parms))
	(let* ((par	(car parms))
	       (text?	(<parameter>-text? par))
	       (val	(<parameter>-value par)))
	  (receive (val.ptr val.len)
	      (cond ((string? val)
		     (let ((p (string->cstring/c val)))
		       (values p (strlen p))))
		    ((bytevector? val)
		     (values (bytevector->pointer val malloc-block/c) (bytevector-length val)))
		    ((pointer? val)
		     (values val (<parameter>-size par)))
		    (else
		     (assertion-violation 'exec-parametrised-query
		       "invalid value type in <parameter> field" par)))
	    (array-set-c-signed-int!	param-formats* i (if text? 0 1))
	    (array-set-c-Oid!		param-types*   i (<parameter>-oid par))
	    (array-set-c-pointer!	param-values*  i val.ptr)
	    (array-set-c-signed-int!	param-lengths* i val.len))))

      (let ((p (PQexecParams (connection->pointer conn)
			     (string->cstring/c query)
			     number-of-parms
			     param-types* param-values* param-lengths* param-formats*
			     (if textual-result? 0 1))))
	(if (pointer-null? p)
	    (raise
	     (condition (make-postgresql-error-condition)
			(make-connection-condition conn)
			(make-query-string-condition query)
			(make-parameters-condition parms)
			(make-who-condition 'exec-parametrised-query)
			(make-message-condition (connection-error-message conn))))
	  (pointer->query-result p))))))


;;;; prepared statements

(define prepare-statement
  (case-lambda
   ((conn stmt-name query-string number-of-parms)
    (prepare-statement conn stmt-name query-string number-of-parms #f))
   ((conn stmt-name query-string number-of-parms parms-oid)
    (with-compensations
      (let* ((parms-types*	(if parms-oid
				    (begin
				      (assert (= number-of-parms (length parms-oid)))
				      (let ((p (malloc-block/c (sizeof-Oid-array number-of-parms))))
					(do ((i 0         (+ 1 i))
					     (l parms-oid (cdr l)))
					    ((= i number-of-parms)
					     p)
					  (array-set-c-Oid! p i (car l)))))
				  pointer-null))
	     (p			(PQprepare (connection->pointer conn)
					   (if stmt-name (string->cstring/c stmt-name) empty-string)
					   (string->cstring/c query-string)
					   number-of-parms
					   parms-types*)))
	(if (pointer-null? p)
	    (raise
	     (condition (make-postgresql-error-condition)
			(make-connection-condition conn)
			(make-statement-name-condition stmt-name)
			(make-query-string-condition query-string)
			(make-who-condition 'prepare-statement)
			(make-message-condition (connection-error-message conn))))
	  (pointer->query-result p)))))))

(define (describe-prepared-statement conn stmt-name)
  (let ((p (if stmt-name
	       (with-compensations
		 (PQdescribePrepared (connection->pointer conn) (string->cstring/c stmt-name)))
	     (PQdescribePrepared (connection->pointer conn) empty-string))))
    (if (pointer-null? p)
	(raise
	 (condition (make-postgresql-error-condition)
		    (make-connection-condition conn)
		    (make-statement-name-condition stmt-name)
		    (make-who-condition 'describe-prepared-statement)
		    (make-message-condition (connection-error-message conn))))
      (pointer->query-result p))))

(define (exec-prepared-statement conn stmt-name parms textual-result?)
  (with-compensations
    (let* ((number-of-parms	(length parms))
	   (param-values*	(malloc-block/c (sizeof-pointer-array number-of-parms)))
	   (param-lengths*	(malloc-block/c (sizeof-int-array number-of-parms)))
	   (param-formats*	(malloc-block/c (sizeof-int-array number-of-parms))))

      (do ((i 0 (+ 1 i))
	   (parms parms (cdr parms)))
	  ((= i number-of-parms))
	(let* ((par	(car parms))
	       (text?	(<parameter>-text? par))
	       (val	(<parameter>-value par)))
	  (receive (val.ptr val.len)
	      (cond ((string? val)
		     (let ((p (string->cstring/c val)))
		       (values p (strlen p))))
		    ((bytevector? val)
		     (values (bytevector->pointer val malloc-block/c) (bytevector-length val)))
		    ((pointer? val)
		     (values val (<parameter>-size par)))
		    (else
		     (assertion-violation 'exec-prepared-statement
		       "invalid value type in <parameter> field" par)))
	    (array-set-c-signed-int!	param-formats* i (if text? 0 1))
	    (array-set-c-pointer!	param-values*  i val.ptr)
	    (array-set-c-signed-int!	param-lengths* i val.len))))

      (let ((p (PQexecPrepared (connection->pointer conn)
			       (if stmt-name (string->cstring/c stmt-name) empty-string)
			       number-of-parms
			       param-values* param-lengths* param-formats*
			       (if textual-result? 0 1))))
	(if (pointer-null? p)
	    (raise
	     (condition (make-postgresql-error-condition)
			(make-connection-condition conn)
			(make-statement-name-condition stmt-name)
			(make-parameters-condition parms)
			(make-who-condition 'exec-prepared-statement)
			(make-message-condition (connection-error-message conn))))
	  (pointer->query-result p))))))


;;;; inspecting query results

(define (result-status result)
  (value->exec-status (PQresultStatus (query-result->pointer result))))

(define (status->string exec-status)
  (cstring->string (PQresStatus (if (integer? exec-status)
				    exec-status
				  (exec-status->value exec-status)))))

(define (result-error-message result)
  (let ((p (PQresultErrorMessage (query-result->pointer result))))
    (if (or (pointer-null? p) (zero? (strlen p)))
	#f
      (cstring->string p))))

(define (result-error-field result field)
  (let ((p (PQresultErrorField (query-result->pointer result) (error-field->value field))))
    (if (pointer-null? p)
	#f
      (cstring->string p))))

(define (result-command-status result)
  (cstring->string (PQcmdStatus (query-result->pointer result))))

(define (result-new-row-oid result)
  (let ((oid (PQoidValue (query-result->pointer result))))
    (if (= oid InvalidOid)
	#f
      oid)))


;; extracting informations from query results

(define (result-number-of-tuples result)
  (PQntuples (query-result->pointer result)))

(define (result-tuple-index? result tuple-index)
  (< -1 tuple-index (result-number-of-tuples result)))

(define (assert-result-tuple-index who result tuple-index)
  (or (result-tuple-index? result tuple-index)
      (assertion-violation who
	(string-append "tuple index "
		       (number->string tuple-index)
		       " out of range, must be in [0.."
		       (number->string (- (result-number-of-tuples result) 1))
		       "]")
	(list result tuple-index))))

;;; --------------------------------------------------------------------

(define (result-number-of-fields result)
  (PQnfields (query-result->pointer result)))

(define (result-field-index? result field-index)
  (< -1 field-index (result-number-of-fields result)))

(define (assert-result-field-index who result field-index)
  (or (result-field-index? result field-index)
      (assertion-violation who
	(string-append "field index "
		       (number->string field-index)
		       " out of range, must be in [0.."
		       (number->string (- (result-number-of-fields result) 1))
		       "]")
	(list result field-index))))

;;; --------------------------------------------------------------------

(define (result-field-name result field-index)
  (assert-result-field-index 'result-field-name result field-index)
  (let ((p (PQfname (query-result->pointer result) field-index)))
    (assert (not (pointer-null? p)))
    (cstring->string p)))

(define (result-field-name? result field-name)
  (with-compensations
    (not (= -1 (PQfnumber (query-result->pointer result) (string->cstring/c field-name))))))

(define (assert-result-field-name who result field-name)
  (or (result-field-name? result field-name)
      (assertion-violation who
	(string-append "invalid field name '" (if (symbol? field-name)
						  (symbol->string field-name)
						field-name) "'")
	(list result field-name))))

;;; --------------------------------------------------------------------

(define (result-field-number result field-name)
  (with-compensations
    (let ((n (PQfnumber (query-result->pointer result) (string->cstring/c field-name))))
      (if (= -1 n)
	  (assertion-violation 'result-field-number
	    (string-append "invalid field name '" (if (symbol? field-name)
						      (symbol->string field-name)
						    field-name) "'")
	    (list result field-name))
	n))))

;;; --------------------------------------------------------------------

(define (result-null-value? result tuple-index field-index)
  (assert-result-tuple-index 'result-null-value? result tuple-index)
  (assert-result-field-index 'result-null-value? result field-index)
  (not (zero? (PQgetisnull (query-result->pointer result) tuple-index field-index))))

(define (result-value-length result tuple-index field-index)
  (assert-result-tuple-index 'result-value-length result tuple-index)
  (assert-result-field-index 'result-value-length result field-index)
  (PQgetlength (query-result->pointer result) tuple-index field-index))

(define (result-get-value result tuple-index field-index)
  (assert-result-tuple-index 'result-get-value result tuple-index)
  (assert-result-field-index 'result-get-value result field-index)
  (PQgetvalue (query-result->pointer result) tuple-index field-index))

(define (result-get-value/text result tuple-index field-index)
  (assert-result-tuple-index 'result-get-value/text result tuple-index)
  (assert-result-field-index 'result-get-value/text result field-index)
  (let ((res (query-result->pointer result)))
    (cstring->string (PQgetvalue  res tuple-index field-index)
		     (PQgetlength res tuple-index field-index))))

(define (result-get-value/binary result tuple-index field-index)
  (assert-result-tuple-index 'result-get-value/binary result tuple-index)
  (assert-result-field-index 'result-get-value/binary result field-index)
  (let ((res (query-result->pointer result)))
    (pointer->bytevector (PQgetvalue  res tuple-index field-index)
			 (PQgetlength res tuple-index field-index))))

;;; --------------------------------------------------------------------

(define (result-number-of-parameters result)
  (PQnparams (query-result->pointer result)))

(define (result-parameter-index? result parm-index)
  (and (<= 0 parm-index) (< parm-index (result-number-of-parameters result))))

(define (assert-result-parameter-index who result parm-index)
  (or (result-parameter-index? result parm-index)
      (assertion-violation who
	(let ((n (result-number-of-parameters result)))
	  (if (zero? n)
	      "result has no parameters"
	    (string-append "parameter index "
			   (number->string parm-index)
			   " out of range, must be in [0.."
			   (number->string (- n 1))
			   "]")))
	(list result parm-index))))

(define (result-parameter-type-oid result parm-index)
  (assert-result-parameter-index 'result-parameter-type-oid result parm-index)
  (let ((oid (PQparamtype (query-result->pointer result) parm-index)))
    (if (= oid InvalidOid)
	#f
      oid)))

;;; --------------------------------------------------------------------

(define (result-column-table-oid result field-index)
  (assert-result-field-index 'result-column-table-oid result field-index)
  (begin0-let ((oid (PQftable (query-result->pointer result) field-index)))
    (assert (not (= InvalidOid oid)))))

(define (result-table-column-number result field-index)
  (assert-result-field-index 'result-table-column-number result field-index)
  (begin0-let ((n (PQftablecol (query-result->pointer result) field-index)))
    (assert (not (zero? n)))))

(define (result-column-format-code result field-index)
  (assert-result-field-index 'result-column-format-code result field-index)
  (value->format-code (PQfformat (query-result->pointer result) field-index)))

(define (result-column-type-oid result field-index)
  (assert-result-field-index 'result-column-type-oid result field-index)
  (begin0-let ((oid (PQftype (query-result->pointer result) field-index)))
    (assert (not (= InvalidOid oid)))))

(define (result-type-modifier result field-index)
  (assert-result-field-index 'result-type-modifier result field-index)
  (let ((n (PQfmod (query-result->pointer result) field-index)))
    (if (= -1 n)
	#f
      n)))

(define (result-column-size result field-index)
  (assert-result-field-index 'result-column-size result field-index)
  (let ((n (PQfsize (query-result->pointer result) field-index)))
    (if (negative? n)
	#f
      n)))

(define (result-affected-rows result)
  (let ((p (PQcmdTuples (query-result->pointer result))))
    (if (zero? (strlen p))
	#f
      (string->number (cstring->string p)))))


;;;; escaping

(define (escape-string-conn conn src-string)
  (with-compensations
    (let* ((src.ptr	(string->cstring/c src-string))
	   (src.len	(strlen src.ptr))
	   (err.ptr	(malloc-small/c))
	   (dst.ptr	(malloc-block/c (+ 1 (* 2 src.len))))
	   (dst.len	(PQescapeStringConn (connection->pointer conn) dst.ptr src.ptr src.len err.ptr)))
      (if (zero? (pointer-ref-c-signed-int err.ptr 0))
	  (cstring->string dst.ptr dst.len)
	(error 'escape-string-conn (connection-error-message conn) (list conn src-string))))))

(define (escape-bytes-conn conn src.ptr src.len)
  (with-compensations
    (let* ((dst.len*	(malloc-small/c))
	   (dst.ptr	(PQescapeByteaConn (connection->pointer conn) src.ptr src.len dst.len*)))
      (if (pointer-null? dst.ptr)
	  (error 'escape-bytes-conn (connection-error-message conn) (list conn src.ptr src.len))
	(values dst.ptr (pointer-ref-c-size_t dst.len* 0))))))

(define (escape-bytes-conn/bv conn bv)
  (with-compensations
    (let* ((dst.len*	(malloc-small/c))
	   (dst.ptr	(PQescapeByteaConn (connection->pointer conn)
					   (bytevector->pointer bv malloc-block/c)
					   (bytevector-length bv)
					   dst.len*)))
      (if (pointer-null? dst.ptr)
	  (error 'escape-bytes-conn/bv (connection-error-message conn) (list conn bv))
	(begin0-let ((dst (cstring->string dst.ptr (- (pointer-ref-c-size_t dst.len* 0) 1))))
	  (PQfreemem dst.ptr))))))

(define (unescape-bytes src.ptr)
  (with-compensations
    (let* ((dst.len*	(malloc-small/c))
	   (dst.ptr	(PQunescapeBytea src.ptr dst.len*)))
      (if (pointer-null? dst.ptr)
	  (error 'unescape-bytes "error unescaping string" src.ptr)
	(values dst.ptr (pointer-ref-c-size_t dst.len* 0))))))

(define (unescape-bytes/bv str)
  (with-compensations
    (receive (dst.ptr dst.len)
	(unescape-bytes (string->cstring/c str))
      (begin0-let ((bv (pointer->bytevector dst.ptr dst.len)))
	(primitive-free dst.ptr)))))


;;;;

(define (set-non-blocking conn)
  (PQsetnonblocking (connection->pointer conn) 1))


(define (make-notice-receiver-callback scheme-function)
  (make-c-callback* void
		    (lambda (result)
		      (scheme-function pointer-null (query-result->pointer result)))
		    (void* void*)))

(define (make-notice-processor-callback scheme-function)
  (make-c-callback* void
		    (lambda (message-pointer)
		      (scheme-function pointer-null message-pointer))
		    (void* char*)))

;;  typedef void  (*pgthreadlock_t)  (int acquire)))


;;;; miscellaneous

(define (describe-portal conn portal-name)
  (let ((p (if portal-name
	       (with-compensations
		 (PQdescribePortal (connection->pointer conn) (string->cstring/c portal-name)))
	     (PQdescribePortal (connection->pointer conn) empty-string))))
    (if (pointer-null? p)
	(raise
	 (condition (make-postgresql-error-condition)
		    (make-connection-condition conn)
		    (make-portal-name-condition portal-name)
		    (make-who-condition 'describe-portal)
		    (make-message-condition (connection-error-message conn))))
      (pointer->query-result p))))


;;;; done

)

;;; end of file
