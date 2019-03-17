;;; kal-modeline.el --- Modeline configuration

(require 'all-the-icons)

(setq battery-mode-line-format "%b %p")
;; (setq battery-load-critical 7)
;; (setq battery-load-low 25)
(display-battery-mode t)

;; Battery
(setq battery-icon (cond ((= 100 (string-to-number battery-mode-line-string)) (all-the-icons-faicon "battery-full"))
			 ((< 50 (string-to-number battery-mode-line-string)) (all-the-icons-faicon "battery-three-quarters"))
			 ((= 50 (string-to-number battery-mode-line-string)) (all-the-icons-faicon "battery-half"))
			 ((and (> 50 (string-to-number battery-mode-line-string)) (< 10 (string-to-number battery-mode-line-string))) (all-the-icons-faicon "battery-quarter"))
			 ((>= 10 (string-to-number battery-mode-line-string)) (all-the-icons-faicon "battery-empty"))))
(setq battery-percentage (concat " " battery-icon battery-mode-line-string "%% "))

;; Read-only, Edited
(setq ro-icon (concat " " (all-the-icons-material "lock") " "))
(setq edited-icon (concat " " (all-the-icons-material "edit") " "))

;; Flycheck errors
(setq flck-errors (all-the-icons-octicon "bug"))

;; Helper functions
(defun get-file-name (file)
  "Return a FILE name with its format icon."
  (setq file-icon (all-the-icons-icon-for-buffer))
  (setq output (concat " " file-icon " " file)))

(defun get-vc-branch (vc branch)
  "Return a formatted VC BRANCH name with a branch icon."
  (setq vc-icon (all-the-icons-octicon "git-branch"))
  (setq branch (replace-regexp-in-string vc "" branch))
  (setq output (concat " " vc-icon branch " ")))

(defun flycheck-status (state)
  "Return flycheck information for the given STATE"
  (setq icon (cond ((string= "error" state) "error")
  		   ((string= "warning" state) "report_problem")
  		   ((string= "info" state) "info")))
  (setq counts (flycheck-count-errors flycheck-current-errors))
  (setq haserror (flycheck-has-current-errors-p state))
  (setq error (or (cdr (assq state counts)) 0))
  (setq output (concat " " (all-the-icons-material icon) " " (format "%s" error) " "))
  (when haserror output))

(setq-default
 mode-line-format
 '(
   ;; Battery percentage
   (:eval
    (cond ((>= 10 (string-to-number battery-mode-line-string)) (propertize battery-percentage 'face 'mode-line-battery-warning-face))
	  (t (propertize battery-percentage 'face 'mode-line-battery-face))))
   ;; Filename
   (:propertize (:eval (get-file-name "%b")) face mode-line-filename-face)
   ;; Mode
   (:propertize " %m " face mode-line-mode-face)
   ;; VC Branch
   (:propertize (:eval (get-vc-branch (format "%s:" (vc-backend buffer-file-name)) vc-mode)) face mode-line-vc-branch-face)
   ;; Read-only or modified status
   (:eval
    (cond (buffer-read-only
           (propertize ro-icon 'face 'mode-line-read-only-face))
          ((buffer-modified-p)
           (propertize edited-icon 'face 'mode-line-modified-face))
          (t "")))
   ;; Flycheck errors
   (:propertize (:eval (flycheck-status 'error)) face mode-line-flycheck-error-face)
   (:propertize (:eval (flycheck-status 'warning)) face mode-line-flycheck-warning-face)
   (:propertize (:eval (flycheck-status 'info)) face mode-line-flycheck-info-face)
   ;; Document scroll percentage
   (:propertize " %p " face mode-line-percentage-face)
   ;; Line number
   (:propertize " Ln %l " face mode-line-position-face)
   ;; Column number - warning if above 80
   (:eval (propertize " Cl %c " 'face
		      (if (>= (current-column) 80)
		      	  'mode-line-warning-face
		      	'mode-line-position-face)))
   ;; File size
   (:propertize " %I " face mode-line-size-face)))

(make-face 'mode-line-battery-face)
(make-face 'mode-line-battery-warning-face)

(make-face 'mode-line-filename-face)
(make-face 'mode-line-mode-face)

(make-face 'mode-line-vc-branch-face)
(make-face 'mode-line-read-only-face)
(make-face 'mode-line-modified-face)

(make-face 'mode-line-flycheck-error-face)
(make-face 'mode-line-flycheck-warning-face)
(make-face 'mode-line-flycheck-info-face)

(make-face 'mode-line-percentage-face)
(make-face 'mode-line-position-face)
(make-face 'mode-line-size-face)

(make-face 'mode-line-warning-face)

(set-face-attribute 'mode-line-inactive nil
		    :foreground "#ffffff"
		    :background "#000000"
		    :box '(:line-width 8 :color "#000000" :style nil))
(set-face-attribute 'mode-line nil
		    :foreground "#ffffff"
		    :background "#000000"
		    :inverse-video nil
		    :box '(:line-width 8 :color "#000000" :style nil))
(set-face-attribute 'mode-line-battery-face nil
		    :inherit 'mode-line-face
		    :foreground "#ffffff"
		    :background "#000000"
		    :box '(:line-width 8 :color "#000000" :style nil))
(set-face-attribute 'mode-line-battery-warning-face nil
		    :inherit 'mode-line-face
		    :foreground "#ffffff"
		    :background "#ef5350"
		    :box '(:line-width 8 :color "#ef5350" :style nil))
(set-face-attribute 'mode-line-filename-face nil
		    :inherit 'mode-line-face
		    :foreground "#ffcc80"
		    :background "#000000"
		    :box '(:line-width 8 :color "#000000"))
(set-face-attribute 'mode-line-mode-face nil
		    :inherit 'mode-line-fasce
		    :foreground "#ffffff"
		    :background "#000000"
		    :box '(:line-width 8 :color "#000000"))
(set-face-attribute 'mode-line-vc-branch-face nil
		    :inherit 'mode-line-face
		    :foreground "#ffffff"
		    :background "#000000"
		    :box '(:line-width 8 :color "#000000"))
(set-face-attribute 'mode-line-read-only-face nil
		    :inherit 'mode-line-face
		    :foreground "#ffffff"
		    :background "#00897b"
		    :box '(:line-width 8 :color "#00897b"))
(set-face-attribute 'mode-line-modified-face nil
		    :inherit 'mode-line-sface
		    :foreground "#ffffff"
		    :background "#000000"
		    :box '(:line-width 8 :color "#000000"))
(set-face-attribute 'mode-line-size-face nil
		    :inherit 'mode-line-face
		    :foreground "#ffffff"
		    :background "#000000"
		    :box '(:line-width 8 :color "#000000"))
(set-face-attribute 'mode-line-flycheck-error-face nil
		    :inherit 'mode-line-face
		    :foreground "#ffffff"
		    :background "#ef5350"
		    :box '(:line-width 8 :color "#ef5350"))
(set-face-attribute 'mode-line-flycheck-warning-face nil
		    :inherit 'mode-line-face
		    :foreground "#ffffff"
		    :background "#fb8c00"
		    :box '(:line-width 8 :color "#fb8c00"))
(set-face-attribute 'mode-line-flycheck-info-face nil
		    :inherit 'mode-line-face
		    :foreground "#ffffff"
		    :background "#42a5f5"
		    :box '(:line-width 8 :color "#42a5f5"))
(set-face-attribute 'mode-line-percentage-face nil
		    :inherit 'mode-line-face
		    :foreground "#ffffff"
		    :background "#212121"
		    :box '(:line-width 8 :color "#212121"))
(set-face-attribute 'mode-line-position-face nil
		    :inherit 'mode-line-face
		    :foreground "#ffffff"
		    :background "#212121"
		    :box '(:line-width 8 :color "#212121"))
(set-face-attribute 'mode-line-warning-face nil
		    :inherit 'mode-line-position-face
		    :foreground "#ffffff"
		    :background "#fb8c00"
		    :box '(:line-width 8 :color "#fb8c00"))

(provide 'kal-modeline)
