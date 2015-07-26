;;; 08.el --- Problem 8 of 99
;;; Commentary:
;;
;;  Eliminate consecutive duplicates of list elements.
;;
;;  If a list contains repeated elements they should be replaced with a
;;  single copy of the element. The order of the elements should not be
;;  changed.
;;  (compress '(a a a a b c c a a d e e e e))
;;  (A B C A D E)
;;
;;; Code:

(defun compress (list)
  "A new LIST with consecutive duplicates removed."
  )

(ert-deftest Q08 ()
  (should (equal '(a b c a d e) (compress '(a a a a b c c a a d e e e e))))
)

;;; 08.el ends here
