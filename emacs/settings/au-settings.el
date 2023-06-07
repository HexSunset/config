;; Separate file for custom variables
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(put 'dired-find-alternate-file 'disabled nil)

;; Stop the directory switching IDO likes to do.
(setq ido-auto-merge-work-directories-length -1)

;; No more backups
(setq make-backup-files nil)


(provide 'au-settings)
