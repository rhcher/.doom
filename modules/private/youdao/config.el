;;; private/youdao/config.el -*- lexical-binding: t; -*-

(use-package! youdao-dictionary
  :defer t
  :config
  (map!
   :leader
   :prefix("h" . "help")
   :desc "Lookup Dictionary" :n "y" #'youdao-dictionary-search-at-point-posframe
   )
  )
