;; linux-specific code, but really just assuming Ubuntu running on WSL
(defun wsl-copy-region-to-clipboard (start end)
 "Copy region to Windows clipboard."
 (interactive "r")
 (call-process-region start end "clip.exe" nil 0))
      (defun wsl-clipboard-to-string ()
 "Return Windows clipboard as string."
 (let ((coding-system-for-read 'dos))
   ; remove added trailing \n
   (substring
    (shell-command-to-string
     "powershell.exe -Command Get-Clipboard") 0 -1)))
      (defun wsl-paste-from-clipboard (arg)
 "Insert Windows clipboard at point. With prefix ARG, also add to kill-ring"
 (interactive "P")
 (let ((clip (wsl-clipboard-to-string)))
   (insert clip)
   (if arg (kill-new clip))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(frame-background-mode (quote dark))
 '(org-default-notes-file "~/notes/.notes")
 '(org-roam-directory "/home/ebwb/notes/")
 '(org-roam-mode-section-functions
   (quote
    (org-roam-backlinks-section org-roam-reflinks-section org-roam-unlinked-references-section)))
 '(package-archives
   (quote
    (("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/")
     ("melpa stable" . "https://stable.melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (rustic org-roam use-package paredit eglot eldoc rust-mode company cider clojure-mode lsp-mode flycheck-rust)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
)
