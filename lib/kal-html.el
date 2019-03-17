;;; kal-html.el --- HTML support

;; Emmet
(global-set-key (kbd "C-x j") 'emmet-expand-line)

;; Web mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(setq web-mode-engines-alist '(("django" . "\\.html\\'")))
(setq web-mode-markup-indent-offset 2)
(setq web-mode-code-indent-offset 2)
;;(setq web-mode-css-indent-offset 2)
(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-auto-expanding t)
(setq web-mode-enable-css-colorization t)
(setq web-mode-enable-current-element-highlight t)
(set-face-attribute 'web-mode-current-element-highlight-face nil :foreground "Yellow")
;; use web-mode for .jsx files
;; (add-to-list 'auto-mode-alist '("\\.js[x]?\\" . web-mode))

(provide 'kal-html)
