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


(server-start)




(provide 'init-preload-local)









