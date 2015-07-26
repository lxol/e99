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

(defun my-flatten (lst)
  "A flattened version of LST."
  (let (el els flat)
    (while lst
      (setq el (car lst)
            els (if (listp el)
                    (my-flatten el) ;; assumes shallow nesting
                  (list el))
            flat (append flat els)
            lst (cdr lst)))
    flat))

(ert-deftest Q07 ()
  (should (equal '(a) (my-flatten '(a))))
  (should (equal '(a b) (my-flatten '(a b))))
  (should (equal '(a b c d e) (my-flatten '(a (b (c d) e)))))
  (should (equal '(a b c d e) (my-flatten '((((((a b c d e)))))))))
  (should (equal '(a b c) (my-flatten '((a b c) (nil) nil))))
  )

;;; 07.el ends here
