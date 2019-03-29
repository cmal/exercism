;;; phone-number.el --- phone-number Exercise (exercism)

;;; Commentary:

;;; Code:

(require 'seq)

(defun clean-number (s)
  (seq-filter (lambda (char)
                (and (>= char ?0)
                     (<= char ?9)))
              (append s nil)))

(defun numbers (s)
  (let ((s (clean-number s)))
    (cond
     ((= 10 (length s)) (apply 'string s))
     ((and (= 11 (length s))
           (= ?1 (car s))) (apply 'string (cdr s)))
     (t "0000000000"))))

(defun pprint (s)
  (let ((s (numbers s)))
    (concat "(" (area-code s) ") " (mid-code s) "-" (end-code s))))

(defun area-code (s)
  (substring (numbers s) 0 3))

(defun mid-code (s)
  (substring (numbers s) 3 6))

(defun end-code (s)
  (substring (numbers s) 6))

(provide 'phone-number)
;;; phone-number.el ends here
