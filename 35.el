;;; 35.el --- Problem 35 of 99

;; Copyright (C) 2015 Sam Halliday
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;;  Determine the prime factors of a given positive integer.
;;
;;  Construct a flat list containing the prime factors in ascending order.
;;
;;    (prime-factors 315)
;;    (3 3 5 7)
;;
;;; Code:

(defun prime-factors (integer)
  "List of INTEGER's prime factors."

  )

(ert-deftest Q35 ()

  (should (equal '(3 3 5 7) (prime-factors 315)))

  )


;;; 35.el ends here
