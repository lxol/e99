;;; 03.el --- Problem 3 of 99
;;; Commentary:
;;
;;  Find the K'th element of a list.
;;  The first element in the list is number 1.
;;  (element-at '(a b c d e) 3)\\
;;  C
;;
;;; Code:

(defun element-at (els k)
  "Element of ELS at position K (1-based indexing)."
  (if (<= k 1)
      (car els)
    (element-at (cdr els) (1- k))))

(ert-deftest Q03 ()
  (should (equal 'c (element-at '(a b c d e) 3)))

  (should (equal 'a (element-at '(a b c d e) 1)))
  (should (equal 'a (element-at '(a) 1)))

  (should (equal nil (element-at '(a b c d e) 6)))
  (should (equal 'a (element-at '(a b c d e) 0)))
)

;;; 03.el ends here
