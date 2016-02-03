;;; 10.el --- Problem 10 of 99
;;; Commentary:
;;
;;  Run-length encoding of a list.
;;
;;  Use the result of problem P09 to implement the so-called
;;  run-length encoding data compression method. Consecutive
;;  duplicates of elements are encoded as lists (N E) where N is the
;;  number of duplicates of the element E.
;;
;;  (encode '(a a a a b c c a a d e e e e))
;;  ((4 A) (1 B) (2 C) (2 A) (1 D) (4 E))
;;
;;; Code:

(require 'e99utils)

;;; 10.el ends here
