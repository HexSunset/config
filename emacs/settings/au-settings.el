;; Separate file for custom variables
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(put 'dired-find-alternate-file 'disabled nil)

;; No more backups
(setq make-backup-files nil)

;; Visual line mode everywhere
(global-visual-line-mode)


(provide 'au-settings)
