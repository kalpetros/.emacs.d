;;; kal-appearance.el --- Interface configuration & theming

;; Package-Requires:

;;; Commentary:

;; This package configures various
;; interface and theming aspects

;;; Code:

(scroll-bar-mode -1)
(window-divider-mode -1)
(tool-bar-mode -1)
(menu-bar-mode 1)
(setq inhibit-splash-screen t
      initial-scratch-message nil)
;; (setq default-directory "/media/kalpetros/56a7ad87-37f3-4d25-8668-c324b874001f/")

;; Theme
(load-theme 'night-owl t)

;; Highlight line
(global-hl-line-mode 1)
(set-face-background 'hl-line "#072845")

;; Highlight indentation lines
;;(highlight-indent-guides-mode 1)
;; (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
;; (setq highlight-indent-guides-method 'character)

;; Font
;; (set-frame-font "Monaco 11" nil t)

(provide 'kal-appearance)

;; Neotree
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;;; kal-appearance.el ends here
