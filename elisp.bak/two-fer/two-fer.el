;;; hello-world.el --- Hello World Exercise (exercism)

;;; Commentary:

;;; Code:

(defun two-fer (&optional name)
  (let ((name (or name "you")))
   (format "One for %s, one for me." name)))

(provide 'hello-world)
;;; hello-world.el ends here
