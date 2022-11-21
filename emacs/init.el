;; ███████╗███╗   ███╗ █████╗  ██████╗███████╗
;; ██╔════╝████╗ ████║██╔══██╗██╔════╝██╔════╝
;; █████╗  ██╔████╔██║███████║██║     ███████╗
;; ██╔══╝  ██║╚██╔╝██║██╔══██║██║     ╚════██║
;; ███████╗██║ ╚═╝ ██║██║  ██║╚██████╗███████║
;; ╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝╚══════╝
;; by Aurora<3

;; --------------
;; --- CUSTOM ---
;; --------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(monokai))
 '(custom-safe-themes
   '("2af6d337981b88f85980124e47e11cbff819200bba92648f59154a6ff35a7801" "e80b1078c4ce2225f6f8d7621a55d3b675c86cad505b22b20243d4d075f491f5" "b66970f42d765a40fdb2b6b86dd2ab6289bed518cf4d8973919e5f24f0ca537b" "78e6be576f4a526d212d5f9a8798e5706990216e9be10174e3f3b015b8662e27" "3d2e532b010eeb2f5e09c79f0b3a277bfc268ca91a59cdda7ffd056b868a03bc" default))
 '(display-line-numbers 'relative)
 '(package-selected-packages
   '(monokai-theme python smex rust-mode magit)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#272720" :foreground "#ebdbb2" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "SRC" :family "Hack")))))

;; --------------
;; --- VISUAL ---
;; --------------
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
(setq pop-up-windows nil)
(setq indicate-empty-lines nil)
(setq cursor-in-non-selected-windows nil)
(setq initial-major-mode 'text-mode)
(setq default-major-mode 'text-mode)
(setq completion-styles '(basic substring))


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
