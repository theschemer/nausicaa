;;; -*- coding: utf-8-unix -*-
;;;
;;;Part of: Nausicaa/cURL
;;;Contents: map to foreign functions
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


(library (foreign net curl platform)
  (export

    ;; global initialisation
    curl_global_init			curl_global_init_mem
    curl_global_cleanup

    ;; curl version
    curl_version			curl_version_info

    ;; easy interface
    curl_easy_init			curl_easy_duphandle
    curl_easy_cleanup			curl_easy_reset
    curl_easy_perform			curl_easy_pause
    curl_easy_recv			curl_easy_send
    curl_easy_setopt/callback		curl_easy_setopt/void*
    curl_easy_setopt/long		curl_easy_setopt/off_t
    curl_easy_getinfo			curl_easy_strerror

    ;; multi interface
    curl_multi_init			curl_multi_cleanup
    curl_multi_add_handle		curl_multi_remove_handle
    curl_multi_fdset			curl_multi_info_read
    curl_multi_perform			curl_multi_socket
    curl_multi_socket_action		curl_multi_socket_all
    curl_multi_setopt/long		curl_multi_setopt/off_t
    curl_multi_setopt/void*		curl_multi_setopt/callback
    curl_multi_timeout			curl_multi_assign
    curl_multi_strerror

    ;; mutex/locking
    curl_share_init			curl_share_cleanup
    curl_share_setopt/void*		curl_share_setopt/callback
    curl_share_setopt/long		curl_share_setopt/off_t
    curl_share_strerror

    ;; HTTP POST
    curl_formadd_1			curl_formget
    curl_formfree

    ;; URL escaping
    curl_easy_escape			curl_easy_unescape
    curl_escape				curl_unescape

    ;; miscellaneous
    curl_slist_append			curl_slist_free_all
    curl_getenv				curl_free
    curl_getdate)
  (import (rnrs)
    (foreign ffi)
    (foreign net curl sizeof)
    (foreign net curl shared-object))

  (define dummy
    (shared-object curl-shared-object))


;;;; type aliases

(define int*					'pointer)
(define long*					'pointer)
(define size_t*					'pointer)
(define time_t*					'pointer)
(define CURL*					'pointer)
(define CURLSH*					'pointer)
(define struct-curl_httppost*			'pointer)
(define struct-curl_httppost**			'pointer)
(define struct-curl_slist*			'pointer)
(define curl_version_info_data*			'pointer)

;;*FIXME* How do they implement "time_t"?
(define time_t					'signed-long)


;;;; global initialisation

(define-c-function curl_global_init
  (CURLcode curl_global_init (long)))

(define-c-function curl_global_init_mem
  (CURLcode curl_global_init_mem (long curl_malloc_callback curl_free_callback
				       curl_realloc_callback curl_strdup_callback
				       curl_calloc_callback)))

(define-c-function curl_global_cleanup
  (void curl_global_cleanup (void)))


;;; curl version

(define-c-function curl_version_info
  (curl_version_info_data* curl_version_info (CURLversion)))

(define-c-function curl_version
  (char* curl_version (void)))


;;;; easy interface

(define-c-function curl_easy_init
  (void* curl_easy_init (void)))

(define-c-function curl_easy_cleanup
  (void curl_easy_cleanup (void*)))

(define-c-function curl_easy_reset
  (void curl_easy_reset (void*)))

(define-c-function curl_easy_duphandle
  (void* curl_easy_duphandle (void*)))

;;; --------------------------------------------------------------------

(define-c-function curl_easy_perform
  (CURLcode curl_easy_perform (void*)))

(define-c-function curl_easy_recv
  (CURLcode curl_easy_recv (void* void* size_t size_t*)))

(define-c-function curl_easy_send
  (CURLcode curl_easy_send (void* void* size_t size_t*)))

(define-c-function curl_easy_pause
  (CURLcode curl_easy_pause (void* int)))

;;; --------------------------------------------------------------------

(define curl_easy_setopt/callback
  (make-c-function CURLcode curl_easy_setopt (void* CURLoption callback)))

(define curl_easy_setopt/void*
  (make-c-function CURLcode curl_easy_setopt (void* CURLoption void*)))

(define curl_easy_setopt/long
  (make-c-function CURLcode curl_easy_setopt (void* CURLoption long)))

(define curl_easy_setopt/off_t
  (make-c-function CURLcode curl_easy_setopt (void* CURLoption curl_off_t)))

;;; --------------------------------------------------------------------

(define-c-function curl_easy_getinfo
  (CURLcode curl_easy_getinfo (void* CURLINFO void*)))

(define-c-function curl_easy_strerror
  (char* curl_easy_strerror (CURLcode)))


;;;; multi interface

(define-c-function curl_multi_init
  (void* curl_multi_init (void)))

(define-c-function curl_multi_cleanup
  (CURLMcode curl_multi_cleanup (void*)))

(define-c-function curl_multi_add_handle
  (CURLMcode curl_multi_add_handle (void* void*)))

(define-c-function curl_multi_remove_handle
  (CURLMcode curl_multi_remove_handle (void* void*)))

;;; --------------------------------------------------------------------

(define-c-function curl_multi_perform
  (CURLMcode curl_multi_perform (void* int*)))

(define-c-function curl_multi_fdset
  (CURLMcode curl_multi_fdset (void* void* void* void* int*)))

(define-c-function curl_multi_info_read
  (void* curl_multi_info_read (void* int*)))

(define-c-function curl_multi_socket
  (CURLMcode curl_multi_socket (void* curl_socket_t int*)))

(define-c-function curl_multi_socket_action
  (CURLMcode curl_multi_socket_action (void* curl_socket_t int int*)))

(define-c-function curl_multi_socket_all
  (CURLMcode curl_multi_socket_all (void* int*)))

;;; --------------------------------------------------------------------

(define curl_multi_setopt/void*
  (make-c-function CURLMcode curl_multi_setopt (void* CURLMoption void*)))

(define curl_multi_setopt/callback
  (make-c-function CURLMcode curl_multi_setopt (void* CURLMoption callback)))

(define curl_multi_setopt/long
  (make-c-function CURLMcode curl_multi_setopt (void* CURLMoption long)))

(define curl_multi_setopt/off_t
  (make-c-function CURLMcode curl_multi_setopt (void* CURLMoption curl_off_t)))

;;; --------------------------------------------------------------------

(define-c-function curl_multi_timeout
  (CURLMcode curl_multi_timeout (void* long*)))

(define-c-function curl_multi_assign
  (CURLMcode curl_multi_assign (void* curl_socket_t void*)))

(define-c-function curl_multi_strerror
  (char* curl_multi_strerror (CURLMcode)))


;;; URL escaping

(define-c-function curl_easy_escape
  (char* curl_easy_escape (CURL* char* int)))

(define-c-function curl_easy_unescape
  (char* curl_easy_unescape (CURL*  char* int int*)))

(define-c-function curl_escape
  (char* curl_escape (char* int)))

(define-c-function curl_unescape
  (char* curl_unescape (char* int)))


;;;; HTTP POST

;;This  is  meant  to  be  used only  with  the  CURLFORM_ARRAY  option.
;;Example:
;;
;;  (curl_formadd_1 first** last** CURLFORM_ARRAY array* CURLFORM_END)
;;
(define-c-function curl_formadd_1
  (CURLFORMcode curl_formadd (struct-curl_httppost**
			      struct-curl_httppost** CURLformoption void* CURLformoption)))

(define-c-function curl_formget
  (int curl_formget (struct-curl_httppost* void* curl_formget_callback)))

(define-c-function curl_formfree
  (void curl_formfree (struct-curl_httppost*)))


;;;; mutext/locking interface

(define-c-function curl_share_init
  (void* curl_share_init (void)))

(define-c-function curl_share_cleanup
  (CURLSHcode curl_share_cleanup (CURLSH*)))

(define curl_share_setopt/void*
  (make-c-function CURLSHcode curl_share_setopt (CURLSH* CURLMoption void*)))

(define curl_share_setopt/callback
  (make-c-function CURLSHcode curl_share_setopt (CURLSH* CURLMoption callback)))

(define curl_share_setopt/long
  (make-c-function CURLSHcode curl_share_setopt (CURLSH* CURLMoption long)))

(define curl_share_setopt/off_t
  (make-c-function CURLSHcode curl_share_setopt (CURLSH* CURLMoption curl_off_t)))

(define-c-function curl_share_strerror
  (char* curl_share_strerror (CURLSHcode)))


;;;; miscellaneous

(define-c-function curl_slist_append
  (struct-curl_slist* curl_slist_append (struct-curl_slist* char*)))

(define-c-function curl_slist_free_all
  (void curl_slist_free_all (struct-curl_slist*)))

;;; --------------------------------------------------------------------

(define-c-function curl_getenv
  (char* curl_getenv (char*)))

(define-c-function curl_free
  (void curl_free (void*)))

(define-c-function curl_getdate
  (time_t curl_getdate (char* time_t*)))


;;;; done

)

;;; end of file
