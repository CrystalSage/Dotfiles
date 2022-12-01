(package! screenshot
		  :recipe (:host github :repo "tecosaur/screenshot" :build (:not compile)))

(unpin! org-roam)
(package! org-roam-ui)
(package! vue-mode)
(package! lsp-tailwindcss :recipe (:host github :repo "merrickluo/lsp-tailwindcss"))
(package! mindre-theme :recipe (:host github :repo "erikbackman/mindre-theme"))
(package! inkpot-theme)
(package! gruber-darker-theme)
