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

;; rust-specific stuff
;(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
;(add-hook 'rust-mode-hook
;	  (lambda () (setq indent-tabs-mode nil)))
(add-hook 'rust-mode-hook 'cargo-minor-mode)
(add-hook 'rust-mode-hook #'lsp)
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

;; org-roam stuff
(use-package org-roam
  :custom
  (setq org-roam-v2-ack t)
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
	 ("C-c n i" . org-roam-node-insert)
	 ("C-c n a" . org-roam-alias-add)
	 ("C-c n t" . org-roam-tag-add)
	 ("C-c n r" . org-roam-ref-add))
  :config
  (org-roam-setup))
(setq org-roam-v2-ack t)

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
       ))

;; fun stuff
(defun shrug()
  "¯\\_(ツ)_/¯"
  (interactive)
  (insert (documentation 'shrug)))
(defun fthah ()
  ":facebookthingholdingaheart:"
  (interactive)
  (insert (documentation 'fthah)))
