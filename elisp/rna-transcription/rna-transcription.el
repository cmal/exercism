;;; rna-transcription.el -- RNA Transcription (exercism)

;;; Commentary:



;;; Code:


(setq trans '((?G . ?C)
              (?C . ?G)
              (?T . ?A)
              (?A . ?U)))

(defun to-rna (dna)
  (mapconcat (lambda (x) (format "%c" (cdr (assoc x trans))))
             dna
             ""))

(provide 'rna-transcription)
;;; rna-transcription.el ends here
