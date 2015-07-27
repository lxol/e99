;;; 06.el --- Problem 6 of 99
;;; Commentary:
;;
;;  Find out whether a list is a palindrome.
;;
;;  A palindrome can be read forward or backward; e.g. (x a m a x).
;;
;;; Code:

(require 'e99utils)

(defun palindrome-p (list)
  "True if LIST is a palindrome."
  (equal list (reverse list)))

(ert-deftest Q06 ()
  (should (palindrome-p '(x a m a x)))

  (should (not (palindrome-p '(x m a a x))))

  (should (palindrome-p nil))

  (should (palindrome-p (repeat-n 'x overflow-depth)))
)

;;; 06.el ends here
