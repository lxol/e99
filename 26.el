;;; 26.el --- Problem 26 of 99
;;; Commentary:
;;
;;  Generate the combinations of K distinct objects chosen from the N
;;  elements of a list.
;;
;;  In how many ways can a committee of 3 be chosen from a group of 12
;;  people? We all know that there are C(12,3) = 220 possibilities
;;  (C(N,K) denotes the well-known binomial coefficients). For pure
;;  mathematicians, this result may be great. But /we/ want to really
;;  generate all the possibilities in a list.
;;
;;  (combination 3 '(a b c d e f))
;;  ((A B C) (A B D) (A B E) ... )
;;
;;; Code:

(require 'e99utils)

(defun combination (n list)
  "All combinations of choosing N elements from a unique LIST."
  (cond ((<= n 0) nil)
        ((eq n 1) (mapcar (lambda(e) (list e)) list))
        (t (let (el builder)
             (while list
               (setq el (pop list))
               (dolist (tail (combination (- n 1) list))
                 (push (cons el tail) builder)))
             (reverse builder)))))

(ert-deftest Q26 ()

  (should (equal '((a b c) (a b d) (a b e) (a c d) (a c e)
                   (a d e) (b c d) (b c e) (b d e) (c d e))
                 (combination 3 '(a b c d e))))

  (should (equal '((a) (b) (c))
                 (combination 1 '(a b c))))

  (should (equal '((a b) (a c) (b c))
                 (combination 2 '(a b c))))

  (should (equal (mapcar 'list (number-sequence 1 overflow-depth))
                 (combination 1 (number-sequence 1 overflow-depth))))
  )


;;; 26.el ends here
