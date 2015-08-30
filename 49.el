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
;;  n = 3: C(3) = ['000','001','011','010',´110´,´111´,´101´,´100´]
;;
;;  Write a function that returns a list of the gray codes for N.
;;
;;  Can you apply the method of "result caching" in order to make the
;;  function more efficient, when it is to be used repeatedly?
;;
;;; Code:



;; Local Variables:
;; compile-command: "cask exec ert-runner 49.el"
;; End:

;;; 49.el ends here
