;;; 36.el --- Problem 36 of 99

;; Copyright (C) 2015 Sam Halliday
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;;  Determine the prime factors of a given positive integer (2).
;;
;;  Construct a list containing the prime factors and their multiplicity.
;;
;;    (prime-factors-mult 315)
;;    ((3 2) (5 1) (7 1))
;;
;;  Hint: The problem is similar to problem 13.
;;
;;; Code:

(require 'e99q10 "10")
(require 'e99q35 "35")

(defun prime-factors-mult (integer)
  "List containing the prime factors and multiplicity of INTEGER."
  (mapcar
   (lambda (e) (pcase e (`(,count ,factor) (list factor count))))
   (encode (prime-factors integer))))


(ert-deftest Q36 ()

  (should (equal '((3 2) (5 1) (7 1))
                 (prime-factors-mult 315)))

  )

;; Local Variables:
;; compile-command: "cask exec ert-runner 36.el"
;; End:

;;; 36.el ends here
