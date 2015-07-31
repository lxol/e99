;;; 24.el --- Problem 24 of 99
;;; Commentary:
;;
;;  Lotto: Draw N different random numbers from the set 1..M.
;;
;;  The selected numbers shall be returned in a list.
;;
;;  (lotto-select 6 49)
;;  (23 1 17 33 21 37)
;;
;;  Hint: Combine the solutions of problems P22 and P23.
;;
;;; Code:

(require 'e99utils)
(require 'e99q22 "22")
(require 'e99q23 "23")

(defun lotto-select (draws max)
  "Make DRAWS from the integers from 1 to MAX (inclusive)."
  (rnd-select (range 1 max) draws))

(ert-deftest Q24 ()
  (random "")

  (should (equal '(47 28 20 2 18 14)
                 (lotto-select 6 49)))

  )

;;; 24.el ends here
