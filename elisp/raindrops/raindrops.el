;;; raindrops.el --- Raindrops (exercism)

;;; Commentary:

;;; Code:

(require 'cl)



(defun convert (n)
  "Convert integer N to its raindrops string."
  (let ((lst)
        (div3 (= 0 (% n 3)))
        (div5 (= 0 (% n 5)))
        (div7 (= 0 (% n 7))))
    (when div3
      (add-to-list 'lst "Pling" t))
    (when div5
      (add-to-list 'lst "Plang" t))
    (when div7
      (add-to-list 'lst "Plong" t))
    (when (and (not div3) (not div5) (not div7))
      (add-to-list 'lst (format "%d" n)))
    (mapconcat 'identity lst "")))



(provide 'raindrops)
;;; raindrops.el ends here
