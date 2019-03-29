;;; binary.el --- Binary exercise (exercism)

;;; Commentary:

;;; Code:

(defun to-decimal (bin)
  (condition-case nil
      (read (concat "#b" bin))
    (invalid-read-syntax 0)))

(provide 'binary)
;;; binary.el ends here
