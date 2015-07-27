;;; 02.el --- Problem 2 of 99
;;; Commentary:
;;
;;  Find the last but one box of a list.
;;  (my-but-last '(a b c d))
;;    (C D)
;;
;;; Code:

(require 'e99utils)

(defun my-but-last (list)
  "Last but one box of LIST."
  (while (cddr list)
    (pop list))
  list)


(ert-deftest Q02 ()
  (should (equal '(c d) (my-but-last '(a b c d))))

  (should (equal '(b c) (my-but-last '(a b c))))
  (should (equal '(a b) (my-but-last '(a b))))

  (should (equal `(,(1- overflow-depth) ,overflow-depth) (my-but-last (number-sequence 1 overflow-depth)) ))
)

;;; 02.el ends here
