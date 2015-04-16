

;; set color theme
(load-theme 'leuven t)

;; (require-package 'color-theme-sanityinc-tomorrow)
;; ;(color-theme-sanityinc-tomorrow-night)
;; (color-theme-sanityinc-tomorrow-day)

;; hl-line+
(require-package 'hl-line+)
(require 'hl-line+) ; Load this file (it will load `hl-line.el')
(global-hl-line-mode 1)
;(set-face-background 'hl-line "#eeeeee")
;(set-face-background 'hl-line "#3e4446")
(set-face-foreground 'highlight nil)

;; truncate long lines
; (set-default 'truncate-lines t)

(setq redisplay-dont-pause t
  scroll-margin 3
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




(setq shell-file-name "/bin/bash")
(setq shell-command-switch "-ic")

;; set font size. height / 10 = pt. Default is 120 (12 pt)
(set-face-attribute 'default nil :height 110)



(require-package 'flyspell-lazy)
(require 'flyspell-lazy)
(flyspell-lazy-mode 1)
(flyspell-mode 1)      ; or (flyspell-prog-mode)

;; enable autopair mode 
(electric-pair-mode)


(require-package 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 50)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(require-package 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)


(require-package 'magit)



(provide 'init-preload-local)









