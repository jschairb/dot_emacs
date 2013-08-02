;; turn on line numbers for code files
(add-hook 'dot-emacs-code-modes-hook
          (lambda () (linum-mode 1)))

(provide 'dot-emacs-hooks)
