;;; development.el --- Development configurations

;; Package-Requires:

;;; Commentary:

;; This package provides all
;; development configurations

;;; Code:

(global-company-mode)                                               ;;
(add-hook 'python-mode-hook #'lsp)                                  ;; or lsp-deferred
(setq lsp-pylsp-server-command "/home/petrosk/.local/bin/pylsp")    ;;
(global-diff-hl-mode)                                               ;;
(global-flycheck-mode)                                              ;;

(provide 'development)

;;; development.el ends here

