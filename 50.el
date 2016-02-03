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

;; Local Variables:
;; compile-command: "cask exec ert-runner 50.el"
;; End:

;;; 50.el ends here
