;;; e99utils.el --- Utilities for testing 99 Problems
;;; Commentary:
;;
;;  Common utility methods.
;;
;;; Code:

(defun repeat-n (x n)
  "List of X repeated N times."
  (let ((els nil))
    (dotimes (el n els)
      (setq els (cons x els)))))

(ert-deftest utils ()
  (should (equal nil (repeat-n 'x 0)))
  (should (equal '(x) (repeat-n 'x 1)))
  (should (equal '(x x) (repeat-n 'x 2)))
  (should (equal '(x x x) (repeat-n 'x 3)))

  ;; would be good to check stack overflow
  )

(provide 'e99utils)

;;; e99utils.el ends here
