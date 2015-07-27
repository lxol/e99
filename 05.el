;;; 05.el --- Problem 5 of 99
;;; Commentary:
;;
;;  Reverse a list.
;;
;;; Code:

(require 'e99utils)

(defun my-reverse (list)
  "A list with the same elements as LIST in reverse order."
  (let (builder)
    (dolist (el list builder)
      (push el builder))))

(ert-deftest Q05 ()
  (should (equal nil (my-reverse nil)))
  (should (equal '(a) (my-reverse '(a))))
  (should (equal '(b a) (my-reverse '(a b))))
  (should (equal '(c b a) (my-reverse '(a b c))))

  (should (equal (reverse (number-sequence 1 overflow-depth))
                 (my-reverse (number-sequence 1 overflow-depth))))
)

;;; 05.el ends here
