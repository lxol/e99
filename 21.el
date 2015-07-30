;;; 21.el --- Problem 21 of 99
;;; Commentary:
;;
;;  Insert an element at a given position into a list.
;;
;;  (insert-at 'alfa '(a b c d) 2)
;;  (A ALFA B C D)
;;
;;; Code:

(require 'e99utils)

(defun insert-at (insert list n)
  "A list with INSERT in LIST at index N, 1-indexed."
  (when list
    (let (builder el)
      (dotimes (el (- n 1) (append (reverse builder) (list insert) list))
        (push (pop list) builder)))))

(ert-deftest Q21 ()
  (should (equal '(a alfa b c d)
                 (insert-at 'alfa '(a b c d) 2)))

  (should (equal nil
                 (insert-at 'alfa nil 2)))

  (should (equal '(alfa a b c d)
                 (insert-at 'alfa '(a b c d) 0)))

  (should (equal '(alfa a b c d)
                 (insert-at 'alfa '(a b c d) 1)))

  (should (equal '(a b alfa c d)
                 (insert-at 'alfa '(a b c d) 3)))

  (should (equal '(a b c alfa d)
                 (insert-at 'alfa '(a b c d) 4)))

  (should (equal '(a b c d alfa)
                 (insert-at 'alfa '(a b c d) 5)))

  (should (equal (cons 'alfa (make-list overflow-depth 'a))
                 (insert-at 'alfa (make-list overflow-depth 'a) 1)))

  (should (equal (append (make-list overflow-depth 'a) (list 'alfa))
                 (insert-at 'alfa (make-list overflow-depth 'a) (+ 1 overflow-depth))))

  )

;;; 21.el ends here
