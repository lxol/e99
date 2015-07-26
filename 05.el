;;; 05.el --- Problem 5 of 99
;;; Commentary:
;;
;;  Reverse a list.
;;
;;; Code:

(defun reverse-lst (lst)
  "A list with the same elements as LST in reverse order."
  (let ((builder nil))
    (while (not (null lst))
      (setq builder (cons (car lst) builder)
            lst (cdr lst)))
    builder))


(ert-deftest Q05 ()
  (should (equal nil (reverse-lst nil)))
  (should (equal '(a) (reverse-lst '(a))))
  (should (equal '(b a) (reverse-lst '(a b))))
  (should (equal '(c b a) (reverse-lst '(a b c))))

  (should (equal (reverse (number-sequence 1 1000))
                 (reverse-lst (number-sequence 1 1000))))
)

;;; 05.el ends here
