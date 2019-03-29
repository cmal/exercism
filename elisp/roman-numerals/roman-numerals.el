;;; roman-numerals.el --- roman-numerals Exercise (exercism)

;;; Commentary:

;;; Code:

;; within 1 ~ 3999

(require 'seq)

(defun to-roman (n)
  (let ((romans (lambda (num)
                  (pcase num
                    (1    "I")
                    (4    "IV")
                    (5    "V")
                    (9    "IX")
                    (10   "X")
                    (40   "XL")
                    (50   "L")
                    (90   "XC")
                    (100  "C")
                    (400  "CD")
                    (500  "D")
                    (900  "CM")
                    (1000 "M"))))
        (s      '(1 4 5 9 10 40 50 90 100 400 500 900 1000))
        (res ""))
    (while (not (= 0 n))
      (let ((m (apply 'max (seq-filter (lambda (x) (>= n x)) s))))
        (setq n (- n m))
        (setq res (concat res (funcall romans m)))))
    res))

(provide 'roman-numerals)
;;; roman-numerals.el ends here
