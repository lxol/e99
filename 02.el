;;; 02.el --- Problem 2 of 99
;;; Commentary:
;;
;;  Find the last but one box of a list.
;;  (my-but-last '(a b c d))
;;    (C D)
;;
;;; Code:

(defun my-but-last (lst)
  "Last but one box of LST."
  (while (not (null (cddr lst)))
    (setq lst (cdr lst)))
  lst)


(ert-deftest Q02 ()
  (should (equal '(c d) (my-but-last '(a b c d))))

  (should (equal '(b c) (my-but-last '(a b c))))
  (should (equal '(a b) (my-but-last '(a b))))

  (should (equal '(999 1000) (my-but-last (number-sequence 1 1000)) ))
)

;;; 02.el ends here
