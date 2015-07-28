;;; 11.el --- Problem 11 of 99
;;; Commentary:
;;
;;  Modified run-length encoding.
;;
;;  Modify the result of problem P10 in such a way that if an element
;;  has no duplicates it is simply copied into the result list. Only
;;  elements with duplicates are transferred as (N E) lists.
;;
;;  (encode-modified '(a a a a b c c a a d e e e e))
;;  ((4 A) B (2 C) (2 A) D (4 E))
;;
;;; Code:

(require 'e99q09)

(defun encode-modified (list)
  "Alternative run-length encoded LIST with an O(n) memory requirement."
  (mapcar (lambda (el) (cond
                   ((cdr el) (list (length el) (car el)))
                   (t        (car el))))
          (pack list)))

(ert-deftest Q11 ()
  (should (equal '((4 a) b (2 c) (2 a) d (4 e))
                 (encode-modified '(a a a a b c c a a d e e e e))))

  (should (equal nil (encode-modified nil)))
  (should (equal '((10 a)) (encode-modified (make-list 10 'a))))
  (should (equal '((10 nil)) (encode-modified (make-list 10 'nil))))

  (should (equal `((,overflow-depth a))
                 (encode-modified (make-list overflow-depth 'a))))

  )


;;; 11.el ends here
