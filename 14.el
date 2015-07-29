;;; 14.el --- Problem 14 of 99
;;; Commentary:
;;
;;  Duplicate the elements of a list.
;;
;;  (dupli '(a b c c d))\\
;;  (A A B B C C C C D D)
;;
;;; Code:

(require 'e99utils)

(defun dupli (list)
  "A version of LIST with all elements duplicated."
  (let (builder)
    (dolist (el (reverse list) builder)
      (dotimes (_ 2)
        (push el builder)))))

(ert-deftest Q14 ()
  (should (equal '(a a b b c c c c d d)
                 (dupli '(a b c c d))))

  (should (equal nil (dupli nil)))

  (should (equal (make-list (* 2 overflow-depth) 'a)
                 (dupli (make-list overflow-depth 'a))))
  )

;;; 14.el ends here
