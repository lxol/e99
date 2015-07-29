;;; 18.el --- Problem 18 of 99
;;; Commentary:
;;
;;  Extract a slice from a list.*
;;
;;  Given two indices, I and K, the slice is the list containing the
;;  elements between the I'th and K'th element of the original list
;;  (both limits included). Start counting the elements with 1.
;;
;;  (slice '(a b c d e f g h i k) 3 7)
;;  (C D E F G)
;;
;;; Code:

(require 'cl-lib)
(require 'e99utils)

(defun slice (list i k)
  "The elements of LIST between indexes I and K inclusive (1-indexing)."
  (let (builder)
    (cl-incf i -1)
    (dotimes (e k (reverse builder))
      (let ((el (pop list)))
        (when (<= i e) ;; dotimes is zero-indexed
          (push el builder))))))

(ert-deftest Q18 ()
  (should (equal '(c d e f g)
                 (slice '(a b c d e f g h i k) 3 7)))

  (should (equal nil
                 (slice nil 0 0)))

  (should (equal '(a b c d e f g h i k)
                 (slice '(a b c d e f g h i k) 1 10)))

  (should (equal (make-list (+ 1 overflow-depth) 'a)
                 (slice (make-list (* 3 overflow-depth) 'a)
                        (+ 1 overflow-depth) (+ 1 (* 2 overflow-depth)))))

  (let ((list '(a b c d)))
    (should (equal '(b c) (slice list 2 3)))
    ;; testing non-mutation
    (should (equal '(a b c d) list)))

  )

;;; 18.el ends here
