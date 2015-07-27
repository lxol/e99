;;; 03.el --- Problem 3 of 99
;;; Commentary:
;;
;;  Find the K'th element of a list.
;;  The first element in the list is number 1.
;;  (element-at '(a b c d e) 3)\\
;;  C
;;
;;; Code:

(require 'e99utils)
(require 'cl-lib)

(defun element-at (list k)
  "Element of LIST at position K (1-based indexing)."
  (while (> k 1)
    (pop list)
    (cl-incf k -1))
  (car list))

(ert-deftest Q03 ()
  (should (equal 'c (element-at '(a b c d e) 3)))

  (should (equal 'a (element-at '(a b c d e) 1)))
  (should (equal 'a (element-at '(a) 1)))

  (should (equal nil (element-at '(a b c d e) 6)))
  (should (equal 'a (element-at '(a b c d e) 0)))

  (should (equal overflow-depth (element-at (number-sequence 1 overflow-depth) overflow-depth)))
)

;;; 03.el ends here
