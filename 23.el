;;; 23.el --- Problem 23 of 99
;;; Commentary:
;;
;;  Extract a given number of randomly selected elements from a list.
;;
;;  The selected items shall be returned in a list.
;;
;;  (rnd-select '(a b c d e f g h) 3)
;;  (E D A)
;;
;;  Hint: Use the built-in random number generator and the result of
;;  problem P20.
;;
;;; Code:

(require 'e99q20 "20")
(require 'e99utils)

(defun rnd-select (list n)
  "From LIST return N randomly selected elements.
Unique elements in LIST will not be duplicated."
  (when list
    (let ((builder)
          (rand)
          (length (length list)))
      (dotimes (_ n builder)
        (setq rand (random length)
              length (- length 1)
              builder (cons (nth rand list) builder)
              list (remove-at list (+ 1 rand)))))))

(ert-deftest Q23 ()
  (random "") ;; repeatable random number generation

  (should (equal '(b g h) (rnd-select '(a b c d e f g h) 3)))

  (should (equal nil (rnd-select nil 0)))

  (should (equal nil (rnd-select '(a b c d e f g h) 0)))

  (should (equal '(1 2 3 4 5) (sort (rnd-select '(1 2 3 4 5) 5) '<)))

  (should (equal (number-sequence 1 overflow-depth)
                 (sort (rnd-select (number-sequence 1 overflow-depth) overflow-depth) '<)))
  )

;;; 23.el ends here
