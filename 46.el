;;; 46.el --- Problem 46 of 99 -*- lexical-binding: t -*-

;; Copyright (C) 2015 Sam Halliday
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;;  Truth tables for logical expressions.
;;
;;  Define functions truth-and, truth-or, truth-nand, truth-nor,
;;  truth-xor, truth-impl (a implies b) and truth-equ (a and b are
;;  equal) which succeed or fail according to the result of their
;;  respective operations; e.g. and(A B) will succeed, if and only if
;;  both A and B succeed. A and B can be functions.
;;
;;  A logical expression in two variables can then be written in
;;  prefix notation, as in the following example:
;;   (lambda (A B) (truth-and (truth-or A B) (truth-nand A B)))
;;
;;  Now, write a predicate truth-table which prints the truth table of a
;;  given logical expression in two variables.
;;
;;   (truth-table (lambda (a b) (truth-and a (truth-or a b))))
;;
;;   true  true  true
;;   true  fail  true
;;   fail  true  fail
;;   fail  fail  fail
;;
;;; Code:


;; Local Variables:
;; compile-command: "cask exec ert-runner 46.el"
;; End:

;;; 46.el ends here
