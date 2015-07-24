;;; 1.el --- Problem 1 of 99
;;; Commentary:
;;
;;  Find the last box of a list. Example:
;;    (my-last '(a b c d))
;;  (D)
;;
;;; Code:

(require 'cl)

(defun my-last (els)
  "The last box of ELS."
  (when els
    (or (my-last (cdr els)) els)))

(assert (equal '(d) (my-last '(a b c d))))

(assert (equal nil (my-last nil)))
(assert (equal '(a) (my-last '(a))))

;;; 1.el ends here
