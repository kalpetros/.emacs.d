;;; kal-vc.el --- Version control

;; Package-Requires:

;;; Commentary:

;; This package provides various
;; version control configurations

;;; Code:

;; Git Gutter & Fringe
(global-git-gutter+-mode)
(require 'git-gutter-fringe+) ;; Needs git gutter as a dependency

(provide 'kal-vc)

;;; kal-vc.el ends here
