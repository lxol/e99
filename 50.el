;;; 50.el --- Problem 50 of 99 -*- lexical-binding: t -*-

;; Copyright (C) 2015 Sam Halliday
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;;  Huffman code.
;;
;;  First of all, consult a good book on discrete mathematics or algorithms
;;  for a detailed description of Huffman codes!
;;
;;  We suppose a set of symbols with their frequencies, given as a list of
;;  terms. Example:
;;
;;   ((a 45) (b 13) (c 12) (d 16) (e 9) (f 5))
;;
;;  Our objective is to construct a list of terms where the second
;;  element is the Huffman code word for the symbol. In our example,
;;  the result could be
;;
;;   ((a "0") (b "101") (c "100") (d "111") (e "1101") (f "1100"))
;;
;;; Code:

(defun huffman (freqs)
  "Huffman table `((sym code) ...)' for FREQS `((sym count) ...)'."
  (let ((sorted (sort freqs (lambda (a b) (> (cadr a) (cadr b))))))
    sorted
    )
  )

(ert-deftest Q50 ()
  (should (equal '((a "0") (b "101") (c "100") (d "111") (e "1101") (f "1100"))
                 (huffman '((a 45) (b 13) (c 12) (d 16) (e 9) (f 5)))))
  )

;; Local Variables:
;; compile-command: "cask exec ert-runner 50.el"
;; End:

;;; 50.el ends here
