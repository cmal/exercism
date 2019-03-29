;;; run-length-encoding.el --- run-length-encoding Exercise (exercism)

;;; Commentary:

;;; Code:


(defun run-length-encode (s)
  (let ((current)
        (counter 0)
        (res ""))
    (dolist (char (append s nil))
      (if (and current (= char current))
          (progn
            (setq current char)
            (setq counter (1+ counter)))
        (progn
          (setq res
                (concat res (pcase counter
                              (0 "")
                              (1 (format "%c" current))
                              (_ (format "%d%c" counter current)))))
          (setq current char)
          (setq counter 1))))
    (concat res (pcase counter
                  (0 "")
                  (1 (format "%c" current))
                  (_ (format "%d%c" counter current))))))

(defun remove-blank (s)
  (apply 'string (remove ?\ (append s nil))))

(defun run-length-decode (s)
  (let* ((res ""))
    (while (not (equal s ""))
      (string-match "\\([0-9]*\\)\\([ A-z]\\)" s)
      (when (equal "" (match-string 1 s))
        (setq res (concat res (match-string 2 s))))
      (dotimes (n (string-to-number (match-string 1 s)))
        (setq res (concat res (match-string 2 s))))
      (setq s (substring s (match-end 2))))
    res))




(provide 'run-length-encoding)
;;; run-length-encoding.el ends here
