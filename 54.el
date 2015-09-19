;;; 54.el --- Problem 54 of 99 -*- lexical-binding: t -*-

;; Copyright (C) 2015 Sam Halliday
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;;  Check whether a given term represents a binary tree.
;;
;;  Write a predicate istree which returns true if and only if its
;;  argument is a list representing a binary tree.
;;
;;    (istree (a (b nil nil) nil))
;;    t
;;
;;    (istree (a (b nil nil)))
;;    nil
;;
;;
;;  A binary tree is either empty or it is composed of a root element
;;  and two successors, which are binary trees themselves.
;;
;;  In Lisp we represent the empty tree by 'nil' and the non-empty
;;  tree by the list (X L R), where X denotes the root node and L and
;;  R denote the left and right subtree, respectively. The example
;;  tree depicted opposite is therefore represented by the following
;;  list:
;;
;;    (a (b (d nil nil) (e nil nil)) (c nil (f (g nil nil) nil)))
;;
;;  Other examples are a binary tree that consists of a root node
;;  only:
;;
;;    (a nil nil) or an empty binary tree: nil.
;;
;;; Code:

(defun istree (arg)
  "Nil if ARG is not a binary tree."
  arg
  )

(ert-deftest Q54 ()

  (should (istree (a (b nil nil) nil)))

  (should-not (istree (a (b nil nil))))

  )

;; Local Variables:
;; compile-command: "cask exec ert-runner 54.el"
;; End:

;;; 54.el ends here
