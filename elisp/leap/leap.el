;;; leap.el --- Leap exercise (exercism)

;;; Commentary:

;;; Code:

(defun leap-year-p (year)
  (cond
   ((= 0 (% year 400)) t)
   ((= 0 (% year 100)) nil)
   ((= 0 (% year 4)) t)))

(provide 'leap)
;;; leap.el ends here
