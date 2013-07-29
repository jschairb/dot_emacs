;;;=======================================
;;; Visual
;;;=======================================

;; Turn off everything but the windows
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; color theme
(load-theme 'deeper-blue t)

;;;=======================================
;;; Behavior
;;;=======================================

;; disable startup screen
(setq inhibit-startup-screen t)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; the blinking cursor is nothing, but an annoyance
(blink-cursor-mode -1)

;;; Make scripts executable on save if the shebang line exists
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;; Make sure spaces are used when indenting code
(setq-default indent-tabs-mode nil)

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; meaningful names for buffers with the same name
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t)    ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

;; show-paren-mode: subtle highlighting of matching parens (global-mode)
(require 'paren)
(setq show-paren-style 'parenthesis)
(show-paren-mode +1)


;;;======================================
;;; Hooks
;;;=====================================
;;; http://batsov.com/articles/2011/11/25/emacs-tip-number-3-whitespace-cleanup/
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;;======================================
;;; IDO Mode
;;;======================================

(ido-mode t)
(ido-ubiquitous t)
(require 'flx-ido)
(setq ido-enable-prefix nil
      ido-save-directory-list-file (expand-file-name "ido.hist" dot-emacs-savefile-dir)
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-use-virtual-buffers t
      ido-handle-duplicated-virtual-buffers 2
      ido-max-prospects 10)
(setq ido-use-faces nil)

;;;=======================================
;;; OS-Specifics
;;;======================================

;; OSX specific settings
(when (eq system-type 'darwin)
  (require 'customizations-osx))

(provide 'customizations)
