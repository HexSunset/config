;; -*- lexical-binding: t; -*-

;; Fix some stupid default behavior that I don't want


(setq inhibit-startup-message t
      visible-bell nil)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)


(provide 'au-fix-defaults)
