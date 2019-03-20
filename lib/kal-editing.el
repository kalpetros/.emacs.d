;;; kal-editing.el --- General editing configuration

;; Package-Requires:

;;; Commentary:

;; This package provides various
;; editing configurations

;;; Code:

;; Auto add/close bracket/brace
(electric-pair-mode 1)

;; Company mode
(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'python-mode-hook 'my/python-mode-hook)

;; YASnippet
(add-to-list 'load-path "~/.emacs.d/snippets")
(require 'yasnippet)
(yas-global-mode 1)

(provide 'kal-editing)

;;; kal-editing.el ends here
