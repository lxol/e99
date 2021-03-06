;;; 28.el --- Problem 28 of 99
;; Copyright (C) 2015 Sam Halliday
;; Author: Sam Halliday <Sam.Halliday@gmail.com>
;;; Commentary:
;;
;;  Sorting a list of lists according to length of sublists
;;
;;  a) We suppose that a list contains elements that are lists
;;     themselves. The objective is to sort the elements of this list
;;     according to their *length*. E.g. short lists first, longer
;;     lists later, or vice versa.
;;
;;     (lsort '((a b c) (d e) (f g h) (d e) (i j k l) (m n) (o)))
;;     ((O) (D E) (D E) (M N) (A B C) (F G H) (I J K L))
;;
;;  b) Again, we suppose that a list contains elements that are lists
;;     themselves. But this time the objective is to sort the elements
;;     of this list according to their *length frequency*; i.e., in
;;     the default, where sorting is done ascendingly, lists with rare
;;     lengths are placed first, others with a more frequent length
;;     come later.
;;
;;     (lfsort '((a b c) (d e) (f g h) (d e) (i j k l) (m n) (o)))
;;     ((i j k l) (o) (a b c) (f g h) (d e) (d e) (m n))
;;
;;     Note that in the above example, the first two lists in the
;;     result have length 4 and 1, both lengths appear just once. The
;;     third and forth list have length 3 which appears twice (there
;;     are two list of this length). And finally, the last three lists
;;     have length 2. This is the most frequent length.
;;
;;; Code:

;; Looking in the original prolog solution, use of built-in `sort' is allowed.


;;; 28.el ends here
