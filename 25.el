;;; 25.el --- Problem 25 of 99
;;; Commentary:
;;
;;  Generate a random permutation of the elements of a list.
;;
;;  (rnd-permu '(a b c d e f))
;;  (B A D C E F)
;;
;;  Hint: Use the solution of problem P23.
;;
;;; Code:

(require 'e99q23 "23")

(defun rnd-permu (list)
  "A random permutation of LIST."
  (rnd-select list (length list)))

(ert-deftest Q25 ()
  (should (equal '(1 2 3 4 5)
                 (sort (rnd-permu '(1 2 3 4 5)) '<)))

  (should (equal (number-sequence 1 overflow-depth)
                 (sort (rnd-permu (number-sequence 1 overflow-depth)) '<)))

  )

;;; 25.el ends here
