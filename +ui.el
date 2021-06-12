;;; private/my/+ui.el -*- lexical-binding: t; -*-

(setq
 doom-font (font-spec :family "JetBrainsMono NF" :size 20)
 doom-variable-pitch-font (font-spec :family "Noto Serif")
 doom-unicode-font (font-spec :family "JetBrainsMono NF")
 )
(setq doom-big-font (font-spec :family "JetBrainsMono NF" :size 23))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ccls-sem-global-variable-face ((t (:underline t :weight extra-bold))))
 '(ccls-tree-header-line-face ((t (:foreground "grey" :height 0.8))))
 '(ccls-tree-icon-face ((t (:foreground "grey" :width expanded))))
 '(lsp-face-highlight-read ((t (:background "sea green"))))
 '(lsp-face-highlight-write ((t (:background "brown4"))))
 '(lsp-ui-peek-filename ((t (:inherit mode-line-buffer-id :background "peachpuff" :foreground "black"))))
 '(lsp-ui-peek-footer ((t (:inherit lsp-ui-peek-header :background "light slate gray" :foreground "black"))))
 '(lsp-ui-peek-header ((t (:background "lightslategray" :foreground "black" :weight bold))))
 '(lsp-ui-peek-highlight ((t (:inherit lsp-ui-peek-header :background "goldenrod" :foreground "#282c34" :box 1))))
 '(lsp-ui-peek-peek ((t (:background "color-232"))))
 '(lsp-ui-peek-selection ((t (:background "#51afef" :foreground "#282c34" :weight bold))))
 '(lsp-ui-sideline-current-symbol ((t (:foreground "grey38" :box nil))))
 '(lsp-ui-sideline-symbol ((t (:foreground "grey30" :box nil))))
 '(vertical-border ((t (:background "#1b1b1b" :foreground "#1b1b1b" :overline "black")))))
;; (remove-hook 'doom-init-ui-hook #'blink-cursor-mode)

;; (setq doom-theme 'doom-nord)
