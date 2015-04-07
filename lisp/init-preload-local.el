(require-package 'color-theme-sanityinc-tomorrow)


;; set color theme
(color-theme-sanityinc-tomorrow-night)
;; truncate long lines
(set-default 'truncate-lines t)

(setq redisplay-dont-pause t
  scroll-margin 1
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)

;; set initial frame size
(add-to-list 'default-frame-alist '(height . 40))
(add-to-list 'default-frame-alist '(width . 130))


(server-start)

(require 'cl)


;; tabbar-ruler
(require-package 'tabbar-ruler)
(setq tabbar-ruler-global-tabbar t) ; If you want tabbar
;(setq tabbar-ruler-global-ruler t) ; if you want a global ruler
(setq tabbar-ruler-popup-menu t) ; If you want a popup menu.
(setq tabbar-ruler-popup-toolbar t) ; If you want a popup toolbar
(setq tabbar-ruler-popup-scrollbar t) ; If you want to only show the
                                       ; scroll bar when your mouse is moving.
(require 'tabbar-ruler)


(require-package 'hl-line+)
(require 'hl-line+) ; Load this file (it will load `hl-line.el')
(global-hl-line-mode 1)
(set-face-background 'hl-line "#3e4446")
(set-face-foreground 'highlight nil)


(setq shell-file-name "bash")
(setq shell-command-switch "-ic")



(provide 'init-preload-local)









