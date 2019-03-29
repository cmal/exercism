;;; armstrong-numbers.el --- armstrong-numbers Exercise (exercism)

;;; Commentary:

;;; Code:


(defun armstrong-p (n)
  (let* ((s (format "%d" n))
        (len (length s))
        (sum 0))
    (dolist (char (append s nil))
      (let ((digit (- char ?0)))
        (setq sum (+ sum (expt digit len)))))
    (= sum n)))

(provide 'armstrong-numbers)
;;; armstrong-numbers.el ends here
