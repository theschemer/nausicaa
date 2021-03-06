;;;
;;;Part of: Nausicaa/POSIX
;;;Contents: interface to platform functions for process execution
;;;Date: Thu Jan  1, 2009
;;;
;;;Abstract
;;;
;;;
;;;
;;;Copyright (c) 2009, 2011 Marco Maggi <marco.maggi-ipsu@poste.it>
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


(library (nausicaa posix process platform)
  (export
    getpid		getppid
    fork		execv
    execve		execvp
    system		waitpid

    WIFEXITED		WEXITSTATUS
    WIFSIGNALED		WTERMSIG
    WCOREDUMP		WIFSTOPPED
    WSTOPSIG

    ctermid		setsid		getsid
    getpgrp		setpgid
    tcgetpgrp		tcsetpgrp	tcgetsid)
  (import (rnrs)
    (nausicaa ffi)
    (nausicaa posix shared-object)
    (nausicaa posix sizeof))

  (define-c-functions libc-shared-object
    (getpid		(pid_t getpid (void)))
    (getppid		(pid_t getppid (void))))

  (define-c-functions/with-errno libc-shared-object
    (fork		(pid_t fork (void)))
    (execv		(int execv (char* pointer)))
    (execve		(int execve (char* pointer pointer)))
    (execvp		(int execvp (char* pointer)))
    (system		(int system (char*)))
    (waitpid		(pid_t waitpid (pid_t pointer int))))

  (define-c-functions libnausicaa-posix
    (WIFEXITED		(int nausicaa_posix_wifexited (int)))
    (WEXITSTATUS	(int nausicaa_posix_wexitstatus (int)))
    (WIFSIGNALED	(int nausicaa_posix_wifsignaled (int)))
    (WTERMSIG		(int nausicaa_posix_wtermsig (int)))
    (WCOREDUMP		(int nausicaa_posix_wcoredump (int)))
    (WIFSTOPPED		(int nausicaa_posix_wifstopped (int)))
    (WSTOPSIG		(int nausicaa_posix_wstopsig (int))))

  (define-c-functions/with-errno libc-shared-object
    (ctermid		(char* ctermid (char*)))
    (setsid		(pid_t setsid (void)))
    (getsid		(pid_t getsid (pid_t)))
    (getpgrp		(pid_t getpgrp (void)))
    (setpgid		(int setpgid (pid_t pid_t)))
    (tcgetpgrp		(pid_t tcgetpgrp (int)))
    (tcsetpgrp		(pid_t tcsetpgrp (int pid_t)))
    (tcgetsid		(pid_t tcgetsid (int)))))

;;; end of file
