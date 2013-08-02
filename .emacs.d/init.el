(message "All your bases are belonging to %s!" (getenv "USER"))

(defvar dot-emacs-dir user-emacs-directory)
(add-to-list 'load-path dot-emacs-dir)

(defvar dot-emacs-core-dir (expand-file-name "core" dot-emacs-dir)
  "The core functionality of this configuration.")
(add-to-list 'load-path dot-emacs-core-dir)

(defvar dot-emacs-savefile-dir (expand-file-name "savefile" dot-emacs-dir)
  "This folder stores all the automatically generated save/history-files.")

(unless (file-exists-p dot-emacs-savefile-dir)
  (make-directory dot-emacs-savefile-dir))

;;;(defvar init-dir (expand-file-name "init.d" dot-emacs-dir)
;;;  "The home of dot_emacs initialization.")
;;;(add-to-list 'load-path init-dir)

(require 'cl)
(require 'thingatpt)

(require 'dot-emacs-defuns)
(require 'dot-emacs-hooks)
(require 'dot-emacs-keybindings)
(require 'dot-emacs-packages)

(require 'customizations)

;;(require-elisp-files init-dir)

;; setup load path
;; setup packages
;; load os x specific
