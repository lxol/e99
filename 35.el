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

(require 'cl-lib)
(require 'e99q31 "31")

(defun prime-factors (integer)
  "List of INTEGER's prime factors."
  (let ((factors nil)
        (prime 2))
    (while (not (eq 1 integer))
      (if (not (eq 0 (% integer prime)))
          (while (progn
                   (cl-incf prime)
                   (not (is-prime prime))))
        (push prime factors)
        (setq integer (/ integer prime))))
    (nreverse factors)))

(ert-deftest Q35 ()

  (should (equal '(3 3 5 7) (prime-factors 315)))

  )


;;; 35.el ends here
