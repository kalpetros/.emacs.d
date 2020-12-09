;;; initt.el --- Emacs setup

;;; Commentary:

;; init.el initializes all needed packages

;;; Code:

(require 'package)

(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lib/")

;; List of packages
(defvar kal-packages
  '(flycheck            ; Install the following too (eslint, pylint, sass-lint)
    helm
    helm-ag
    company
    company-jedi
    json-mode
    rjsx-mode
    emmet-mode
    web-mode
    yaml-mode
    yasnippet
    yasnippet-snippets
    multiple-cursors
    magit
    git-gutter+         ; Needs Git
    git-gutter-fringe+  ; Needs git-gutter+
    neotree
    night-owl-theme
    all-the-icons)
  "List of packages.")

;; Load sources
(require 'kal-sources)

;; Load helpers
(require 'kal-helpers)

;; Fsetch available packages
(when (not package-archive-contents)
  (package-refresh-contents))

;; Install missing packages
(dolist (pkg kal-packages)
  (kal-package-install pkg))

;; Load packages
(require 'kal-appearance)
(require 'kal-modeline)
(require 'kal-navigation)
(require 'kal-vc)
(require 'kal-linting)
(require 'kal-editing)
(require 'kal-python)
(require 'kal-html)
(require 'kal-react)
(require 'kal-yaml)
(require 'kal-util)

;; Custom file
(setq custom-file "~/.emacs.d/custom.el")
(condition-case err
    (load custom-file)
  (error (message "Error loading custom file")))

;;; init.el ends here
