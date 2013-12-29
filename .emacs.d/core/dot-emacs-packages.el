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
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar global-packages '(ido-ubiquitous flx-ido markdown-mode rspec-mode ruby-mode ruby-electric smex)
  "A list of packages to ensure are installed at launch.")

(dolist (p global-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; markdown-mode doesn't have autoloads for the auto-mode-alist
;; so we add them manually if it's already installed
(when (package-installed-p 'markdown-mode)
  (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode)))

;; Add rbenv support if it's installed
(when (file-exists-p rbenv-installation-dir)
  (when (not (package-installed-p 'rbenv))
    (package-install 'rbenv))
  (setq rbenv-show-active-ruby-in-modeline nil)
  (global-rbenv-mode)
  )

;; smex
(setq smex-save-file (concat user-emacs-directory ".smex-items"))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

(provide 'dot-emacs-packages)
