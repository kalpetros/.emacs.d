;;; kal-helpers.el --- Various helper functions

(defun kal-package-install (pkg)
  "Check if a PKG is installed.  If not install it."
  (when (not (package-installed-p pkg))
    (condition-case err
        (package-install pkg nil)
      (error
       (message "Failed to install %s: %s"  pkg err)))))

(provide 'kal-helpers)
