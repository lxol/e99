;;; 12.el --- Problem 12 of 99
;;; Commentary:
;;
;;  Decode a run-length encoded list.
;;  Given a run-length code list generated as specified in problem P11.
;;  Construct its uncompressed version.
;;
;;; Code:

(require 'e99utils)

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

  (should (equal nil (decode-modified nil)))
  (should (equal (make-list 10 'a) (decode-modified '((10 a)))))
  (should (equal (make-list 10 'nil) (decode-modified '((10 nil)))))

  (should (equal (make-list overflow-depth 'a)
                 (decode-modified `((,overflow-depth a)))))
  )

;;; 12.el ends here
