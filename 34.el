;;; 34.el --- Problem 34 of 99

;; Copyright (C) 2015 Sam Halliday
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;;  Calculate Euler's totient function phi(m).
;;
;;  Euler's so-called totient function phi(m) is defined as the number
;;  of positive integers r (1 <= r < m) that are coprime to m.
;;
;;  Example: m = 10: r = 1,3,7,9; thus phi(m) = 4. Note the special
;;  case: phi(1) = 1.
;;
;;  (totient-phi 10)
;;  4
;;
;;  Find out what the value of phi(m) is if m is a prime number.
;;  Euler's totient function plays an important role in one of the
;;  most widely used public key cryptography methods (RSA). In this
;;  exercise you should use the most primitive method to calculate
;;  this function (there are smarter ways that we shall discuss
;;  later).
;;
;;; Code:

(require 'cl-lib)
(require 'e99q33 "33")


(defun totient-phi (n)
  "Number of positive integers `[1, N)' that are coprime to N."
  (let ((count 0))
    (dolist (el (number-sequence 1 n) count)
      (when (coprime n el)
        (cl-incf count)))))

(ert-deftest Q34 ()

  (should (equal 4 (totient-phi 10)))

  )

(provide 'e99q34)

;;; 34.el ends here
