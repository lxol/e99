;;; 49.el --- Problem 49 of 99 -*- lexical-binding: t -*-

;; Copyright (C) 2015 Sam Halliday
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;;  Gray code.
;;
;;  With physical, mechanical switches, it is very unlikely that
;;  switches will change states exactly in synchrony. In the
;;  transition between states 011 and 100 (decimal 3 to 4), all three
;;  switches change state. In the brief period while all are changing,
;;  the switches will read some spurious position. Gray codes were
;;  introduced to workaround the mechanical limitation and ensure that
;;  only one switch changes at a time when incrementing.
;;
;;  The binary-reflected Gray code list for n bits can be generated
;;  recursively from the list for n − 1 bits by reflecting the list
;;  (i.e. listing the entries in reverse order), concatenating the
;;  original list with the reversed list, prefixing the entries in the
;;  original list with a binary 0, and then prefixing the entries in
;;  the reflected list with a binary 1.
;;
;;  n = 1: C(1) = ['0','1']
;;  n = 2: C(2) = ['00','01','11','10']
;;  n = 3: C(3) = ['000','001','011','010','110','111','101','100']
;;
;;  Write a function that returns a list of the Gray codes for N.
;;
;;  Can you apply the method of "result caching" in order to make the
;;  function more efficient, when it is to be used repeatedly?
;;
;;; Code:

(require 'e99utils)

(defun graycode (n)
  "The Gray codes for N bits in `string' form."
  (cond ((< n 1)  (error "%s < 1" n))
        ((eq n 1) '("0" "1"))
        (t        (let ((previous (graycode (1- n))))
                    (append
                     (mapcar (lambda (e) (concat "0" e)) previous)
                     (mapcar (lambda (e) (concat "1" e)) (reverse previous)))))))

(defvar result-caching-lookup
  (make-hash-table :test 'equal :weakness 'key-and-value)
  "A Hash Table from a function and its args to the result.")

(defun result-caching-advice (original &rest args)
  "Advice around ORIGINAL to re-use a cached result for ARGS."
  (let* ((key (list original args))
         (cached (gethash key result-caching-lookup)))
    (if cached
        cached
      (let ((res (apply original args)))
        (puthash key res result-caching-lookup)
        res))))

(advice-add 'graycode :around #'result-caching-advice)
;;(advice-remove 'graycode #'result-caching-advice)

(ert-deftest Q49 ()
  (should-error (graycode 0))
  (should (equal '("0" "1") (graycode 1)))
  (should (equal '("00" "01" "11" "10") (graycode 2)))
  (should (equal '("000" "001" "011" "010" "110" "111" "101" "100") (graycode 3)))

  ;; cached results have eq res, not just equal
  (should (eq (graycode 3) (graycode 3)))
  )

;; Local Variables:
;; compile-command: "cask exec ert-runner 49.el"
;; End:

;;; 49.el ends here
