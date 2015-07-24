;;; 2.el --- Problem 2 of 99
;;; Commentary:
;;
;;  Find the last but one box of a list.
;;  (my-but-last '(a b c d))
;;    (C D)
;;
;;; Code:

(require 'cl)

(defun my-but-last (els)
  "Last but one box of ELS."
  (let ((head (car els))
        (tail (cdr els)))
    (while (cdr tail)
      (setq head (car tail)
            tail (cdr tail)))
    `(,head . ,tail)))

(assert (equal '(c d) (my-but-last '(a b c d))))

(assert (equal '(b c) (my-but-last '(a b c))))
(assert (equal '(a b) (my-but-last '(a b))))

;;; 2.el ends here
