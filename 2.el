;;; 2.el --- Problem 2 of 99
;;; Commentary:
;;
;;  Find the last but one box of a list.
;;  (my-but-last '(a b c d))
;;    (C D)
;;
;;; Code:

(defun my-but-last (els)
  "Last but one box of ELS."
  (pcase (cdr (cdr els))
    ((pred null) els)
    (else (my-but-last (cdr els)))))


(ert-deftest Q2 ()
  (should (equal '(c d) (my-but-last '(a b c d))))

  (should (equal '(b c) (my-but-last '(a b c))))
  (should (equal '(a b) (my-but-last '(a b))))
)

;;; 2.el ends here
