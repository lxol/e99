;;; 07.el --- Problem 7 of 99
;;; Commentary:
;;
;;  Flatten a nested list structure.
;;
;;  Transform a list, possibly holding lists as elements into a `flat' list
;;  by replacing each list with its elements (recursively).
;;
;;  (my-flatten '(a (b (c d) e)))
;;  (A B C D E)
;;
;;  Hint: Use the predefined functions list and append.
;;
;;; Code:

(require 'e99utils)

(defun my-flatten (list)
  "A flattened version of LIST."
  (cond ((listp list)
         (apply 'append (mapcar 'my-flatten list)))
        (t
         (list list))))

(ert-deftest Q07 ()
  (should (equal nil (my-flatten nil)))
  (should (equal '(a) (my-flatten '(a))))
  (should (equal '(a b) (my-flatten '(a b))))
  (should (equal '(a b c d e) (my-flatten '(a (b (c d) e)))))
  (should (equal '(a b c d e) (my-flatten '((((((a b c d e)))))))))
  (should (equal '(a b c) (my-flatten '((a b c) (nil) nil))))

  (should (equal (make-list overflow-depth 'a)
                 (my-flatten (make-list overflow-depth '(a)))))
)

;;; 07.el ends here
