;; Separate file for custom variables
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(put 'dired-find-alternate-file 'disabled nil)

;; Backups only in ~/.config/emacs/backups/ folder
(setq backup-directory-alist (("." . (expand-file-name "backups" user-emacs-directory))))


(provide 'au-settings)
