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

(defun truth (x)
  "If X is a function evaluate it, otherwise X."
  (if (functionp x)
      (funcall x)
    x))

(defun truth-and (a b)
  "T iff A and B both have truth."
  (and (truth a) (truth b)))

(defun truth-or (a b)
  "T iff A or B (including both) have truth."
  (or (truth a) (truth b)))

(defun truth-nand (a b)
  "Nil iff A and B both have truth."
  (not (truth-and a b)))

(defun truth-nor (a b)
  "T iff A and B do not have truth."
  (not (truth-or a b)))

(defun truth-xor (a b)
  "T iff A or B (but not both) have truth."
  (setq a (truth a)
        b (truth b))
  (and (not (and a b)) (or a b)))

(defun truth-impl (a b)
  "T iff A implies B."
  (or (not (truth a)) (truth b)))

(defun truth-equiv (a b)
  "T iff A and B have the same truth."
  (eq (truth a) (truth b)))

(defun truth-table/2 (x)
  "Truth table for the two parameter function X."
  (let ((table)
        (all '((nil nil) (nil t) (t nil) (t t))))
    (dolist (el all table)
      (push (append el (list (apply x el))) table))))

(ert-deftest Q46 ()

  (should (truth t))
  (should (not (truth nil)))

  (should (truth (lambda () t)))
  (should (not (truth (lambda () nil))))

  (should (truth-and t t))
  (should (truth-and (lambda () t) t))
  (should (not (truth-and t (lambda () nil))))

  (should (truth-or t t))
  (should (truth-or (lambda () t) nil))
  (should (truth-or t (lambda () nil)))

  (should (truth-nand nil nil))
  (should (truth-nand nil t))
  (should (truth-nand t nil))
  (should (not (truth-nand t t)))

  (should (truth-nor nil nil))
  (should (not (truth-nor nil t)))
  (should (not (truth-nor t nil)))
  (should (not (truth-nor t t)))

  (should (not (truth-xor nil nil)))
  (should (truth-xor nil t))
  (should (truth-xor t nil))
  (should (not (truth-xor t t)))

  (should (truth-impl nil nil))
  (should (truth-impl nil t))
  (should (not (truth-impl t nil)))
  (should (truth-impl t t))

  (should (truth-equiv nil nil))
  (should (not (truth-equiv nil t)))
  (should (not (truth-equiv t nil)))
  (should (truth-equiv t t))

  (should (equal
           '((t   t   t)
             (t   nil t)
             (nil t   nil)
             (nil nil nil))
           (truth-table/2 (lambda (a b)
                            (truth-and a (truth-or a b))))))

  )

(provide 'e99q46)

;; Local Variables:
;; compile-command: "cask exec ert-runner 46.el"
;; End:

;;; 46.el ends here
