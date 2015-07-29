;;; 15.el --- Problem 15 of 99
;;; Commentary:
;;
;;  Replicate the elements of a list a given number of times.
;;
;;  (repli '(a b c) 3)
;;  (A A A B B B C C C)
;;
;;; Code:

(require 'e99utils)

(defun repli (list times)
  "A version of LIST with all elements duplicated TIMES."
  (let (builder)
    (dolist (el (reverse list) builder)
      (dotimes (_ times)
        (push el builder)))))

(ert-deftest Q15 ()
  (should (equal '(a a a b b b c c c)
                 (repli '(a b c) 3)))

  (should (equal nil (repli nil 0)))
  (should (equal nil (repli nil 1)))

  (should (equal '(a a a a a a b b b c c c)
                 (repli '(a a b c) 3)))

  (should (equal (make-list overflow-depth 'a)
                 (repli '(a) overflow-depth)))

  )

;;; 15.el ends here
