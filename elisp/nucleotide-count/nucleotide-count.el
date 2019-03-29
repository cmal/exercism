;;; nucleotide-count.el --- nucleotide-count Exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun nucleotide-count (dna)
  "DNA should be a string containing just one of AGCT."
  (let ((result (copy-alist '((?A . 0) (?C . 0) (?G . 0) (?T . 0)))))
    (dotimes (index (length dna))
      (let ((pair (assq (elt dna index) result)))
        (if pair
            (setcdr pair (1+ (cdr pair)))
          (throw nil "not valid nucleotide"))))
    result))

(provide 'nucleotide-count)
;;; nucleotide-count.el ends here
