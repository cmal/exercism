;;; anagram.el --- Anagram (exercism)

;;; Commentary:

;;; Code:

(require 'seq)

(defun anagrams-for (word lst)
  (let ((init-alist))
    (dolist (char (append (downcase "abcdefghijklmnopqrstuvwxyz") nil))
      (add-to-list 'init-alist (cons char 0)))
    (let ((word-alist (copy-alist init-alist)))
      (dolist (char (append (downcase word) nil))
        (let ((pair (assq char word-alist)))
          (setcdr pair (1+ (cdr pair)))))
      (seq-filter
       (lambda (s)
         (when (not (equal s word))
          (let ((alist (copy-alist init-alist)))
            (dolist (char (append (downcase s) nil))
              (let ((pair (assq char alist)))
                (setcdr pair (1+ (cdr pair)))))
            (equal word-alist alist))))
       lst))))



(provide 'anagram)
;;; anagram.el ends here
