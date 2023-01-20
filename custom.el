(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   '("~/Org/sarouong.org" "/home/jonathan/Org/weed.org" "/home/jonathan/Org/todo.org" "/home/jonathan/Org/clients/fondation-taurus/fondation-taurus.org" "/home/jonathan/Org/website.org" "/home/jonathan/Org/refile.org" "/home/jonathan/Org/independant.org" "/home/jonathan/Org/diary.org" "/home/jonathan/Org/clients/actionpourmalades/actionpourmalades.org" "/home/jonathan/Org/clients/demart/demart.org" "/home/jonathan/Org/clients/fondation-taurus/fondationtaurus-chaisesvolantes.org"))
 '(org-ditaa-jar-path "/home/jonathan/ditaa/ditaa0_9/ditaa0_9.jar")
'(package-selected-packages '(benchmark-init))
 '(safe-local-variable-values
   '((eval progn
      (set
       (make-local-variable 'org-time-clocksum-format)
       '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t))
      (setq org-latex-tables-centered nil org-latex-default-table-environment "longtable")
      (local-set-key
       (kbd "<f6>")
       (lambda nil
         (interactive)
         (beginning-of-buffer)
         (re-search-forward "Invoice number: \\([0-9]+\\)")
         (let
             ((n
               (string-to-number
                (match-string 1))))
           (kill-region
            (match-beginning 1)
            (match-end 1))
           (insert
            (format "%d"
                    (1+ n))))
         (beginning-of-buffer)
         (re-search-forward "Invoice date: *")
         (kill-region
          (point)
          (save-excursion
            (end-of-line)
            (point)))
         (org-insert-time-stamp
          (current-time)
          nil t)
         (beginning-of-buffer)
         (search-forward "#+BEGIN: clocktable")
         (unwind-protect
             (progn
               (defadvice org-table-goto-column
                   (before always-make-new-columns
                           (n &optional on-delim force)
                           activate)
                 "always adds new columns when we move to them"
                 (setq force t))
               (org-clocktable-shift 'right 1))
           (ad-deactivate 'org-table-goto-column))
         (beginning-of-buffer)
         (search-forward "| totaltarget")
         (org-table-recalculate t))))))
 '(warning-suppress-types '((initialization) (defvaralias)) t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((t (:slant italic))))
 '(font-lock-keyword-face ((t (:slant italic))))
 '(org-mode-line-clock ((t (:foreground "red" :box (:line-width -1 :style released-button))))))
