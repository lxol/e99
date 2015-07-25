;;; 05.el --- Problem 5 of 99
;;; Commentary:
;;
;;  Reverse a list.
;;
;;; Code:

(defun reverse-list (els)
  "A list with the same elements as ELS in reverse order."
  (if (null els)
      nil
    (pcase (reverse-list (cdr els))
      ((pred null) els)
      (rem `(,@rem ,(car els))))))

(ert-deftest Q05 ()
  (should (equal nil (reverse-list nil)))
  (should (equal '(a) (reverse-list '(a))))
  (should (equal '(b a) (reverse-list '(a b))))
  (should (equal '(c b a) (reverse-list '(a b c))))
)

;;; 05.el ends here
