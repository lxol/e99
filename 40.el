;;; 40.el --- Problem 40 of 99 -*- lexical-binding: t -*-

;; Copyright (C) 2015 Sam Halliday
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;;  Goldbach's conjecture says that every positive even number greater
;;  than 2 is the sum of two prime numbers. Example: 28 = 5 + 23. It
;;  is one of the most famous facts in number theory that has not been
;;  proved to be correct in the general case. It has been
;;  /numerically/ confirmed up to very large numbers (much larger than
;;  we can go with our Lisp system). Write a function to find the
;;  two prime numbers that sum up to a given even integer.
;;
;;  (goldbach 28)
;;  (5 23)
;;
;;; Code:

(require 'e99q31 "31")

(defun goldbach (n)
  "Two primes that sum to the even integer N that is gte 6."
  (let ((left 2)
        (right))
    (while
        (progn
          (cl-incf left)
          (setq right (- n left))
          (or (not (is-prime left))
              (not (is-prime right)))))
    (list left right)))

(ert-deftest Q40 ()

  (should (equal '(5 23) (goldbach 28)))

  (dolist (el (number-sequence 6 50 2))
    (goldbach el))
)

(provide 'e99q40)

;; Local Variables:
;; compile-command: "cask exec ert-runner 40.el"
;; End:

;;; 40.el ends here
