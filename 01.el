;;; 01.el --- Problem 1 of 99
;;; Commentary:
;;
;;  Find the last box of a list. Example:
;;    (my-last '(a b c d))
;;  (D)
;;
;;; Code:

(defun my-last (els)
  "The last box of ELS."
  (pcase (cdr els)
    ((pred null) els)
    (tail (my-last tail))))

(ert-deftest Q01 ()
  (should (equal '(d) (my-last '(a b c d))))

  (should (equal nil (my-last nil)))
  (should (equal '(a) (my-last '(a))))
)
;;; 01.el ends here
