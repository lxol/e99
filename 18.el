;;; 18.el --- Problem 18 of 99
;;; Commentary:
;;
;;  Extract a slice from a list.*
;;
;;  Given two indices, I and K, the slice is the list containing the
;;  elements between the I'th and K'th element of the original list
;;  (both limits included). Start counting the elements with 1.
;;
;;  (slice '(a b c d e f g h i k) 3 7)
;;  (C D E F G)
;;
;;; Code:

(require 'cl-lib)
(require 'e99utils)

;;; 18.el ends here
