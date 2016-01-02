;;; 55.el --- Problem 55 of 99 -*- lexical-binding: t -*-

;; Copyright (C) 2016 Sam Halliday
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;;  Construct completely balanced binary trees
;;
;;  In a completely balanced binary tree, the following property holds
;;  for every node: The number of nodes in its left subtree and the
;;  number of nodes in its right subtree are almost equal, which means
;;  their difference is not greater than one.
;;
;;  Write a function cbal-tree to construct completely balanced binary
;;  trees for a given number of nodes. The predicate should generate
;;  all solutions via backtracking. Put the symbol 'x as information
;;  into all nodes of the tree.
;;
;;  (cbal-tree 4)
;;
;;    (x (x nil nil) (x nil (x nil nil)))
;;    (x (x nil nil) (x (x nil nil) nil))
;;    ...
;;
;;; Code:

(require 'ert)

(defun cbal-tree (count)
  "Constructs all balanced trees for COUNT nodes.
All nodes contain the symbol `x'."
  (let (solns)
    (if (= 0 count)
        (list solns)
      (let ((lights (cbal-tree (/ (1- count) 2)))
            (heavys (cbal-tree (/ count 2))))
        (dolist (light lights (delete-dups solns))
          (dolist (heavy heavys)
            (push `(x ,light ,heavy) solns)
            (when (not (eq light heavy)) ;; guaranteed dupe
              (push `(x ,heavy ,light) solns))))))))

(ert-deftest Q55 ()
  (should (equal (cbal-tree 0)
                 '(nil)))

  (should (equal (cbal-tree 1)
                 '((x nil nil))))

  (should (equal (cbal-tree 2)
                 '((x (x nil nil) nil)
                   (x nil (x nil nil)))))

  (should (equal (cbal-tree 3)
                 '((x (x nil nil) (x nil nil)))))

  (should (equal (cbal-tree 4)
                 '((x (x nil (x nil nil)) (x nil nil))
                   (x (x nil nil) (x nil (x nil nil)))
                   (x (x (x nil nil) nil) (x nil nil))
                   (x (x nil nil) (x (x nil nil) nil))))))

;; Local Variables:
;; compile-command: "cask exec ert-runner 55.el"
;; End:

;;; 55.el ends here
