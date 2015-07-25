;;; 04.el --- Problem 4 of 99
;;; Commentary:
;;
;;  Find the number of elements of a list.
;;
;;; Code:

(defun num-elements (els)
  "The number of elements of ELS.  Can't handle loops."
  (if (null els)
      0
    (1+ (num-elements (cdr els)))))

(ert-deftest Q04 ()
  (should (equal 0 (num-elements nil)))
  (should (equal 1 (num-elements '(a))))
  (should (equal 2 (num-elements '(a b))))
  (should (equal 3 (num-elements '(a b c))))
)

;;; 04.el ends here
