;;;
;;;Part of: Nausicaa/POSIX
;;;Contents: tests for job control functions
;;;Date: Fri Dec 19, 2008
;;;Time-stamp: <2008-12-19 17:39:27 marco>
;;;
;;;Abstract
;;;
;;;
;;;
;;;Copyright (c) 2008 Marco Maggi <marcomaggi@gna.org>
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



;;;; setup

(import (r6rs)
  (uriel lang)
  (uriel test)
  (posix job)
  (posix process))

(check-set-mode! 'report-failed)



(parameterize ((testname 'terminal-id))

  (check
      (ctermid)
    => "/dev/tty")

  )



(parameterize ((testname 'group))

  (check
      (let ((pid (fork)))
	(when (= 0 pid)
	  (setsid)
	  (exit))
	#t)
    => #t)

  (check
      (integer? (getsid (getpid)))
    => #t)

  (check
      (integer? (getpgrp))
    => #t)

  (check
      (integer? (setpgid 0 0))
    => #t)

  )



(parameterize ((testname 'access))

  (check
      (integer? (tcgetpgrp 1))
    => #t)

;;; Is there a way to test this without losing control of the terminal?
;;   (check
;;       (let ((pid (fork)))
;; 	(when (= 0 pid)
;; 	  (tcsetpgrp 1 (getpgrp))
;; 	  (exit))
;; 	#t)
;;     => #t)

  (check
      (integer? (tcgetsid 1))
    => #t)

  )


;;;; done

(check-report)

;;; end of file