(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(delete-selection-mode t)
 '(desktop-save-mode t)
 '(display-battery-mode t)
 '(eglot-events-buffer-size 0)
 '(org-format-latex-options
   '(:foreground default :background default :scale 0.7 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
		 ("begin" "$1" "$" "$$" "\\(" "\\[")))
 '(org-latex-caption-above '(table src-block))
 '(package-selected-packages '(org yasnippet reverse-im magit company catppuccin-theme))
 '(prog-mode-hook '(flyspell-prog-mode display-line-numbers-mode))
 '(save-place-mode t)
 '(text-mode-hook
   '(turn-on-flyspell turn-on-auto-fill text-mode-hook-identify))
 '(tool-bar-mode nil)
 '(warning-minimum-level :warning))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "JetBrainsMono Nerd Font" :foundry "JB" :slant normal :weight regular :height 128 :width normal)))))
