;;; 20.el --- Problem 20 of 99
;;; Commentary:
;;
;;  Remove the K'th element from a list.
;;
;;  (remove-at '(a b c d) 2)
;;  (A C D)
;;
;;; Code:

(require 'e99utils)

(defun remove-at (list n)
  "LIST with element N removed, 1-indexed."
  (when list
    (let (builder)
      (dotimes (i n (append (reverse (cdr builder)) list))
        (push (pop list) builder)))))

(ert-deftest Q20 ()
  (should (equal '(a c d)
                 (remove-at '(a b c d) 2)))

  (should (equal nil
                 (remove-at nil 0)))

  (should (equal '(a b c)
                 (remove-at '(a b c d) 4)))

  (should (equal (- overflow-depth 1)
                 (length (remove-at (make-list overflow-depth 'x) overflow-depth))))
  )

;;; 20.el ends here
