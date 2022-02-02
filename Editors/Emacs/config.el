(setq doom-font (font-spec :family "JetBrains Mono" :size 17 :weight 'Medium)
      doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-theme 'doom-tomorrow-night)

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
