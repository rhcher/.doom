;; -*- no-byte-compile: t; -*-
;;; private/my-cc/packages.el

(package! ccls)
(package! clang-format)
(package! cmake-mode :recipe (:host github :repo "emacsmirror/cmake-mode" :files (:defaults "*")))
(package! modern-cpp-font-lock)
