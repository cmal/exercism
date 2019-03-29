;;; word-count.el --- word-count Exercise (exercism)

;;; Commentary:

;;; Code:


(require 'seq)

(defun word-count (s)
  (let ((alist))
    (dolist (item (remove "" (split-string (downcase s) "\\W")))
      (let ((freq (assoc item alist)))
        (if freq
            (setcdr freq (1+ (cdr freq)))
          (add-to-list 'alist (cons item 1)))))
    alist))

;; (word-count "car : carpet as as as java : javascript!!&@$%^&")


(provide 'word-count)
;;; word-count.el ends here
