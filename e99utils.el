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

(defun args (function)
  ;; HACK https://groups.google.com/d/msg/gnu.emacs.help/r0HWn7EYX8A/leKqcft8AwAJ
  "The arg list of FUNCTION."
  (let ((kind (car function)))
    (if (eq kind 'closure)
        (cadr (cdr function))
      (cadr function))))

(defun contain-same-elements (a b)
  "Non nil iff A and B contain the same elements."
  (and (eq (length a) (length b))
       (null (dolist (i a b)
               (when (member i b)
                 ;; suboptimal, should really break early
                 (setq b (cl-remove i b :count 1 :test 'equal)))))))

(ert-deftest utils ()
  ;; can only test the lexical-binding variant in CI
  ;; but dynamic-binding is tested interactively
  (should (equal '(a b c) (args (lambda (a b c) `(,c ,a ,b)))))

  (should (contain-same-elements '(a b c d) '(b c a d)))

  (should (contain-same-elements
           '((t t t t) (t t nil t) (t nil t t) (t nil nil t) (nil t t t) (nil t nil t) (nil nil t t) (nil nil nil t))
           '((nil t t t) (t t t t) (nil nil t t) (t nil t t) (nil t nil t) (t t nil t) (nil nil nil t) (t nil nil t))))
  )

(provide 'e99utils)

;;; e99utils.el ends here
