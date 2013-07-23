(message "All your bases are belonging to %s!" (getenv "USER"))

(defvar dot-emacs-dir user-emacs-directory)
(add-to-list 'load-path dot-emacs-dir)

;;;(defvar init-dir (expand-file-name "init.d" dot-emacs-dir)
;;;  "The home of dot_emacs initialization.")
;;;(add-to-list 'load-path init-dir)

(require 'cl)
(require 'thingatpt)

(require 'my-defuns)
(require 'my-bindings)
(require 'my-packages)

(require 'customizations)

;;(require-elisp-files init-dir)

;; setup load path
;; setup packages
;; load os x specific
