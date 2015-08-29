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

(require 'cl-lib)
(require 'e99utils)
(require 'e99q26 "26")
(require 'e99q46 "46")

(defun truth-trial (depth)
  "Generate a list of truth trials with DEPTH parts."
  (if (>= 1 depth)
      '((nil) (t))
    (let (builder)
        (dolist (rem (truth-trial (1- depth)) builder)
          (dolist (e '(nil t) nil)
            (push (append (list e) rem) builder))))))

(defun truth-table (expr)
  "The truth table for the function EXPR of an arbitrary number of parameters."
  (let* ((nargs (length (args expr)))
         (trials (truth-trial nargs))
         (table))
    (dolist (trial trials table)
      (push (append trial (list (apply expr trial))) table))))

(ert-deftest Q48 ()
  (should (equal '((nil) (t)) (truth-trial 1)))
  (should (equal '((t t) (nil t) (t nil) (nil nil)) (truth-trial 2)))
  (should (equal '((t   nil nil)
                   (nil nil nil)
                   (t   t   nil)
                   (nil t   nil)
                   (t   nil t  )
                   (nil nil t  )
                   (t   t   t  )
                   (nil t   t  ))
                 (truth-trial 3)))

  (should (contain-same-elements
           '((t    t    t    t)
             (t    t    nil  t)
             (t    nil  t    t)
             (t    nil  nil  t)
             (nil  t    t    t)
             (nil  t    nil  t)
             (nil  nil  t    t)
             (nil  nil  nil  t))
           (truth-table (lambda (A B C)
                          (truth-equiv
                           (truth-and A (truth-or B C))
                           (truth-or (truth-and A B) (truth-and A C)))))))

  )

;; Local Variables:
;; compile-command: "cask exec ert-runner 48.el"
;; End:

;;; 48.el ends here
