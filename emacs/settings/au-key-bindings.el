;; -*- lexical-binding: t; -*-

(global-set-key (kbd "M-o") 'other-window)

;; Commands
(global-set-key (kbd "M-x") 'smex)

;; Files
(global-set-key (kbd "C-x C-f") 'ido-find-file)

;; Buffer management
(global-set-key (kbd "C-x C-k") 'kill-current-buffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "C-<tab>") 'company-complete)


(provide 'au-key-bindings)
