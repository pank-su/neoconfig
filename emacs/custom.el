(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(delete-selection-mode t)
 '(display-battery-mode t)
 '(display-time-24hr-format t)
 '(display-time-mode t)
 '(eglot-events-buffer-size 0)
 '(electric-pair-mode t)
 '(ispell-dictionary "ru_RU,en_US")
 '(ispell-local-dictionary-alist
   '(("ru_RU,en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil
      ("-d" "ru_RU,en_US") nil utf-8)))
 '(ispell-program-name "hunspell")
 '(ispell-really-hunspell t t)
 '(org-format-latex-options
   '(:foreground default :background default :scale 0.7 :html-foreground
		 "Black" :html-background "Transparent" :html-scale
		 1.0 :matchers ("begin" "$1" "$" "$$" "\\(" "\\[")))
 '(org-latex-caption-above '(table src-block))
 '(package-selected-packages nil)
 '(package-vc-selected-packages
   '((typst-preview :url
		    "https://github.com/havarddj/typst-preview.el.git"
		    :branch "main")))
 '(prog-mode-hook '(flyspell-prog-mode display-line-numbers-mode))
 '(save-place-mode t)
 '(scroll-bar-mode nil)
 '(text-mode-hook
   '(turn-on-flyspell turn-on-auto-fill text-mode-hook-identify))
 '(tool-bar-mode nil)
 '(warning-minimum-level :warning)
 '(window-divider-default-bottom-width 1)
 '(yascroll:delay-to-hide 1))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "JetBrainsMono Nerd Font" :foundry "JB" :slant normal :weight regular :height 128 :width normal)))))
