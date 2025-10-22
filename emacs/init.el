(setq custom-file "~/.config/emacs/custom.el")
(load custom-file)



(use-package ef-themes
  :ensure
  t
  :config (load-theme 'ef-frost :no-confirm)
  )

(defun text-mode-company ()
  "Настройки company для text mode"
  (setq-local company-backends '((company-dabbrev company-yasnippet :separate) company-files)
	      )
  )


(use-package company
  :ensure
  t
  :defer t
  :custom (company-dabbrev-downcase nil)
  :hook (
	 (after-init . global-company-mode)
	 (text-mode . text-mode-company)
	 )
  )


;; Typst configuration
(use-package typst-ts-mode
  :ensure t
  :defer t
  :custom
  (typst-ts-mode-enable-raw-blocks-highlight t)
  :after eglot
  :config
  (with-eval-after-load 'eglot

  (add-to-list 'eglot-server-programs
               `((typst-ts-mode) .
                 ,(eglot-alternatives `(,typst-ts-lsp-download-path
                                        "tinymist"
                                        ))))
  )
  
  )

(use-package websocket
  :ensure t
  :defer t
  )

(use-package diff-hl
  :ensure t
  :defer t
  :config (global-diff-hl-mode))

(use-package edit-indirect
  :ensure t
  :defer t)

(use-package typst-preview
  :ensure t
  :after websocket
  :defer t
  :custom ((typst-preview-executable "tinymist preview")
	   )
  :vc (:url "https://github.com/havarddj/typst-preview.el.git" :branch main :rev :newest))

(use-package diff-hl
  :ensure t
  :defer t
  :config (global-diff-hl-mode))

(use-package edit-indirect
  :ensure t
  :defer t)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)


(use-package telega
  :ensure t
  :defer
  t
  :custom (telega-root-default-view-function 'telega-view-two-lines)
  :commands (telega)
  )
  


(use-package telega
  :ensure t
  :defer
  t
  :custom (telega-root-default-view-function 'telega-view-two-lines)
  :commands (telega)
)





(use-package char-fold
  :custom
  (char-fold-symmetric t)
  (search-default-mode #'char-fold-to-regexp))



(use-package reverse-im
  :ensure
  t ; install `reverse-im' using package.el
  :demand t ; always load it
  :after char-fold ; but only after `char-fold' is loaded

  :custom
  ;; cache generated keymaps
  (reverse-im-cache-file
  (locate-user-emacs-file "reverse-im-cache.el"))
  ;; use lax matching
  (reverse-im-char-fold t)
  (reverse-im-read-char-advice-function #'reverse-im-read-char-include)
  ;; translate these methods
  (reverse-im-input-methods '("russian-computer"))
  :config
  (reverse-im-mode t))
					; turn the mode on


(use-package magit
  :ensure t
  :defer t
  )

(use-package yasnippet
  :ensure t
  :defer t
  :init (yas-global-mode 1))

(use-package yasnippet-snippets
  :ensure
  t
  :defer t
  :after yasnippet)

(use-package cdlatex
  :ensure t
  )

(use-package org
  :after cdlatex
  :defer t
  :hook (org-mode-hook . turn-on-org-cdlatex))


(use-package eglot
  :defer
  t
  :custom
  (eglot-autoshutdown t)
  (eglot-extend-to-xref t)
  (eglot-sync-connect 1)
  (eglot-connect-timeout 60)
  (eglot-report-progress t)
  :bind (("C-c e" . eglot)
	 (:map eglot-mode-map
	       ("S-<f2>" . eglot-rename)
	       ("M-RET" . eglot-code-action-quickfix)
	       ("C-M-L" . eglot-format-buffer)
	       ("C-c f" . xref-find-definitions)
	       )
	 )
  :config   (setq-default eglot-workspace-configuration '(:tinymist (:formatterMode "typstyle")))

  
  )

(use-package which-key
  :defer t
  :ensure t
  )

(use-package kotlin-ts-mode
  :defer t
  :ensure t
  :after (eglot)
  :config
  (add-to-list 'eglot-server-programs
               '((kotlin-ts-mode kotlin-mode) . ("kotlin-lsp" "--stdio"))))



(use-package treemacs
  :ensure t
  :defer t
  :custom
  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t)
  (treemacs-fringe-indicator-mode t))

(use-package nerd-icons
  :ensure t
  :custom
  (nerd-icons-font-family "JetBrainsMono Nerd Font")
  )



(use-package treemacs-nerd-icons
  :after (treemacs nerd-icons)
  :ensure t
  :config (treemacs-load-theme "nerd-icons"))

(use-package nerd-icons-completion
  :after (nerd-icons)
  :ensure t
  :config
  (nerd-icons-completion-mode))

(use-package yascroll
  :ensure t
  :defer t
  :init (global-yascroll-bar-mode 1))

(use-package kotlin-ts-mode
  :ensure t
  :defer t
  :mode ("\\.kts?\\'" . kotlin-ts-mode))

(use-package shell-maker
  :ensure t
  :defer t)

(use-package acp
  :after (shell-maker)
  :ensure t
  :defer t
  :vc (:url "https://github.com/xenodium/acp.el"))

(use-package agent-shell
  :after (acp)
  :ensure t
  :defer t
  :vc (:url "https://github.com/xenodium/agent-shell"))


(use-package dired
  :config
  (setq dired-listing-switches
        "-l --almost-all --human-readable --group-directories-first --no-group")
  ;; this command is useful when you want to close the window of `dirvish-side'
  ;; automatically when opening a file
  (put 'dired-find-alternate-file 'disabled nil))

(use-package dirvish
  :init  (dirvish-override-dired-mode)
  :custom
  (dirvish-quick-access-entries
   '(
	 ("g" "~/Documents/guap-2/" "Guap notes")
	 ("l" "~/Documents/labs-2/" "Guap labs")
	 ))
  :config
  (setq dirvish-side-attributes
		'(vc-state nerd-icons collapse file-size))
  (setq dired-mouse-drag-files t)
  (setq mouse-drag-and-drop-region-cross-program t)
  (setq mouse-1-click-follows-link nil)
  :bind
  (("C-c f" . dirvish-side)
   :map dirvish-mode-map
   ("y"   . dirvish-yank-menu)
   ("TAB" . dirvish-subtree-toggle)
   ("<mouse-1>" . dirvish-subtree-toggle-or-open))
  )

(use-package project
  :bind (:map project-prefix-map
			  ("f" . dirvish-side))
  )


(use-package dashboard
  :ensure t
  :custom (dashboard-banner-logo-title nil)
  (dashboard-items '((projects  . 5)
					 (recents . 5)))
  (dashboard-center-content t)
  (dashboard-display-icons-p t)
  (dashboard-icon-type 'nerd-icons)
  (dashboard-set-heading-icons t)
  (dashboard-icon-file-v-adjust -0.1)
  (dashboard-heading-icon-v-adjust -0.05)

  (dashboard-item-shortcuts '((recents   . "r")
                                 (bookmarks . "m")
                                 (projects  . "g")
                                 (agenda    . "a")
                                 (registers . "e")))
  :bind (:map dashboard-mode-map
			  ("n" . dashboard-next-line)
			  ("p" . dashboard-previous-line)
			  )
  :init
  (dashboard-setup-startup-hook))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "JetBrainsMono Nerd Font" :foundry "JB" :slant normal :weight regular :height 128 :width normal)))))

