;;; 10.el --- Problem 10 of 99
;;; Commentary:
;;
;;  Run-length encoding of a list.
;;
;;  Use the result of problem P09 to implement the so-called
;;  run-length encoding data compression method. Consecutive
;;  duplicates of elements are encoded as lists (N E) where N is the
;;  number of duplicates of the element E.
;;
;;  (encode '(a a a a b c c a a d e e e e))
;;  ((4 A) (1 B) (2 C) (2 A) (1 D) (4 E))
;;
;;; Code:

(require 'e99utils)
(require 'e99q09)

(defun encode (list)
  "Run-length encoded LIST with an O(n) memory requirement."
  (mapcar (lambda (el) (list (length el) (car el)))
          (pack list)))

(ert-deftest Q10 ()
  (should (equal '((4 a) (1 b) (2 c) (2 a) (1 d) (4 e))
                 (encode '(a a a a b c c a a d e e e e))))

  (should (equal nil (encode nil)))
  (should (equal '((10 a)) (encode (make-list 10 'a))))
  (should (equal '((10 nil)) (encode (make-list 10 'nil))))

  (should (equal `((,overflow-depth a))
                 (encode (make-list overflow-depth 'a))))
  )

;;; 10.el ends here
