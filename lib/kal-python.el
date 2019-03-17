;;; kal-python.el --- Python support

;; Jedi
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(provide 'kal-python)
