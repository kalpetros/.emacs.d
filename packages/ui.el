;;; ui --- Interface configuration & theming

;; Package-Requires:

;;; Commentary:

;; This package configures all
;; interface and theming aspects

;;; Code:

(setq inhibit-startup-message t)    ;; Hide the startup message
(global-linum-mode 1)               ;; Enable line numbers globally
(load-theme 'timu-rouge t)          ;; Load timu-rouge theme
(scroll-bar-mode -1)                ;; Disable scrollbar
(window-divider-mode -1)            ;; Disable window divider
(tool-bar-mode -1)                  ;; Disable toolbar
(menu-bar-mode 1)                   ;; Enable menubar
(global-hl-line-mode 1)             ;; Enable line highlighting
(show-paren-mode 1)                 ;; Show matching parentheses
(global-auto-revert-mode 1)         ;; Automatically revert buffers on new changes
(doom-modeline-mode 1)              ;; Needs nerd-icons to display icons, then run nerd-icons-install-fonts

(provide 'ui)

;;; ui.el ends here

