;;; 08.el --- Problem 8 of 99
;;; Commentary:
;;
;;  Eliminate consecutive duplicates of list elements.
;;
;;  If a list contains repeated elements they should be replaced with a
;;  single copy of the element. The order of the elements should not be
;;  changed.
;;  (compress '(a a a a b c c a a d e e e e))
;;  (A B C A D E)
;;
;;; Code:

(require 'e99utils)

(defun compress (list)
  "A new LIST with consecutive duplicates removed."
  (let (deduped last)
    (dolist (el list (reverse deduped))
      (when (not (equal last el))
        (setq deduped (cons el deduped)
              last el)))))

(ert-deftest Q08 ()
  (should (equal '(a b c a d e) (compress '(a a a a b c c a a d e e e e))))

  (should (equal nil (compress nil)))
  (should (equal '(a b c) (compress '(a b c))))
  (should (equal '(a) (compress (make-list overflow-depth 'a))))
)

;;; 08.el ends here
