;;; 09.el --- Problem 9 of 99
;;; Commentary:
;;
;;  Pack consecutive duplicates of list elements into sublists.
;;
;;  If a list contains repeated elements they should be placed in
;;  separate sublists.
;;
;;  (pack '(a a a a b c c a a d e e e e))
;;  ((A A A A) (B) (C C) (A A) (D) (E E E E))
;;
;;; Code:

(require 'e99utils)

(defun pack (list)
  "A list with consecutive duplicates from LIST grouped as lists."
  (when list
    (let (current groups)
      (dolist (el list (reverse (cons current groups)))
        (cond ((null current)      (setq current (list el)))
              ((member el current) (push el current))
              (t                   (push current groups)
                                   (setq current (list el)))
              )))))

(ert-deftest Q09 ()
  (should (equal '((a a a a) (b) (c c) (a a) (d) (e e e e))
                 (pack '(a a a a b c c a a d e e e e))))

  (should (equal nil (pack nil)))
  (should (equal '((nil)) (pack (list nil))))
  (should (equal '((nil nil)) (pack (list nil nil))))
  (should (equal (list (make-list overflow-depth 'a))
                 (pack (make-list overflow-depth 'a))))
  )

(provide 'e99q09)

;;; 09.el ends here
