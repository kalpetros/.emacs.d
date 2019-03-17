;;; kal-editing.el --- General editing configuration

;; Auto add/close bracket/brace
(electric-pair-mode 1)

;; Auto complete
(ac-config-default)
(global-auto-complete-mode 1)

;; YASnippet
(add-to-list 'load-path "~/.emacs.d/snippets")
(require 'yasnippet)
(yas-global-mode 1)

(provide 'kal-editing)
