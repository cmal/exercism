;;; bob.el --- Bob exercise (exercism)

;;; Commentary:

;;; Code:

(defun response-for (sentence)
  (let ((case-fold-search nil)
        (sentence (replace-regexp-in-string "\n" "" sentence)))
    (cond
     ((string-match-p "^[ \t\n\r]*$" sentence) "Fine. Be that way!")
     ((string-match-p "^\\([ A-Z,]\\|\n\\)*\\?$" sentence) "Calm down, I know what I'm doing!")
     ((string-match-p "\\?[ \t\n\r]*$" sentence) "Sure.")
     ((string-match-p "^\\([ 0-9A-Z,!%@#\\*\\$\\^\\(]\\|\n\\)*!$" sentence)  "Whoa, chill out!")
     ((string-match-p "^\\([ A-Z,]\\|\n\\)*!?$" sentence)  "Whoa, chill out!")
     (t "Whatever."))))

(provide 'bob)
;;; bob.el ends here
