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
  "The last element of ELS."
  (let ((el els))
    (while (not (eq nil (cdr el)))
      (setq el (cdr el)))
    (car el)))

(assert (eq 'd (my-last '(a b c d))))

(assert (eq nil (my-last nil)))
(assert (eq 'a (my-last '(a))))

;;; 1.El ends here
