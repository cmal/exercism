;;; hamming.el --- Hamming (exercism)

;;; Commentary:

;;; Code:


(defun hamming-distance (s1 s2)
  (if (not (= (length s1) (length s2)))
      (throw nil "Not same length")
    (let ((distance 0)
          (len (length s1)))
      (dotimes (index len distance)
        (when (not (= (elt s1 index) (elt s2 index)))
         (setq distance (1+ distance)))))))


(provide 'hamming)
;;; hamming.el ends here
