;;; 41.el --- Problem 41 of 99 -*- lexical-binding: t -*-

;; Copyright (C) 2015 Sam Halliday
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;;  A list of Goldbach compositions.
;;
;;  Given a range of integers by its lower and upper limit, print a
;;  list of all even numbers and their Goldbach composition.
;;
;;  (goldbach-list 9 20)
;;  10 = 3 + 7
;;  12 = 5 + 7
;;  14 = 3 + 11
;;  16 = 3 + 13
;;  18 = 5 + 13
;;  20 = 3 + 17
;;
;;  In most cases, if an even number is written as the sum of two
;;  prime numbers, one of them is very small. Very rarely, the primes
;;  are both bigger than say 50. Try to find out how many such cases
;;  there are in the range 2..3000.
;;
;;  (goldbach-list 1 2000 50)
;;  992 = 73 + 919
;;  1382 = 61 + 1321
;;  1856 = 67 + 1789
;;  1928 = 61 + 1867
;;
;;; Code:


;; Local Variables:
;; compile-command: "cask exec ert-runner 41.el"
;; End:

;;; 41.el ends here
