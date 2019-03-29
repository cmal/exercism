;;; allergies.el --- Allergies Exercise (exercism)

;;; Commentary:

;;; Code:

(setq allergies '(("eggs" . 1)
                  ("peanuts" . 2)
                  ("shellfish" . 4)
                  ("strawberries" . 8)
                  ("tomatoes" . 16)
                  ("chocolate" . 32)
                  ("pollen" . 64)
                  ("cats" . 128)))


(defun allergen-list-recur (score lst)
  (cond
   ((>= score 128)
    (progn (add-to-list 'lst "cats") (allergen-list-recur (- score 128) lst)))
   
   ((>= score 64)
    (progn (add-to-list 'lst "pollen") (allergen-list-recur (- score 64) lst)))
   
   ((>= score 32)
    (progn (add-to-list 'lst "chocolate") (allergen-list-recur (- score 32) lst)))
   
   ((>= score 16)
    (progn (add-to-list 'lst "tomatoes") (allergen-list-recur (- score 16) lst)))
   
   ((>= score 8)
    (progn (add-to-list 'lst "strawberries") (allergen-list-recur (- score 8) lst)))
   
   ((>= score 4)
    (progn (add-to-list 'lst "shellfish") (allergen-list-recur (- score 4) lst)))
   
   ((>= score 2)
    (progn (add-to-list 'lst "peanuts") (allergen-list-recur (- score 2) lst)))
   
   ((>= score 1)
    (progn (add-to-list 'lst "eggs") (allergen-list-recur (- score 1) lst)))
   
   (t lst)))

(defun allergen-list (score)
  (allergen-list-recur score nil))

(defun allergic-to-p (score item)
  (if (equal item "cats")
      (>= score 128)
    (let* ((val (cdr (assoc item allergies)))
          (upper-val (* 2 val)))
      (when (>= score upper-val)
        (setq score (- score (* 2 val))))
      (>= score val))))


(provide 'allergies)
;;; allergies.el ends here
