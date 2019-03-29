;;; pangram.el --- Pangram (exercism)

;;; Commentary:

;;; Code:

(require 'seq)

(defun is-pangram (sentence)
  (when (> (length sentence) 0)
    (let ((alist))
      (dolist (char (append (downcase "abcdefghijklmnopqrstuvwxyz") nil))
        (add-to-list 'alist (cons char 0)))
      (dolist (char (append (downcase sentence) nil))
        (when (and (>= char ?a) (<= char ?z))
          (let ((pair (assq char alist)))
            (setcdr pair (1+ (cdr pair))))))
     (seq-reduce (lambda (a b)
                   (and a (> (cdr b) 0))) alist t))))

(provide 'pangram)
;;; pangram.el ends here
