;;; perfect-numbers.el --- perfect-numbers Exercise (exercism)

;;; Commentary:

;;; Code:

(require 'seq)

(defun is-divisor (n d)
  (= 0 (% n d)))

(defun is-perfect-number (n)
  "Return list of perfect numbers that are less than or equal to N."
  (let ((sq (sqrt n))
        (sum 1))
    (dolist (num (number-sequence 2 sq))
      (when (is-divisor n num)
        (setq sum (+ sum num (/ n num)))))
    (= sum n)))

(defun perfect-numbers (n)
  (seq-filter (lambda (x)
                (is-perfect-number x)) (number-sequence 2 n)))

(provide 'perfect-numbers)
;;; perfect-numbers.el ends here
