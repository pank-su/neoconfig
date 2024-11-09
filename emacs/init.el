

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)



(use-package company
  :ensure t
  :defer t
  :init (add-hook 'after-init-hook 'global-company-mode))


(use-package telega
  :defer t
  :custom (telega-root-default-view-function 'telega-view-two-lines)
  :commands (telega)
  )


(use-package catppuccin-theme
  :init
  (setq catppuccin-flavor 'macchiato)
  (load-theme 'catppuccin :no-confirm)
  )


(use-package char-fold
  :custom
  (char-fold-symmetric t)
  (search-default-mode #'char-fold-to-regexp))



(use-package reverse-im
  :ensure t ; install `reverse-im' using package.el
  :demand t ; always load it
  :after char-fold ; but only after `char-fold' is loaded

  :custom
  ;; cache generated keymaps
  (reverse-im-cache-file (locate-user-emacs-file "reverse-im-cache.el"))
  ;; use lax matching
  (reverse-im-char-fold t)
  (reverse-im-read-char-advice-function #'reverse-im-read-char-include)
  ;; translate these methods
  (reverse-im-input-methods '("russian-computer"))
  :config
  (reverse-im-mode t)) ; turn the mode on


(use-package magit
  :ensure t
  :defer t
  )


(setq custom-file "~/.config/emacs/custom.el")
(load custom-file)
