;;; difference-of-squares.el --- Difference of Squares (exercism)

;;; Commentary:

;;; Code:
(mapcar '1+ '(1 2))

(defun sum-of-squares (num)
  (apply '+ (mapcar (lambda (a) (* a a)) (number-sequence 1 num))))

(defun square-of-sums (num)
  ((lambda (a) (* a a))
   (apply '+ (number-sequence 1 num))))

(defun difference (num)
  (- (square-of-sums num)
     (sum-of-squares num)))

(provide 'difference-of-squares)
;;; difference-of-squares.el ends here
