;;; 13.el --- Problem 13 of 99
;;; Commentary:
;;
;;  Run-length encoding of a list (direct solution).
;;
;;  Implement the so-called run-length encoding data compression
;;  method directly. I.e. don't explicitly create the sublists
;;  containing the duplicates, as in problem P09, but only count them.
;;  As in problem P11, simplify the result list by replacing the
;;  singleton lists (1 X) by X.
;;
;;  (encode-direct '(a a a a b c c a a d e e e e))
;;  ((4 A) B (2 C) (2 A) D (4 E))
;;
;;; Code:

(require 'cl-lib)
(require 'e99utils)

(defun encode-direct (list)
  "Run-length encoding of LIST with negligible memory overhead."
  (when list
    (let (current builder)
      (cl-flet ((updated ()
                         (if (eq 1 (car current))
                             (push (cadr current) builder)
                           (push current builder))
                         builder))
        (dolist (el (reverse list) (updated))
          (pcase current
            ((pred null)
             (setq current `(1 ,el))) ;; annoying first element
            ;; can this be done without guard? i.e. ,last => el
            ((and `(,i ,last) (guard (eq el last)))
             (setf (car current) (1+ i)))
            (`(,i ,last)
             (updated)
             (setq current `(1 ,el)))
            ))))))


(ert-deftest Q13 ()
  (should (equal '((4 a) b (2 c) (2 a) d (4 e))
                 (encode-direct '(a a a a b c c a a d e e e e))))

  (should (equal '(b (2 c) (2 a) d)
                 (encode-direct '(b c c a a d))))

  (should (equal nil (encode-direct nil)))
  (should (equal '((10 a)) (encode-direct (make-list 10 'a))))
  (should (equal '((10 nil)) (encode-direct (make-list 10 'nil))))

  (should (equal `((,overflow-depth a))
                 (encode-direct (make-list overflow-depth 'a))))

  )

;;; 13.el ends here
