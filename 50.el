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
;;  If the symbols are sorted by probability, there is a linear-time
;;  (O(n)) method to create a Huffman tree using two queues, the first
;;  one containing the initial weights (along with pointers to the
;;  associated leaves), and combined weights (along with pointers to
;;  the trees) being put in the back of the second queue. This assures
;;  that the lowest weight is always kept at the front of one of the
;;  two queues:
;;
;;  1. Start with as many leaves as there are symbols.
;;
;;  2. Enqueue all leaf nodes into the first queue (by probability in
;;     increasing order so that the least likely item is in the head
;;     of the queue).
;;
;;  3. While there is more than one node in the queues:
;;
;;     a) Dequeue the two nodes with the lowest weight by examining
;;        the fronts of both queues.
;;
;;     b) Create a new internal node, with the two just-removed nodes
;;        as children (either node can be either child) and the sum of
;;        their weights as the new weight.
;;
;;     c) Enqueue the new node into the rear of the second queue.
;;
;;  4. The remaining node is the root node of the tree.
;;
;;; Code:

(defun huffman-tree (freqs)
  "Huffman tree for FREQS `((sym count) ...)'.

Nodes can be either:

* leaf `(sym count)'
* internal `(left right count)' (i.e. count is cached)

where left and right are nodes.  The Huffman tree is an internal node."
  (let ((q1 (sort freqs (lambda (a b) (< (cadr a) (cadr b)))))
        (q2))
    (cl-flet* ((weight (node) (pcase node
                                ;; TODO how to match and discard syms?
                                (`(,sym ,count)         count)
                                (`(,left ,right ,count) count)
                                (_                      0)))
               (nlowest () (let ((left  (weight (car q1)))
                                 (right (weight (car q2))))
                             (if (<= left right)
                                 (pop q2)
                               (pop q1)))))
      (while (and (< 1 (length (append q1 q2))))
        (let ((left (nlowest))
              (right (nlowest)))
          ;; TODO function to push-to-end
          (setq q2 (append q2
                           `((,left ,right ,(+ (weight left) (weight right))))))))
      q2)))

(defun huffman-table (tree)
  "Huffman table `((sym code) ...)' for a `huffman-tree' TREE."
  (pcase node
    (`(,sym ,count)  prefix)
    (`(,left ,right) (concat (prefix "0" (encode left))
                             (prefix "1" (encode right))))))

(defun huffman (freqs)
  "Huffman table `((sym code) ...)' for FREQS `((sym count) ...)'."
  (huffman-table (huffman-tree freqs)))

(ert-deftest Q50 ()
  (should (equal '(((f 5) (e 9) 14))
                 (huffman-tree '((e 9) (f 5)))))

  (should (equal '(((f 5) (e 9) 14))
                 (huffman-tree '((e 9) (f 5)))))

  ;; TODO: check if this is actually correct
  (should (equal '(((((((f 5) (e 9) 14) (c 12) 26) (b 13) 39) (d 16) 55) (a 45) 100))
                 (huffman-tree '((a 45) (b 13) (c 12) (d 16) (e 9) (f 5)))))

  ;; TODO tests around huffman-table

  (should (equal '((a "0") (b "101") (c "100") (d "111") (e "1101") (f "1100"))
                 (huffman '((a 45) (b 13) (c 12) (d 16) (e 9) (f 5)))))
  )

;; Local Variables:
;; compile-command: "cask exec ert-runner 50.el"
;; End:

;;; 50.el ends here
