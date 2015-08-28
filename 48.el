;;; 48.el --- Problem 48 of 99 -*- lexical-binding: t -*-

;; Copyright (C) 2015 Sam Halliday
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;;  Truth tables for logical expressions (3)
;;
;;  Generalize problem P46 in such a way that the logical expression
;;  may contain any number of logical variables. Define table/2 in a
;;  way that table(List,Expr) prints the truth table for the
;;  expression Expr, which contains the logical variables enumerated
;;  in List.
;;
;;   A and (B or C) equ A and B or A and C
;;   =>
;;   (A and (B or C)) equ ((A and B) or (A and C))
;;
;;   (table (lambda (A B C)
;;              (truth-equ
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

(defun args (function)
  ;; HACK https://groups.google.com/d/msg/gnu.emacs.help/r0HWn7EYX8A/leKqcft8AwAJ
  "The arg list of FUNCTION."
  (let ((kind (car function)))
    (if (eq kind 'closure)
        (caddr function)
      (cadr function))))

(defun table (expr)
  "The truth table for the function EXPR of an arbitrary number of parameters."
  (let ((nargs (length (args expr))))
    ;; TODO create a list of the trials and pass them to the expr
    nargs
    ))

(ert-deftest Q48 ()
  ;; can only test the lexical-binding variant
  (should (equal '(a b c) (args (lambda (a b c) `(,c ,a ,b)))))

  (should (equal
           '((t    t    t    t)
             (t    t    nil  t)
             (t    nil  t    t)
             (t    nil  nil  t)
             (nil  t    t    t)
             (nil  t    nil  t)
             (nil  nil  t    t)
             (nil  nil  nil  t))
           (table (lambda (A B C)
                    (truth-equ
                     (truth-and A (truth-or B C))
                     (truth-or (truth-and A B) (truth-and A C)))))))
  )

;; Local Variables:
;; compile-command: "cask exec ert-runner 48.el"
;; End:

;;; 48.el ends here
