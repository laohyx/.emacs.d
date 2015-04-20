(global-auto-revert-mode 1)

;; set color theme
(require-package 'leuven-theme)
(if window-system
    (load-theme 'leuven t))



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



(setq shell-file-name "/bin/bash")
(setq shell-command-switch "-ic")

;; set font size. height / 10 = pt. Default is 120 (12 pt)
(set-face-attribute 'default nil :height 100)



(require-package 'flyspell-lazy)
(require 'flyspell-lazy)
;;(flyspell-lazy-mode 1)
;;(flyspell-mode 1)      ; or (flyspell-prog-mode)

;; enable autopair mode 
(electric-pair-mode)


(require-package 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 50)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(add-to-list 'recentf-exclude "/.emacs.d/elpa/")
(add-to-list 'recentf-exclude "/.git/COMMIT_EDITMSG")

(require-package 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)


(require-package 'magit)
(setq magit-last-seen-setup-instructions "1.4.0")

;; Company-mode
(require-package 'company)
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(global-set-key (kbd "M-/") 'company-complete-common)
(setq company-idle-delay 0)

;; (require-package 'company-anaconda)
;; (add-to-list 'company-backends 'company-anaconda)
;; (add-hook 'python-mode-hook 'anaconda-mode)

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

;; gtags
(require-package 'ggtags)
(add-hook 'c++-mode-hook 'ggtags-mode)
(add-hook 'c-mode-hook 'ggtags-mode)
(add-hook 'objc-mode-hook 'ggtags-mode)

(require-package 'irony)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(require-package 'company-irony)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

;; (optional) adds CC special commands to `company-begin-commands' in order to
;; trigger completion at interesting places, such as after scope operator
;;     std::|
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)



(setq compilation-scroll-output 1)
 
(provide 'init-preload-local)



