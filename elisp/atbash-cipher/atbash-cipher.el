;;; atbash-cipher.el --- Atbash-Cipher (exercism)

;;; Commentary:




;;; Code:

(require 'seq)

(defun encode (plaintext)
  "Encode PLAINTEXT to atbash-cipher encoding."
  (mapconcat
   'identity
   (mapcar
    (lambda (lst) (mapconcat 'string lst ""))
    (seq-partition
     (mapcar (lambda (x)
               (if (and (>= x ?0)
                        (<= x ?9))
                   x
                 (+ ?a (- 26 (- x ?`)))))
             (seq-filter (lambda (x) (or (and (>= x ?0)
                                              (<= x ?9))
                                         (and (>= x ?A)
                                              (<= x ?z))))
                         (downcase plaintext)))
     5))
   " "))


(provide 'atbash-cipher)
;;; atbash-cipher.el ends here
