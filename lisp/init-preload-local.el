(require-package 'better-defaults)
(require 'better-defaults)
(global-auto-revert-mode 1)

(require-package 'find-file-in-project)
(require 'find-file-in-project)

(require-package 'ido-ubiquitous)
(require 'ido-ubiquitous)

(require-package 'paredit)
(require 'paredit)

(require-package 'idle-highlight-mode)
(require 'idle-highlight-mode)
(idle-highlight-mode 1)

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
(if window-system
    (global-hl-line-mode 1)
  (set-face-foreground 'highlight nil))

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
(setq recentf-max-saved-items 30)
(setq recentf-max-menu-items 30)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(add-to-list 'recentf-exclude "/.emacs.d/elpa/")
(add-to-list 'recentf-exclude "/ido.last")
(add-to-list 'recentf-exclude "/.git/COMMIT_EDITMSG")

(require-package 'smex)
(require 'smex)
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
(require 'irony)
(defun my-c++-hooks ()
  (yas/minor-mode-on)
  (when (member major-mode irony-known-modes)
    (irony-mode 1)))

(add-hook 'c++-mode-hook 'my-c++-hooks)
(add-hook 'c-mode-hook 'my-c++-hooks)
(add-hook 'objc-mode-hook 'my-c++-hooks)

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

(require 'ido)
(ido-mode t)
(setq ido-ignore-buffers '("^ " "*Completions*" "*Shell Command Output*"
               "*Messages*" "Async Shell Command"))

(setq compilation-scroll-output 1)


(require-package 'yasnippet)
(yas-global-mode 1)
(add-hook 'term-mode-hook (lambda()
        (setq yas-dont-activate t)))

(require-package 'php-mode)
(require-package 'python-mode)


;; http://emacsredux.com/blog/2013/05/22/smarter-navigation-to-the-beginning-of-a-line/
(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

;; remap C-a to `smarter-move-beginning-of-line'
(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)
;; c mode, for jump between .cpp and .h files
(add-hook 'c-mode-common-hook
  (lambda() 
    (local-set-key  (kbd "C-c o") 'ff-find-other-file)))

(require 'desktop-menu)
(desktop-menu-mode)
(setq desktop-files-not-to-save "^$")

(require-package 'window-number)
(require 'window-number)
(window-number-mode)
(window-number-meta-mode)



(require-package 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

(require-package 'flycheck-irony)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook 'flycheck-irony-setup))


(provide 'init-preload-local)



