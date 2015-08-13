;;; 32.el --- Problem 32 of 99

;; Copyright (C) 2015 Sam Halliday
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;;  Determine the greatest common divisor of two positive integer
;;  numbers. Use Euclid's algorithm.
;;
;;   (gcd 36 63)
;;   9
;;
;;; Code:

(defun gcd (first second)
  "The greatest common divisor of FIRST and SECOND using Euclid's algorithm."
  (let (tmp)
    (while (not (eq 0 second))
      (setq tmp second
            second (mod first second)
            first tmp))
    tmp))

(ert-deftest Q32 ()

  (should (equal 9 (gcd 36 63)))

  (should (equal 21 (gcd 1071 462)))

  (should (equal 21 (gcd 252 105)))

  )

(provide 'e99q32)

;;; 32.el ends here
