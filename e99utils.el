;;; e99utils.el --- Utilities for testing 99 Problems
;;; Commentary:
;;
;;  Common utility methods.
;;
;;; Code:

(require 'cl-lib)

(defvar overflow-depth (* 2 max-lisp-eval-depth))

(defun remove-all (els list)
  "Delete all elements ELS from LIST."
  (dolist (el els list)
    (setq list (remove el list))))

(defun contain-same-elements (a b)
  "Non nil iff A and B contain the same elements."
  (and (eq (length a) (length b))
       (null (dolist (i a b)
               (when (member i b)
                 ;; suboptimal, should really break early
                 (setq b (cl-remove i b :count 1 :test 'equal)))))))

(defun add-to-end (list el)
  "LIST with EL at the end."
  (append list (list el)))

(ert-deftest utils ()
  (should (contain-same-elements '(a b c d) '(b c a d)))

  (should (contain-same-elements
           '((t t t t) (t t nil t) (t nil t t) (t nil nil t) (nil t t t) (nil t nil t) (nil nil t t) (nil nil nil t))
           '((nil t t t) (t t t t) (nil nil t t) (t nil t t) (nil t nil t) (t t nil t) (nil nil nil t) (t nil nil t))))

  (should (equal '(a b c d)
                 (add-to-end '(a b c) 'd)))

  )

(provide 'e99utils)

;;; e99utils.el ends here
