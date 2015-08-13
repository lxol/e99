;;; 33.el --- Problem 33 of 99

;; Copyright (C) 2015 Sam Halliday
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;;  Determine whether two positive integer numbers are coprime.
;;
;;  Two numbers are coprime if their greatest common divisor equals 1.
;;
;;   (coprime 35 64)
;;    T
;;
;;; Code:

(require 'e99q32 "32")

(defun coprime (first second)
  "T if FIRST and SECOND have a `gcd' of 1."
  (eq 1 (gcd first second)))

(ert-deftest Q33 ()

  (should (coprime 35 64))

  (should (not (coprime 35 63)))

  )

(provide 'e99q33)

;;; 33.el ends here
