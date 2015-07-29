;;; 17.el --- Problem 17 of 99
;;; Commentary:
;;
;;  Split a list into two parts; the length of the first part is
;;  given.
;;
;;  Do not use any predefined predicates.
;;
;;  (split '(a b c d e f g h i k) 3)
;;  ((A B C) (D E F G H I K))
;;
;;; Code:

(defun split (list index)
  "A list containing two lists: LIST up to INDEX and its tail, 1-indexing."
  (let ((front)
        (back list))
    (dotimes (i index (list (reverse front) back))
      (push (car back) front)
      (setq back (cdr back)))))

(ert-deftest Q17 ()
  (should (equal '((a b c) (d e f g h i k))
                 (split '(a b c d e f g h i k) 3)))

  (should (equal '(nil nil)
                 (split nil 0)))
  (should (equal '(nil (a b c))
                 (split '(a b c) 0)))
  (should (equal '((a b c) nil)
                 (split '(a b c) 3)))

  )

;;; 17.el ends here
