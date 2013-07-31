(defun ruby-mode-untabify ()
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "[ \t]+$" nil t)
      (delete-region (match-beginning 0) (match-end 0)))
    (goto-char (point-min))
    (if (search-forward "\t" nil t)
        (untabify (1- (point)) (point-max))))
  nil)

(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files")

;; We never want to edit Rubinius bytecode
(add-to-list 'completion-ignored-extensions ".rbc")

(add-auto-mode 'ruby-mode
               "Rakefile\\'" "\\.rake\\'" ".irbrc\\'" "\\.ru\\'"
               "\\.gemspec\\'" "Gemfile\\'" ".pryrc\\'" "Guardfile\\'"
               "Capfile\\'")

;; Untabify buffer on save
(add-hook 'ruby-mode-hook
          '(lambda ()
             (make-local-variable 'write-contents-hooks)
             (add-hook 'write-contents-hooks 'ruby-mode-untabify)))

(add-hook 'ruby-mode-hook
          (lambda ()
            (unless (derived-mode-p 'prog-mode)
              (run-hooks 'prog-mode-hook))))

(add-hook 'ruby-mode-hook
          (lambda () (run-hooks 'dot-emacs-code-modes-hook)))

(provide 'init-ruby-mode)
