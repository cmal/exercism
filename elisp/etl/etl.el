;;; etl.el --- etl Exercise (exercism)

;;; Commentary:

;;; Code:


(defun etl (input-hash-table)
  (let ((output-hash-table (make-hash-table)))
    (maphash
     (lambda (key lst)
       (when (< key 0)
         (throw nil "neg key"))
       (dolist (s lst)
         (when (not (stringp s))
           (throw nil "not string"))
         (puthash (downcase s) key output-hash-table)))
     input-hash-table)
    output-hash-table))

(provide 'etl)
;;; etl.el ends here
