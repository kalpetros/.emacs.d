;;; navigation.el --- General navigation settings

;; Package-Requires:

;;; Commentary:

;; This package provides all
;; navigation configurations

;;; Code:

(helm-mode 1)                                           ;;
(keymap-global-set "C-x C-f" 'helm-find-files)          ;;
(keymap-global-set "M-x" 'helm-M-x)                     ;;
(keymap-global-set "C-x C-g" 'helm-find)                ;;
(keymap-global-set "C-x b" 'helm-buffers-list)          ;;
(setq helm-mode-fuzzy-match t)                          ;;
(setq helm-completion-in-region-fuzzy-match t)          ;;
(setq helm-candidate-number-limit '100)                 ;;
(keymap-global-set "C-c f" 'helm-do-ag-project-root)    ;;
(keymap-global-set "C-c s" 'helm-do-ag-this-file)       ;;
(setq helm-ag-use-agignore t)                           ;; Silver searcher ignore files from .gitignore
(keymap-global-set "C-S-c C-S-c" 'mc/edit-lines)
(keymap-global-set "C->" 'mc/mark-next-like-this)
(keymap-global-set "C-<" 'mc/mark-previous-like-this)
(keymap-global-set "C-c C-<" 'mc/mark-all-like-this)

(provide 'navigation)

;;; navigation.el ends here

