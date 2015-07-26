;;; 01.el --- Problem 1 of 99
;;; Commentary:
;;
;;  Find the last box of a list. Example:
;;    (my-last '(a b c d))
;;  (D)
;;
;;; Code:

(require 'e99utils)

(defun my-last (lst)
  "The last box of LST."
  (while (not (null (cdr lst)))
    (setq lst (cdr lst)))
  lst)

(ert-deftest Q01 ()
  (should (equal '(d) (my-last '(a b c d))))

  (should (equal nil (my-last nil)))
  (should (equal '(a) (my-last '(a))))

  ;; check for stack overflows
  (should (equal `(,overflow-depth) (my-last (number-sequence 1 overflow-depth))))
)
;;; 01.el ends here
