(setq doom-font (font-spec :family "JetBrains Mono" :size 19 :weight 'Medium)
      doom-variable-pitch-font (font-spec :family "Raleway" :size 13))
(setq doom-theme 'doom-gruvbox)

(setq org-directory "~/org/")

(setq display-line-numbers-type t)
(global-set-key [f9] 'save-buffer)
(setq rustic-flycheck-clippy-params "--message-format=json")

(custom-set-faces!
  '(outline-1 :weight extra-bold :height 1.25)
  '(outline-2 :weight bold :height 1.15)
  '(outline-3 :weight bold :height 1.12)
  '(outline-4 :weight semi-bold :height 1.09)
  '(outline-5 :weight semi-bold :height 1.06)
  '(outline-6 :weight semi-bold :height 1.03)
  '(outline-8 :weight semi-bold)
  '(outline-9 :weight semi-bold))

(custom-set-faces!
  '(org-document-title :height 1.2))

(setq org-highlight-latex-and-related '(native script entities))
(require 'org-src)
(add-to-list 'org-src-block-faces '("latex" (:inherit default :extend t)))
(require 'ox)
(setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))

(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

(setq org-roam-directory "~/roam")
(use-package! lsp-tailwindcss)
