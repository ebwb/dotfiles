;; kill some shortcuts
(global-unset-key (kbd "s-w")) ;; too often, i close a window on accident ('cmd+w')

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
 '(custom-enabled-themes nil)
; '(fancy-splash-image "~/Documents/kitchensink.png")
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
   '(flycheck-clj-kondo rainbow-delimiters use-package markdown-mode which-key cider company clojure-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cider-test-failure-face ((t (:background "salmon")))))
