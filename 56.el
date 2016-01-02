;;; 56.el --- Problem 56 of 99 -*- lexical-binding: t -*-

;; Copyright (C) 2016 Sam Halliday
;; License: http://www.gnu.org/licenses/gpl.html

;;; Commentary:
;;
;;  Symmetric binary trees
;;
;;  Let us call a binary tree symmetric if you can draw a vertical
;;  line through the root node and then the right subtree is the
;;  mirror image of the left subtree. Write a predicate symmetric/1 to
;;  check whether a given binary tree is symmetric.
;;
;;  Hint: Write a predicate mirror/2 first to check whether one tree
;;  is the mirror image of another. We are only interested in the
;;  structure, not in the contents of the nodes.
;;
;;; Code:

(require 'ert)

(defun symmetric/1 (tree)
  "T if TREE is symmetric."
  )

(defun mirror/2 (left right)
  "T if LEFT is a mirror tree of RIGHT."
  )

(ert-deftest Q56 ()
  (should nil)
  )

;; Local Variables:
;; compile-command: "cask exec ert-runner 56.el"
;; End:

;;; 56.el ends here
