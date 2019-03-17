;;; initt.el --- Emacs setup

;;; Commentary:

;; init.el initializes all needed packages

;;; Code:

(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lib/")

;; List of packages
(defvar kal-packages
  '(night-owl-theme
    helm
    helm-ag
    json-mode
    rjsx-mode
    multiple-cursors
    flycheck            ; Install the following too (eslint, pylint, sass-lint)
    auto-complete
    emmet-mode
    web-mode
    git-gutter+         ; Needs Git
    git-gutter-fringe+  ; Needs git-gutter+
    jedi
    all-the-icons
    yasnippet
    yasnippet-snippets
    yaml-mode
    wakatime-mode)
  "List of packages.")

;; Load sources
(require 'kal-sources)

;; Load helpers
(require 'kal-helpers)

;; Fetch available packages
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

;;; init.el ends here
