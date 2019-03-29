;;; gigasecond.el --- Gigasecond exercise (exercism)

;;; Commentary:
;; Calculate the date one gigasecond (10^9 seconds) from the
;; given date.
;;
;; NB: Pay attention to  Emacs' handling of time zones and dst
;; in the encode-time and decode-time functions.

;;; Code:


(defun from (second minute hour day month year)
  (cl-subseq
   (decode-time
    (time-add
     (encode-time second minute hour day month year t)
     1E9)
    t)
   0 6))

(provide 'gigasecond)
;;; gigasecond.el ends here
