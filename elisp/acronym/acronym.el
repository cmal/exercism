;;; acronym.el --- Acronym (exercism)

;;; Commentary:

;;; Code:

(require 'cl)

(defun acronym (s)
  (let ((s (remove "" (split-string (upcase s) "\\W"))))
    (apply 'concat (mapcar (lambda (word) (substring word 0 1)) s))))

(provide 'acronym)
;;; acronym.el ends here
