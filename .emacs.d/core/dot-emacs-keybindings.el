(global-set-key (kbd "C-#")     'comment-or-uncomment-region)
(global-set-key (kbd "C-c #")   'comment-or-uncomment-region)
(global-set-key (kbd "C-c r")   'reload-init)
(global-set-key (kbd "C-w")     'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)

;; Invoke M-x without the Alt key
(global-set-key (kbd "C-x C-m") 'execute-extended-command)
(global-set-key (kbd "C-c C-m") 'execute-extended-command)

(global-set-key (kbd "M-g")     'goto-line)
(global-set-key (kbd "M-n")     'duplicate-line)

(provide 'dot-emacs-keybindings)
