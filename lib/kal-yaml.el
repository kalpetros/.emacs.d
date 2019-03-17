;;; kal-yaml.el --- YAML support

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

(provide 'kal-yaml)
