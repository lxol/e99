;;; 04.el --- Problem 4 of 99
;;; Commentary:
;;
;;  Find the number of elements of a list.
;;
;;; Code:

(require 'e99utils)

(defun num-elements (lst)
  "The number of elements of LST."
  (let ((num 0))
    (while (not (null lst))
      (setq num (1+ num)
            lst (cdr lst)))
    num))

(ert-deftest Q04 ()
  (should (equal 0 (num-elements nil)))
  (should (equal 1 (num-elements '(a))))
  (should (equal 2 (num-elements '(a b))))
  (should (equal 3 (num-elements '(a b c))))

  (should (equal overflow-depth
                 (num-elements (number-sequence 1 overflow-depth))))
)

;;; 04.el ends here
