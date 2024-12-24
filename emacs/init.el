



(use-package company
  :ensure t
  :defer t
  :init (add-hook 'after-init-hook 'global-company-mode))

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)


(use-package telega
  :defer t
  :custom (telega-root-default-view-function 'telega-view-two-lines)
  :commands (telega)
  )


(use-package catppuccin-theme
  :ensure t
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

(use-package yasnippet
  :ensure t
  :defer t
  :init (yas-global-mode 1))

(use-package yasnippet-snippets
  :ensure t
  :defer t
  :after yasnippet)

(use-package cdlatex
  :ensure t)

(use-package org
  :after cdlatex
  :defer t
  :hook (org-mode-hook . turn-on-org-cdlatex))


(use-package eglot
  :defer t
  :bind (("C-c e" . eglot)
	 (:map eglot-mode-map
	       ("S-<f2>" . eglot-rename)
	       ("M-RET" . eglot-code-action-quickfix)
	       ("C-M-L" . eglot-format-buffer)
	       ("C-c f" . xref-find-definitions)
	       )
	 )
  )

(use-package which-key
  :defer t
  :ensure t
  )

(use-package octave
  :defer t
  :custom (auto-mode-alist (cons '("\\.m$" . octave-mode) auto-mode-alist))
  :hook (octave-mode-hook . (lambda ()
            (abbrev-mode 1)
            (auto-fill-mode 1)
            (if (eq window-system 'x)
                (font-lock-mode 1))))
 )


(use-package engrave-faces
  :ensure t
  :defer t
  :config (setq engrave-faces-preset-styles (engrave-faces-generate-preset)
	       )
  )

(use-package org
  :defer t
  :custom (org-latex-default-figure-position "H")
  (org-export-default-language "ru")
  
  (org-latex-default-packages-alist
   '(("AUTO" "inputenc" t
      ("pdflatex"))
     ("T2A" "fontenc" t
      ("pdflatex"))
     ("" "fontspec" t
      ("xelatex"))
     ("" "graphicx" t nil)
     ("" "longtable" nil nil)
     ("" "wrapfig" nil nil)
     ("" "rotating" nil nil)
     ("normalem" "ulem" t nil)
     ("" "amsmath" t nil)
     ("" "amssymb" t nil)
     ("" "capt-of" nil nil)
     ("" "hyperref" nil nil)))
  )


(use-package ox-gost
  :after (org engrave-faces)
  :load-path "./ox-gost"
  :custom (org-gost-education-organization "ГУАП")
  (org-gost-department "КАФЕДРА №1")
  (org-gost-teacher-position "старший преподаватель")
  (org-gost-city "Санкт-Петербург")
  (org-gost-group "М412")
)



(setq custom-file "~/.config/emacs/custom.el")
(load custom-file)
(put 'upcase-region 'disabled nil)
