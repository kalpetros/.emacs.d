;;; kal-linting.el --- Linting support

;; Package-Requires:

;;; Commentary:

;; This package provides various
;; linting configurations

;;; Code:

;; Flycheck
(require 'flycheck)
(global-flycheck-mode)
(global-set-key (kbd "C-c e") 'flycheck-list-errors)
(setq flycheck-python-pylint-executable "python3")

;; (setq flycheck-check-syntax-automatically '(mode-enabled save))
;; (setq flycheck-python-flake8-executable 'flake8)

(provide 'kal-linting)

;;; kal-linting.el ends here
