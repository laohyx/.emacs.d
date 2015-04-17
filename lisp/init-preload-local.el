
;; set color theme
(require-package 'leuven-theme)
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
(set-face-attribute 'default nil :height 100)



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
(add-to-list 'recentf-exclude "/.emacs.d/elpa/")

(require-package 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)


(require-package 'magit)

;; Company-mode
(require-package 'company)
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
;;(global-set-key "\t" 'company-complete-common)
(setq company-idle-delay 0)

(require-package 'company-anaconda)
(add-to-list 'company-backends 'company-anaconda)
(add-hook 'python-mode-hook 'anaconda-mode)


;; ;; company-jedi
;; (require-package 'company-jedi)
;; (defun my/python-mode-hook ()
;;   (add-to-list 'company-backends 'company-jedi))
;; (add-hook 'python-mode-hook 'my/python-mode-hook)
;; ;; Advanced usage.
;; ;; (add-to-list 'company-backends '(company-jedi company-files))

(require-package 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


(provide 'init-preload-local)









