;;; 19.el --- Problem 19 of 99
;;; Commentary:
;;
;;  Rotate a list N places to the left.
;;
;;  (rotate '(a b c d e f g h) 3)
;;  (D E F G H A B C)
;;
;;  (rotate '(a b c d e f g h) -2)
;;  (G H A B C D E F)
;;
;;  Hint: Use the predefined functions length and append, as well as
;;  the result of problem P17.
;;
;;; Code:

(require 'e99utils)

(defun rotate (list n)
  "Rotated LIST with places moved N to the left."
  (when list
    (let ((builder)
          (el)
          (n (if (< n 0) (+ n (length list)) n)))
      (dotimes (i n (append list (reverse builder)))
        (push (pop list) builder)))))


(ert-deftest Q19 ()
  (should (equal '(d e f g h a b c)
                 (rotate '(a b c d e f g h) 3)))

  (should (equal '(g h a b c d e f)
                 (rotate '(a b c d e f g h) -2)))

  (should (equal nil
                 (rotate nil 0)))
  (should (equal nil
                 (rotate nil -1)))
  (should (equal nil
                 (rotate nil 2)))

  (should (equal '(a b c d e f g h)
                 (rotate '(a b c d e f g h) 0)))
  (should (equal '(a b c d e f g h)
                 (rotate '(a b c d e f g h) 8)))

  (let ((xs (make-list overflow-depth 'x)))
    (should (equal xs (rotate xs 10))))

  )

;;; 19.el ends here
