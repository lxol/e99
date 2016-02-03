;;; 48.el --- Problem 48 of 99 -*- lexical-binding: t -*-

;; Copyright (C) 2015 Sam Halliday
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;;  Truth tables for logical expressions (3)
;;
;;  Generalize problem P46 in such a way that the logical expression
;;  may contain any number of logical variables. Define table in a way
;;  that (table Expr) prints the truth table for the expression Expr,
;;  which contains the logical variables enumerated in List.
;;
;;   A and (B or C) equiv A and B or A and C
;;   =>
;;   (A and (B or C)) equiv ((A and B) or (A and C))
;;
;;   (table (lambda (A B C)
;;              (truth-equiv
;;                (truth-and A (truth-or B C))
;;                (truth-or (truth-and A B) (truth-and A C)))))
;;
;;   true  true  true  true
;;   true  true  fail  true
;;   true  fail  true  true
;;   true  fail  fail  true
;;   fail  true  true  true
;;   fail  true  fail  true
;;   fail  fail  true  true
;;   fail  fail  fail  true
;;
;;; Code:

;; Local Variables:
;; compile-command: "cask exec ert-runner 48.el"
;; End:

;;; 48.el ends here
