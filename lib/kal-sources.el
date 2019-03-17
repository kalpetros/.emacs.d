;;; kal-sources.el --- Define package sources

;; Package-Requires:

;;; Commentary:

;; This package adds a list
;; of external package sources
;; to package-archives

;;; Code:

;; List of sources
(defvar ks-sources '(("melpa" . "://melpa.org/packages/")
		     ("melpa-stable" . "://stable.melpa.org/packages/")
		     ("gnu" . "://elpa.gnu.org/packages/")))

;; Check for ssl
(defvar ks-sslp (and (memq system-type '(windows-nt ms-dos))
		 (not (gnutls-available-p))))

(when ks-sslp
  (warn "Your version of Emacs does not support SSL connections."))

;; Set protocol
(defvar ks-protocol (if ks-sslp "https" "http"))

;; GNU source not needed for emacs 25+
(when (> emacs-major-version 24)
  (delete (assoc "gnu" ks-sources) ks-sources))

;; Build source url and add to package-archives
(dolist (source
	 ks-sources)
  (add-to-list 'package-archives (cons (car source) (concat ks-protocol (cdr source)))))

(provide 'kal-sources)

;;; kal-sources.el ends here
