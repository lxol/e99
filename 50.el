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

(require 'e99utils)

(defun huffman-tree (freqs)
  "Huffman tree for FREQS `((sym count) ...)'.

Nodes can be either:

* leaf `(sym count)'
* internal `(left right count)' (i.e. count is cached)

where left and right are nodes.  The Huffman tree is a node."
  (let ((q1 (sort freqs (lambda (a b) (< (cadr a) (cadr b)))))
        (q2))
    (cl-flet* ((weight (node) (pcase node
                                (`(,_ ,count)    count)
                                (`(,_ ,_ ,count) count)))
               (nlowest () (cond
                            ((null q1) (pop q2))
                            ((null q2) (pop q1))
                            (t         (let ((left  (weight (car q1)))
                                             (right (weight (car q2))))
                                         (if (and (not (null q1))
                                                  (<= left right))
                                             (pop q1)
                                           (pop q2)))))))
      (while (or (not (null q1))
                 (not (null (cdr q2))))
        (let ((left (nlowest))
              (right (nlowest)))
          (cond
           ((null right) (setq q2 (add-to-end q2 left)))
           (t            (let ((combined (+ (weight left) (weight right))))
                           (setq q2 (add-to-end q2 (list left right combined))))))))
      (car q2))))

(defun huffman-table (tree &optional prefix)
  "Huffman table `((sym code) ...)' for a `huffman-tree' TREE.
PREFIX is added to the beginning of all codes."
  (pcase tree
    (`(,sym ,_)
     (list (list sym (or prefix ""))))
    (`(,left ,right ,_)
     (append (huffman-table left (concat prefix "0"))
             (huffman-table right (concat prefix "1"))))))

(defun huffman (freqs)
  "Huffman table `((sym code) ...)' for FREQS `((sym count) ...)'."
  ;; TODO sort the output by input order
  (huffman-table (huffman-tree freqs)))

(ert-deftest Q50 ()
  (should (equal '(f 5)
                 (huffman-tree '((f 5)))))

  (should (equal '((f 5) (e 9) 14)
                 (huffman-tree '((e 9) (f 5)))))

  (should (equal '((a 45) (((c 12) (b 13) 25) (((f 5) (e 9) 14) (d 16) 30) 55) 100)
                 (huffman-tree '((a 45) (b 13) (c 12) (d 16) (e 9) (f 5)))))


  (should (equal '((e ""))
                 (huffman-table '(e 9))))

  (should (equal '((f "0") (e "1"))
                 (huffman-table '((f 5) (e 9) 14))))

  (should (equal '((f "00") (e "01") (c "1"))
                 (huffman-table '(((f 5) (e 9) 14) (c 12) 26))))

  (should (equal '((a "0") (c "100") (b "101") (f "1100") (e "1101") (d "111"))
                 (huffman-table '((a 45) (((c 12) (b 13) 25) (((f 5) (e 9) 14) (d 16) 30) 55) 100))))


  (should (equal '((a "0") (b "101") (c "100") (d "111") (e "1101") (f "1100"))
                 (huffman '((a 45) (b 13) (c 12) (d 16) (e 9) (f 5)))))

  )

;; Local Variables:
;; compile-command: "cask exec ert-runner 50.el"
;; End:

;;; 50.el ends here
