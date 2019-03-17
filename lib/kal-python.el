;;; kal-python.el --- Python support

;; Package-Requires:

;;; Commentary:

;; This package provides various
;; python configurations

;;; Code:

;; Jedi
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(provide 'kal-python)

;;; kal-python.el ends here
