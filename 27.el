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

(require 'e99q26 "26")

(defun remove-all (els list)
  ;; does elisp have this already?
  "Delete all elements ELS from LIST."
  (dolist (el els list)
    (setq list (remove el list))))

(defun group3 (list)
  "A list of lists of 3 disjoint subgroups of LIST that flatten to LIST."
  (let (builder)
    (dolist (2s (combination 2 list))
      (let ((pool (remove-all 2s list)))
        (dolist (3s (combination 3 pool))
          (let ((4s (remove-all 3s pool)))
            (push (list 2s 3s 4s) builder)))))
    (reverse builder)))

(group3 '(a b c d e f g h i))

;;; 27.el ends here
