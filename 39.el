;;; 39.el --- Problem 39 of 99 -*- lexical-binding: t -*-

;; Copyright (C) 2015 Sam Halliday
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;;  Given a range of integers by its lower and upper limit, construct
;;  a list of all prime numbers in that range.
;;
;;; Code:

(require 'e99q31 "31")

(defun primes-in-range (from to)
  "All primes in the range [FROM, TO]."
  (let ((primes)
        (trial from))
    (while (<= trial to)
      (when (is-prime trial)
        (push trial primes))
      (cl-incf trial))
    (nreverse primes)))

(ert-deftest Q39 ()

  (should (equal
           '(2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97)
           (primes-in-range 1 100)))

  (should (equal
           '(101 103 107 109 113 127 131 137 139 149 151 157 163 167 173 179 181 191 193 197 199)
           (primes-in-range 100 200)))

  )

;; Local Variables:
;; compile-command: "cask exec ert-runner 39.el"
;; End:

;;; 39.el ends here
