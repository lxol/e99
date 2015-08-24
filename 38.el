;;; 38.el --- Problem 38 of 99 -*- lexical-binding: t -*-

;; Copyright (C) 2015 Sam Halliday
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;;  Use the solutions of problems P34 and P37 to compare the
;;  algorithms. Take the number of logical inferences as a measure for
;;  efficiency. Try to calculate phi(10090) as an example.
;;
;;; Code:

(require 'e99q34 "34")
(require 'e99q37 "37")

(ert-deftest Q38 ()

  (let (q34 q37)
    (setq q34 (benchmark-run-compiled 5 (totient-phi 10090)))
    (setq q37 (benchmark-run-compiled 5 (totient-improved 10090)))
    ;; my 34 is quite a lot faster than 37
    (should (<= (car q34) (car q37))))

)

;; Local Variables:
;; compile-command: "cask exec ert-runner 38.el"
;; End:

;;; 38.el ends here
