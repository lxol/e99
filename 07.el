;;; 07.el --- Problem 7 of 99
;;; Commentary:
;;
;;  Flatten a nested list structure.
;;
;;  Transform a list, possibly holding lists as elements into a `flat' list
;;  by replacing each list with its elements (recursively).
;;
;;  (my-flatten '(a (b (c d) e)))
;;  (A B C D E)
;;
;;  Hint: Use the predefined functions list and append.
;;
;;; Code:

(defun my-flatten (lst)
  "A flattened version of LST."
  )

(ert-deftest Q07 ()
  (should (equal '(a b c d e) (my-flatten '(a (b (c d) e)))))
  )

;;; 07.el ends here
