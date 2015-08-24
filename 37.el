;;; 37.el --- Problem 37 of 99 -*- lexical-binding: t; -*-

;; Copyright (C) 2015 Sam Halliday
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;;  Calculate Euler's totient function phi(m) (improved).
;;
;;  See problem P34 for the definition of Euler's totient function. If
;;  the list of the prime factors of a number m is known in the form
;;  of problem P36 then the function phi(m) can be efficiently
;;  calculated as follows: Let ((p1 m1) (p2 m2) (p3 m3) ...) be the
;;  list of prime factors (and their multiplicities) of a given number
;;  m. Then phi(m) can be calculated with the following formula:
;;
;;    phi(m) =    (p1 - 1) * (p1 ** (m1 - 1))
;;              * (p2 - 1) * (p2 ** (m2 - 1))
;;              * (p3 - 1) * (p3 ** (m3 - 1)) + ...
;;
;;  Note that a ** b stands for the b'th power of a.
;;
;;; Code:

(require 'e99q36 "36")

(defun totient-improved (n)
  "Number of positive integers `[1, N)' that are coprime to N."
  (let ((phi 1)
        (factors (prime-factors-mult n)))
    (dolist (factor factors phi)
      (pcase factor
        (`(,p ,m) (setq phi (* phi (* (1- p) (expt p (1- m))))))))))

(ert-deftest Q37 ()

  (should (equal 4 (totient-improved 10)))

  )

(provide 'e99q37)

;; Local Variables:
;; compile-command: "cask exec ert-runner 37.el"
;; End:

;;; 37.el ends here
