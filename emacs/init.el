;; ███████╗███╗   ███╗ █████╗  ██████╗███████╗
;; ██╔════╝████╗ ████║██╔══██╗██╔════╝██╔════╝
;; █████╗  ██╔████╔██║███████║██║     ███████╗
;; ██╔══╝  ██║╚██╔╝██║██╔══██║██║     ╚════██║
;; ███████╗██║ ╚═╝ ██║██║  ██║╚██████╗███████║
;; ╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝╚══════╝
;; Config by Aurora<3


;; -----------------
;; --- INTERFACE ---
;; -----------------

;; Disable unwanted things
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(setq inhibit-startup-echo-area-message t)
(setq initial-scratch-message nil)
(setq initial-buffer-choice nil)
(setq frame-title-format nil)
(setq use-file-dialog nil)
(setq use-dialog-box nil)
;; (setq pop-up-windows nil)
(setq indicate-empty-lines nil)
(setq cursor-in-non-selected-windows nil)
(setq initial-major-mode 'text-mode)
(setq default-major-mode 'text-mode)
(setq completion-styles '(basic substring))

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)


;; ------------------
;; --- APPEARANCE ---
;; ------------------
(set-face-attribute 'default nil :font "Hack" :height 140)
(load-theme 'gruvbox-dark-medium t) ;; The t makes emacs not ask before loading the theme


;; ---------------------------
;; --- INSTALLING PACKAGES ---
;; ---------------------------
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)


;; --------------------------
;; --- CONFIGURE PACKAGES ---
;; --------------------------
(ido-mode)
(ido-everywhere 1)

(global-visual-line-mode)

;; Smex is ido for M-x
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; Old M-x behaviour
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


;; ----------------
;; --- KEYBINDS ---
;; ----------------

;; New frame
(defun new-frame ()
  (interactive)
  (select-frame (make-frame))
  (switch-to-buffer "*scratch*"))
(global-set-key (kbd "M-n") 'new-frame)
(global-set-key (kbd "M-`") 'other-frame)

;; Kill current buffer
(global-set-key (kbd "C-x k") 'kill-current-buffer)

;; Close frame if not the last, kill emacs else
(defun delete-frame-or-kill-emacs ()
  "Delete frame or kill Emacs if there is only one frame."
  (interactive)
  (if (> (length (frame-list)) 1)
      (delete-frame)
    (save-buffers-kill-terminal)))
(global-set-key (kbd "C-x C-c") 'delete-frame-or-kill-emacs)


;; ----------------
;; --- ORG-MODE ---
;; ----------------
;; TODO: configure things idk

;; ----------------------
;; --- OTHER SETTINGS ---
;; ----------------------

;; Make OS clipboard work
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

;; Custom autosave folder
(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backups"))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(dynamic-spaces smex rust-mode magit gruvbox-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
