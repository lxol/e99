;;; 41.el --- Problem 41 of 99 -*- lexical-binding: t -*-

;; Copyright (C) 2015 Sam Halliday
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;;  A list of Goldbach compositions.
;;
;;  Given a range of integers by its lower and upper limit, print a
;;  list of all even numbers and their Goldbach composition.
;;
;;  (goldbach-list 9 20)
;;  10 = 3 + 7
;;  12 = 5 + 7
;;  14 = 3 + 11
;;  16 = 3 + 13
;;  18 = 5 + 13
;;  20 = 3 + 17
;;
;;  In most cases, if an even number is written as the sum of two
;;  prime numbers, one of them is very small. Very rarely, the primes
;;  are both bigger than say 50. Try to find out how many such cases
;;  there are in the range 2..3000.
;;
;;  (goldbach-list 1 2000 50)
;;  992 = 73 + 919
;;  1382 = 61 + 1321
;;  1856 = 67 + 1789
;;  1928 = 61 + 1867
;;
;;; Code:

(require 'cl-lib)
(require 'e99q40 "40")

(defun goldbach-list (from to &optional min)
  "All even numbers in [FROM, TO] with their Goldbach composition.
If MIN is set, messages will only be included if the parts are larger than MIN."
  (let ((trial (max from 6))
        (solns))
    (while (<= trial to)
      (when (cl-evenp trial)
        (let* ((goldbach (goldbach trial))
               (left (car goldbach))
               (right (cadr goldbach)))
          (when (or (not min) (and (< min left) (< min right)))
            (push (list trial left right) solns))))
      (cl-incf trial))
    (nreverse solns)))

(ert-deftest Q41 ()

  (should (equal
           '((10 3 7) (12 5 7) (14 3 11) (16 3 13) (18 5 13) (20 3 17))
           (goldbach-list 9 20)))

  (should (equal
           '((992 73 919) (1382 61 1321) (1856 67 1789) (1928 61 1867))
           (goldbach-list 1 2000 50)))

  (should (equal
           '((992 73 919) (1382 61 1321) (1856 67 1789) (1928 61 1867) (2078 61 2017) (2438 61 2377) (2512 53 2459) (2530 53 2477) (2618 61 2557) (2642 103 2539))
           (goldbach-list 2 3000 50)))

  )

;; Local Variables:
;; compile-command: "cask exec ert-runner 41.el"
;; End:

;;; 41.el ends here
