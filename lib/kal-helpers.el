;;; kal-helpers.el --- Various helper functions

;; Package-Requires:

;;; Commentary:

;; This package provides various
;; helper functions to be used
;; in other packages

;;; Code:

(defun kal-package-install (pkg)
  "Check if a PKG is installed.  If not install it."
  (when (not (package-installed-p pkg))
    (condition-case err
        (package-install pkg nil)
      (error
       (message "Failed to install %s: %s"  pkg err)))))

(provide 'kal-helpers)

;;; kal-helpers.el ends here
