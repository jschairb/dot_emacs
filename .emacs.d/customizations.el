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

;;;=======================================
;;; Behavior
;;;=======================================

;; disable startup screen
(setq inhibit-startup-screen t)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; the blinking cursor is nothing, but an annoyance
(blink-cursor-mode -1)

;; Don't clutter up directories with files~
;;(setq backup-directory-alist `(("." . ,(expand-file-name
;;                                        (concat dotfiles-dir "backups")))))

;;;=======================================
;;; Packages
;;;=======================================

(require 'package)
(add-to-list 'package-archives
            '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
            '("ELPA" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
            '("gnu" . "http://elpa.gnu.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '()
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(provide 'customizations)
