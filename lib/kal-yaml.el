;;; kal-yaml.el --- YAML support

;; Package-Requires:

;;; Commentary:

;; This package provides various
;; YAML configurations

;;; Code:

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

(provide 'kal-yaml)

;;; kal-yaml.el ends here
