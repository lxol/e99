;;; 04.el --- Problem 4 of 99
;;; Commentary:
;;
;;  Find the number of elements of a list.
;;
;;; Code:

(require 'e99utils)
(require 'cl-lib)

(defun num-elements (list)
  "The number of elements of LIST."
  (let ((num 0))
    (dolist (el list num)
      (cl-incf num))))

(ert-deftest Q04 ()
  (should (equal 0 (num-elements nil)))
  (should (equal 1 (num-elements '(a))))
  (should (equal 2 (num-elements '(a b))))
  (should (equal 3 (num-elements '(a b c))))

  (should (equal overflow-depth
                 (num-elements (number-sequence 1 overflow-depth))))
)

;;; 04.el ends here
