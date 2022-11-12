;; ███████╗███╗   ███╗ █████╗  ██████╗███████╗
;; ██╔════╝████╗ ████║██╔══██╗██╔════╝██╔════╝
;; █████╗  ██╔████╔██║███████║██║     ███████╗
;; ██╔══╝  ██║╚██╔╝██║██╔══██║██║     ╚════██║
;; ███████╗██║ ╚═╝ ██║██║  ██║╚██████╗███████║
;; ╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝╚══════╝

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
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(org-agenda-files
   '("~/org/agenda/school.org" "/home/aurora/org/agenda/personal.org"))
 '(org-capture-templates
   '(("p" "personal task" entry
      (file "~/org/agenda/personal.org")
      "" :time-prompt t)
     ("s" "school task" entry
      (file "~/org/agenda/school.org")
      "" :time-prompt t)) t)
 '(org-todo-keywords '((sequence "TODO" "DONE" "WAITING" "CANCELLED")))
 '(package-selected-packages
   '(tron-legacy-theme cyberpunk-theme auto-complete switch-window ido-hacks ido-at-point deft monokai-theme adoc-mode python smex rust-mode magit))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#282828" :foreground "#ebdbb2" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "SRC" :family "Hack")))))


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

;; auto-complete
(ac-config-default)

;; Smex is ido for M-x
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; Old M-x behaviour
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; deft will be used to organize org-mode notes
(setq deft-directory "~/org/notes/")
(setq deft-recursive t)

;; Dimmer
(dimmer-configure-which-key)
(dimmer-mode t)

;; switch-window keybinds
(global-set-key (kbd "C-x o") 'switch-window)
(global-set-key (kbd "C-x 1") 'switch-window-then-maximize)
(global-set-key (kbd "C-x 2") 'switch-window-then-split-below)
(global-set-key (kbd "C-x 3") 'switch-window-then-split-right)
(global-set-key (kbd "C-x 0") 'switch-window-then-delete)

(global-set-key (kbd "C-x 4 d") 'switch-window-then-dired)
(global-set-key (kbd "C-x 4 f") 'switch-window-then-find-file)
(global-set-key (kbd "C-x 4 m") 'switch-window-then-compose-mail)
(global-set-key (kbd "C-x 4 r") 'switch-window-then-find-file-read-only)

(global-set-key (kbd "C-x 4 C-f") 'switch-window-then-find-file)
(global-set-key (kbd "C-x 4 C-o") 'switch-window-then-display-buffer)

(global-set-key (kbd "C-x 4 0") 'switch-window-then-kill-buffer)


;; ----------------
;; --- ORG-MODE ---
;; ----------------

;; keybinds for convenience

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)
(global-set-key (kbd "C-c d") #'deft)

;; capture timestamp when todo state changes
(setq org-log-done 'time)

;; org-capture templates
(setq org-capture-templates
      '(("p" "Personal task" entry (file "~/org/agenda/personal.org")
         "* TODO %^{task}\n\n  DEADLINE: %^t\n")
        ("s" "School task" entry (file "~/org/agenda/school.org")
         "* TODO %^{task}\n\n  DEADLINE: %^t\n")))


;; ----------------------
;; --- OTHER SETTINGS ---
;; ----------------------

;; Make OS clipboard work
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

;; Custom autosave folder
(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backups"))))
