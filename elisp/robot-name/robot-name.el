;;; robot-name.el --- Robot Name (exercism)

;;; Commentary:
;;
;; Build a robot with a name like AA000, that can be reset
;; to a new name. Instructions are in README.md
;;

;;; Code:

(defun random-name ()
  (string (+ ?A (random 26))
          (+ ?A (random 26))
          (+ ?0 (random 10))
          (+ ?0 (random 10))
          (+ ?0 (random 10))))

(defun build-robot ()
  (let ((alist))
    (add-to-list 'alist (cons "name" (random-name)))))

(defun robot-name (robot)
  (cdr (assoc "name" robot)))

(defun reset-robot (robot)
  (let ((name (assoc "name" robot)))
   (setcdr name (random-name))))


(provide 'robot-name)
;;; robot-name.el ends here
