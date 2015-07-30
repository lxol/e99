;;; 23.el --- Problem 23 of 99
;;; Commentary:
;;
;;  Extract a given number of randomly selected elements from a list.
;;
;;  The selected items shall be returned in a list.
;;
;;  (rnd-select '(a b c d e f g h) 3)
;;  (E D A)
;;
;;  Hint: Use the built-in random number generator and the result of
;;  problem P20.
;;
;;; Code:

(require 'e99q20)

(defun rnd-select (list n)
  "From LIST return N randomly selected elements."
  )

(ert-deftest Q23 ()
  ;; really hard to test stochastic code, and API doesn't allow us to
  ;; define the random generator.
  (should (equal 3 (length (rnd-select '(a b c d e f g h) 3))))


  )

;;; 23.el ends here
