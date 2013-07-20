(message "All your bases are belonging to %s!" (getenv "USER"))

(defvar dot-emacs-dir user-emacs-directory)

(add-to-list 'load-path dot-emacs-dir)

;;;(defvar init-dir (expand-file-name "init.d" dot-emacs-dir)
;;;  "The home of dot_emacs initialization.")
;;;(add-to-list 'load-path init-dir)

(defun reload-init ()
  "reload your .emacs file without restarting Emacs"
  (interactive)
  (load-file user-init-file) )

(global-set-key (kbd "C-c r") 'reload-init)

(message "%s" load-path)

(defun require-elisp-files (dir)
  "Require all elisp files in DIR"
  (dolist (f (directory-files dir))
    (let ((name (expand-file-name f dir )))
      (when (and (file-directory-p name)
		 (not (equal f ".."))
		 (not (equal f ".")))
	(require name)))))

(require 'customizations)


;;(require-elisp-files init-dir)

;; setup load path
;; setup packages
;; load os x specific
