;;----------------------------------------------------------------------------
;; Handier way to add modes to auto-mode-alist
;;----------------------------------------------------------------------------
(defun add-auto-mode (mode &rest patterns)
  "Add entries to `auto-mode-alist' to use `MODE' for all given file `PATTERNS'."
  (dolist (pattern patterns)
    (add-to-list 'auto-mode-alist (cons pattern mode))))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun require-elisp-files (dir)
  "Require all elisp files in DIR"
  (dolist (f (directory-files dir))
    (let ((name (expand-file-name f dir )))
      (when (and (file-directory-p name)
		 (not (equal f ".."))
		 (not (equal f ".")))
	(require name)))))

(defun reload-init ()
  "reload your .emacs file without restarting Emacs"
  (interactive)
  (load-file user-init-file) )

(defun smart-open-line (arg)
  "Insert an empty line after the current line.
Position the cursor at its beginning, according to the current mode.

With a prefix ARG open line above the current line."
  (interactive "P")
  (if arg
      (smart-open-line-above)
    (progn
      (move-end-of-line nil)
      (newline-and-indent))))

(defun smart-open-line-above ()
  "Insert an empty line above the current line.
Position the cursor at it's beginning, according to the current mode."
  (interactive)
  (move-beginning-of-line nil)
  (newline-and-indent)
  (forward-line -1)
  (indent-according-to-mode))

(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(provide 'my-defuns)
