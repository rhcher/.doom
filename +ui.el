;;; private/my/+ui.el -*- lexical-binding: t; -*-

(setq
 doom-font (font-spec :family "JetBrainsMono NF" :size 20)
 doom-variable-pitch-font (font-spec :family "JetBrainsMono NF")
 doom-unicode-font (font-spec :family "JetBrainsMono NF")
 )
(setq doom-big-font (font-spec :family "JetBrainsMono NF" :size 23))
(remove-hook 'doom-init-ui-hook #'blink-cursor-mode)

;; (setq doom-theme 'doom-nord)
