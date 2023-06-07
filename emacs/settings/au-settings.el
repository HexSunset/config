;; Separate file for custom variables
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(put 'dired-find-alternate-file 'disabled nil)

;; No more backups
(setq make-backup-files nil)

;; Revert Dired and other buffers
(setq global-auto-revert-non-file-buffers t)


(provide 'au-settings)
