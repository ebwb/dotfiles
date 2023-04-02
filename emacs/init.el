;; general programming
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; clojure-specific stuff
(require 'flycheck-clj-kondo)
(add-hook 'clojure-mode-hook #'show-paren-mode)

;; company auto-complete for cider
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)
(add-hook 'clojure-mode-hook #'flycheck-mode)
(add-hook 'clojure-mode-hook #'cider-mode)

;; perl stuff
;; Use cperl-mode instead of the default perl-mode
(add-to-list 'auto-mode-alist '("\\.\\([pP][Llm]\\|al\\)\\'" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl5" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))

(add-hook 'cperl-mode-hook 'n-cperl-mode-hook t)
(defun n-cperl-mode-hook ()
  (setq cperl-indent-level 4)
  (setq cperl-continued-statement-offset 0)
  (setq cperl-extra-newline-before-brace t)
  )

;; rust-specific stuff
;(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
;(add-hook 'rust-mode-hook
;	  (lambda () (setq indent-tabs-mode nil)))
(add-hook 'rust-mode-hook 'cargo-minor-mode)
(add-hook 'rust-mode-hook #'lsp)
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

;; org-roam stuff
(use-package org-roam
  ;;:custom
;;  (setq org-roam-v2-ack t)
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
	 ("C-c n i" . org-roam-node-insert)
	 ("C-c n a" . org-roam-alias-add)
	 ("C-c n t" . org-roam-tag-add)
	 ("C-c n r" . org-roam-ref-add))
  :config
  (org-roam-setup))
  ;;(setq org-roam-v2-ack t))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; load system-specific configurations
;; if these get big enough, I'll put them into their own files
(cond ((eq system-type 'gnu/linux)
       (load-file "configs/gnu-linux.el"
       )
       ((eq system-type 'darwin)
	(load-file "configs/mac.el")
       )
      ((eq system-type 'windows-nt)
       (load-file "configs/win-nt.el")
       )))

;; fun stuff
(defun shrug()
  "¯\\_(ツ)_/¯"
  (interactive)
  (insert (documentation 'shrug)))
(defun fthah ()
  ":facebookthingholdingaheart:"
  (interactive)
  (insert (documentation 'fthah)))

;; org stuff
(defun org-insert-example()
  (interactive)
  (insert "\n#+BEGIN_EXAMPLE\n\n")
  (insert "#+END_EXAMPLE\n")
  (backward-char 15))

(defun org-insert-quote()
  (interactive)
  (insert "\n#+BEGIN_QUOTE\n\n")
  (insert "#+END_QUOTE\n")
  (backward-char 13))

;; TODO let me pick a lanauge to insert a code block for
(defun org-insert-src()
  (interactive)
  (insert "\n#+BEGIN_SRC \n")
  (insert "#+END_SRC\n")
  (backward-char 11))

(use-package org-mode
  :bind (("C-c i e" . org-insert-example)
	 ("C-c i s" . org-insert-src)
	 ("C-c i q" . org-isnert-quote)
	 ("C-c i r" . org-clock-report))
  :config)

;; my emacs ergonomics
(global-unset-key (kbd "s-w")) ;; too often, i close a window on accident ('cmd+w')

;; I use windows a lot, so I want an easier way to execute `C-u -1 C-x o`
(defun other-window-prev ()
  (interactive nil)
  (other-window -1))
(global-set-key "\C-co" 'other-window-prev)

;; sometimes I want to switch which one's on which side, e.g. when I
;; have zoom open just to the left of emacs, but the notes are all the
;; way on the right window
(global-set-key"\C-cwp" 'window-swap-states)

;; in 2022 I started using some new 4k monitors, and suddenly the text
;; was too small!
(set-face-attribute 'default nil :height 140)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(cider-edit-jack-in-command t)
 '(custom-enabled-themes '(wheatgrass))
 '(frame-background-mode nil)
 '(org-babel-clojure-backend 'cider)
 '(org-default-notes-file "~/Documents/notes/org-roam/.notes")
 '(org-directory "~/Documents/notes/")
 '(org-roam-directory "~/Documents/notes/org-roam/")
 '(org-roam-mode-section-functions
   '(org-roam-backlinks-section org-roam-reflinks-section org-roam-unlinked-references-section))
 '(package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/")
     ("melpa stable" . "https://stable.melpa.org/packages/")))
 '(package-selected-packages
   '(lsp-metals scala-mode magit flycheck-clj-kondo rainbow-delimiters use-package markdown-mode which-key cider company clojure-mode))
 '(sql-port 2484)
 '(tool-bar-mode nil)
 '(which-key-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cider-test-failure-face ((t (:background "salmon"))))
 '(cperl-array-face ((t (:background "black" :foreground "LightGoldenrod1" :weight bold))))
 '(cperl-hash-face ((t (:background "black" :foreground "salmon1" :slant italic :weight bold)))))
