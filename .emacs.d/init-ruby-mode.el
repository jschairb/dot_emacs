(add-auto-mode 'ruby-mode
               "Rakefile\\'" "\\.rake\\'" ".irbrc\\'" "\\.ru\\'"
               "\\.gemspec\\'" "Gemfile\\'" ".pryrc\\'")

(add-hook 'ruby-mode-hook
          (lambda ()
            (unless (derived-mode-p 'prog-mode)
              (run-hooks 'prog-mode-hook))))
