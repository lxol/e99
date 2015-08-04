;;; e99utils.el --- Utilities for testing 99 Problems
;;; Commentary:
;;
;;  Common utility methods.
;;
;;; Code:

(defvar overflow-depth (* 2 max-lisp-eval-depth))

(defun remove-all (els list)
  "Delete all elements ELS from LIST."
  (dolist (el els list)
    (setq list (remove el list))))


(provide 'e99utils)

;;; e99utils.el ends here
