;;; initt.el --- Emacs setup

(require 'package)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lib")

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
    wakatime-mode))     ; Needs wakatime

;; Load sources
(require 'kal-sources)

;; Load helpers
(require 'kal-helpers)

;; Check for package state
;; install it if its missing
(dolist (pkg kal-packages)
  (kal-package-install pkg))

;; (when (not package-archive-contents)
;;   (package-refresh-contents))
;; Load libraries
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
