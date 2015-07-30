;;; 22.el --- Problem 22 of 99
;;; Commentary:
;;
;;  Create a list containing all integers within a given range.
;;
;;  If first argument is smaller than second, produce a list in
;;  decreasing order.
;;
;;  (range 4 9)
;;  (4 5 6 7 8 9)
;;
;;; Code:

(require 'e99utils)

(defun range (start end)
  "A list of all sequential integers from START to END (inclusive).
If END comes before START, the list is reversed."
  (if (< end start)
      (reverse (range end start))
    (let (builder)
      (dotimes (i (- (+ 1 end) start) builder)
        (push end builder)
        (cl-incf end -1)))))

(ert-deftest Q22 ()
  (should (equal '(4 5 6 7 8 9)
                 (range 4 9)))

  (should (equal '(9 8 7 6 5 4)
                 (range 9 4)))

  (should (equal '(0) (range 0 0)))

  (should (equal (number-sequence 0 overflow-depth)
                 (range 0 overflow-depth)))
  )


;;; 22.el ends here
