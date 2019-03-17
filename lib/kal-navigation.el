;;; kal-navigation.el --- General navigation settings

(require 'helm)
;; Start with emacs
(helm-mode 1)
(global-set-key (kbd "C-x C-g") 'helm-find)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(setq helm-mode-fuzzy-match t)
(setq helm-completion-in-region-fuzzy-match t)
(setq helm-candidate-number-limit '100)

;; Silver searching
(global-set-key (kbd "C-c C-;") 'helm-do-ag-project-root)
(global-set-key (kbd "C-c C-'") 'helm-do-ag-this-file)
;; Silver searcher ignore files from .gitignore
(setq helm-ag-use-agignore t)

;; Make the backspace properly erase the tab instead of
;; removing 1 space at a time.
(setq backward-delete-char-untabify-method 'hungry)

;; Match opening/closing tags
(show-paren-mode 1)

;; Line numbers
(global-display-line-numbers-mode 1)

;; Occur
(global-set-key (kbd "C-c C-,") 'occur)

;; Automatically revert buffers on new changes
(global-auto-revert-mode 1)

;; Multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(provide 'kal-navigation)
