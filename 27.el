;;; 27.el --- Problem 27 of 99
;;; Commentary:
;;
;;  Group the elements of a set into disjoint subsets.
;;
;;  a) In how many ways can a group of 9 people work in 3 disjoint
;;  subgroups of 2, 3 and 4 persons? Write a function that generates
;;  all the possibilities and returns them in a list.
;;
;;  (group3 '(aldo beat carla david evi flip gary hugo ida))
;;  ( ( (ALDO BEAT) (CARLA DAVID EVI) (FLIP GARY HUGO IDA) )
;;  ... )
;;
;;  b) Generalize the above predicate in a way that we can specify a
;;  list of group sizes and the predicate will return a list of
;;  groups.
;;
;;  (group '(aldo beat carla david evi flip gary hugo ida) '(2 2 5))
;;  ( ( (ALDO BEAT) (CARLA DAVID) (EVI FLIP GARY HUGO IDA) )
;;  ... )
;;
;;  Note that we do not want permutations of the group members; i.e.
;;  ((ALDO BEAT) ...) is the same solution as ((BEAT ALDO) ...).
;;  However, we make a difference between ((ALDO BEAT) (CARLA DAVID)
;;  ...) and ((CARLA DAVID) (ALDO BEAT) ...).
;;
;; You may find more about this combinatorial problem in a good book on
;; discrete mathematics under the term "multinomial coefficients".
;;
;;; Code:

(require 'cl-lib)
(require 'e99utils)
(require 'e99q26 "26")

(defun group3 (list)
  "A list of lists of 3 disjoint subgroups of LIST of size (2 3 4)."
  (let (builder)
    (dolist (2s (combination 2 list))
      (let ((pool (remove-all 2s list)))
        (dolist (3s (combination 3 pool))
          (let ((4s (remove-all 3s pool)))
            (push (list 2s 3s 4s) builder)))))
    (reverse builder)))

(defun group (list sizes)
  "List of lists of disjoint subgroups of LIST of size defined by SIZES."
  (let (builder)
    (cl-labels ((next (list sizes crumbs)
                      (dolist (cs (combination (car sizes) list))
                        (let ((crumbs (append crumbs `(,cs)))) ;; avoids reverse
                          (if (null (cdr sizes))
                              (push crumbs builder)
                            (next (remove-all cs list) (cdr sizes) crumbs))))))
      (next list sizes nil)
      ;; nreverse because `builder' is no longer used
      (nreverse builder))))

(ert-deftest Q27 ()
  (let ((group3 (group3 '(a b c d e f g h i))))
    (should (equal 1260 (length group3)))
    (should (equal '((a b) (c d e) (f g h i)) (car group3))))

  (let ((group3 (group '(a b c d e f g h i) '(2 3 4))))
    (should (equal 1260 (length group3)))
    (should (equal '((a b) (c d e) (f g h i)) (car group3))))

  (let ((group2 (group '(a b c) '(1 2))))
    (should (equal 3 (length group2)))
    (should (equal '(((a) (b c)) ((b) (a c)) ((c) (a b))) group2)))
  )

;;; 27.el ends here
