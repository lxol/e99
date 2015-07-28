;;; 12.el --- Problem 12 of 99
;;; Commentary:
;;
;;  Decode a run-length encoded list.
;;  Given a run-length code list generated as specified in problem P11.
;;  Construct its uncompressed version.
;;
;;; Code:

(defun decode-modified (encoded)
  "Decode ENCODED back to the input of `encode-modified'."
  (apply 'append ;; poor man's -flatten
         (mapcar (lambda (e) (pcase e
                          (`(,count ,el) (make-list count el))
                          (el            (list el))))
                 encoded)))

(ert-deftest Q12 ()
  (should (equal '(a a a a b c c a a d e e e e)
                 (decode-modified '((4 a) b (2 c) (2 a) d (4 e)))))

  ;; TODO: roundtrip tests of random lists
  )

;;; 12.el ends here
