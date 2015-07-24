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
  (let ((el els))
    (while (not (eq nil (cdr el)))
      (setq el (cdr el)))
    el))

(assert (equal '(d) (my-last '(a b c d))))

(assert (equal nil (my-last nil)))
(assert (equal '(a) (my-last '(a))))

;;; 1.El ends here
