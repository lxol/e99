;;; 31.el --- Problem 31 of 99

;; Copyright (C) 2015 Sam Halliday
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;;  Determine whether a given integer number is prime.
;;
;;    (is-prime 7)
;;    T
;;
;;; Code:

(require 'cl-lib)

(defun is-prime (integer)
  "T iff INTEGER is prime, otherwise NIL."
  ;; nobody ever said this should be efficient...
  (and (< 1 integer)
       (cl-every (lambda (el) (not (eq 0 (% integer el))))
                 (number-sequence 2 (1- integer)))))

(ert-deftest Q31 ()

  (should (not (is-prime 1)))
  (should (is-prime 2))
  (should (is-prime 3))
  (should (not (is-prime 4)))
  (should (is-prime 5))
  (should (not (is-prime 6)))
  (should (is-prime 7))
  (should (not (is-prime 8)))

  )

(provide 'e99q31)

;;; 31.el ends here
