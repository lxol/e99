;;; 16.el --- Problem 16 of 99
;;; Commentary:
;;
;;  Drop every N'th element from a list.
;;
;;  (drop '(a b c d e f g h i k) 3)
;;  (A B D E G H K)
;;
;;; Code:

(defun drop (list n)
  "Version of LIST with every Nth element removed."
  (let ((builder)
        (i 0))
    (dolist (el list (reverse builder))
      (setq i (mod (1+ i) n))
      (unless (eq 0 i)
        (push el builder)))))

(ert-deftest Q16 ()

  (should (equal '(a b d e g h k)
                 (drop '(a b c d e f g h i k) 3)))

  (should (equal nil
                 (drop nil 0)))

  (should (equal '(a b d e g h)
                 (drop '(a b c d e f g h i) 3)))
  (should (equal '(a b d e g h k m)
                 (drop '(a b c d e f g h i k m) 3)))

  (should (equal nil
                 (drop '(a b c) 1)))

  )

;;; 16.el ends here
