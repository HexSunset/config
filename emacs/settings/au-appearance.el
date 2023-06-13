;; -*- lexical-binding: t; -*-

(add-to-list 'default-frame-alist
	     '(font . "Iosevka Fixed Slab-16"))

(require 'gruber-darker-theme)
(load-theme 'gruber-darker t)

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)

(setq tab-width 4)


(provide 'au-appearance)
