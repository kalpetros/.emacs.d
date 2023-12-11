;;; init.el --- Emacs

;;; Commentary:

;; init.el initializes all needed packages

;;; Code:

;; ===================================
;; Setup
;; ===================================

(require 'package)

(package-initialize)

(defvar my-packages
  '(company             ;;
    diff-hl             ;;
    doom-modeline       ;;
    flycheck            ;;
    helm                ;;
    helm-ag             ;;
    lsp-mode            ;; Need to pip install python-lsp-server first
    lsp-ui              ;; UI integrations for lsp-mode
    magit               ;;
    multiple-cursors    ;;
    timu-rouge-theme    ;;
    )
  )

;; ===================================
;; Load packages
;; ===================================

(add-to-list 'load-path "~/.emacs.d/packages/")

(require 'sources)

;; If there are no archived package contents, refresh them
(when (not package-archive-contents)
  (package-refresh-contents))

;; Check if packages are installed
;; and if not install them
(mapc #'(lambda (package)
	  (unless (package-installed-p package)
	    (package-install package)))
      my-packages)

(require 'ui)
(require 'development)
(require 'navigation)

(provide 'init)
;;; init.el ends here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(timu-rouge-theme multiple-cursors magit lsp-ui lsp-mode helm-ag helm flycheck doom-modeline diff-hl company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
