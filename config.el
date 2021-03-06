;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "rhcher"
      user-mail-address "kaer41@qq.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (if (display-graphic-p) (load-theme 'spacemacs-dark t)
;;   (load-theme 'doom-one t)
;;   )
;; (custom-set-faces! '(default :background nil))
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(load! "+bindings")
(load! "+ui")
;; (require 'mouse)
;; (xterm-mouse-mode t)

;; (normal-erase-is-backspace-mode 1)

;; (custom-set-faces! '(default :background nil))

;; (setq doom-unicode-extra-fonts nil)

(remove-hook 'doom-first-buffer-hook #'global-flycheck-mode)

;; (add-to-list 'initial-frame-alist '(fullscreen . maximized))
;; (add-hook 'window-setup-hook #'toggle-frame-maximized)
(add-hook 'window-setup-hook #'toggle-frame-fullscreen)

(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))
;; (global-set-key [delete] 'delete-char)
;; (setq display-line-numbers-type nil)
;; (setq-default line-spacing 0.1)

(setq auto-save-default nil)
(setq blink-paren-function nil)
(setq scroll-margin 2)
(setq-default truncate-lines t)
(setq display-line-numbers-grow-only t)

(after! evil-escape
  :config
  (setq-default evil-escape-key-sequence "jj")
  (setq-default evil-escape-delay 0.35))

(after! vterm
  :config
  (setq vterm-term-environment-variable "xterm-24bit"))

(use-package! avy
  :commands (avy-goto-char-timer)
  :init
  (setq avy-timeout-seconds 0.2)
  (setq avy-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l ?q ?w ?e ?r ?u ?i ?o ?p)))

(after! company
  (setq company-minimum-prefix-length 2
        company-show-numbers nil
        company-idle-delay 0.5
        company-global-modes '(not comint-mode erc-mode message-mode help-mode gud-mode eshell-mode))
  (setq-default history-length 100)
  (setq-default prescient-history-length 100))

(after! company-box
  :config
  (setq company-box-scrollbar nil
        company-box-tooltip-maximum-width 100))

(set-lookup-handlers! 'emacs-lisp-mode :documentation #'helpful-at-point)

(use-package! evil-nerd-commenter
  :commands (evilnc-comment-or-uncomment-lines))

(after! evil-snipe
  (setq evil-snipe-scope 'buffer))

(after! flycheck
  ;; (setq flycheck-check-syntax-automatically '(save mode-enabled))
  ;; :init (global-flycheck-mode nil)
  :config
  (setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))
  (setq flycheck-global-modes nil))

(use-package! lsp-mode
  :commands lsp
  :config
  (setq lsp-auto-guess-root t)
  (setq lsp-signature-render-documentation nil)
  (setq lsp-eldoc-enable-hover t)
  (setq lsp-eldoc-render-all nil)
  (setq lsp-enable-links t)
  (setq lsp-hover-enabled t)
  (setq lsp-prefer-flymake nil)
  (setq lsp-enable-file-watchers nil)
  (setq lsp-keep-workspace-alive nil)
  (setq lsp-semantic-tokens-enable t)
  (setq lsp-enable-on-type-formatting nil)
  (setq lsp-imenu-detailed-outline nil)
  (setq lsp-imenu-sort-methods '(position kind name))
  (setq lsp-headerline-breadcrumb-enable nil)
  (setq lsp-idle-delay 0.1)
  (setq lsp-log-io nil)
  (setq lsp-diagnostics-provider :none)
  (setq lsp-signature-auto-activate t)
  (setq lsp-completion-filter-on-incomplete t)
  (setq lsp-completion-sort-initial-results nil)
  (setq lsp-completion-use-last-result t)

  (add-hook 'evil-insert-state-entry-hook (lambda () (setq-local lsp-hover-enabled nil)))
  (add-hook 'evil-insert-state-exit-hook (lambda () (setq-local lsp-hover-enabled t))))

(use-package! lsp-ui
  :commands lsp-ui-mode
  :config
  (setq
   lsp-ui-sideline-enable nil
   lsp-ui-sideline-ignore-duplicate t
   lsp-ui-sideline-show-hover t
   lsp-ui-sideline-show-symbol t
   lsp-ui-doc-header nil
   lsp-ui-doc-include-signature nil
   lsp-ui-doc-background (doom-color 'base4)
   lsp-ui-doc-border (doom-color 'fg)

   lsp-ui-peek-force-fontify nil
   lsp-ui-peek-expand-function (lambda (xs) (mapcar #'car xs)))
  (setq lsp-ui-imenu-ov t)

  (custom-set-faces
   '(ccls-sem-global-variable-face ((t (:underline t :weight extra-bold))))
   '(lsp-face-highlight-read ((t (:background "sea green"))))
   '(lsp-face-highlight-write ((t (:background "brown4"))))
   '(lsp-ui-sideline-current-symbol ((t (:foreground "grey38" :box nil))))
   '(lsp-ui-sideline-symbol ((t (:foreground "grey30" :box nil)))))

  (map! :after lsp-ui-peek
        :map lsp-ui-peek-mode-map
        "h" #'lsp-ui-peek--select-prev-file
        "j" #'lsp-ui-peek--select-next
        "k" #'lsp-ui-peek--select-prev
        "l" #'lsp-ui-peek--select-next-file)

  (defhydra hydra/ref (evil-normal-state-map "x")
    "reference"
    ("p" (-let [(i . n) (lsp-ui-find-prev-reference)]
           (if (> n 0) (message "%d/%d" i n))) "prev")
    ("n" (-let [(i . n) (lsp-ui-find-next-reference)]
           (if (> n 0) (message "%d/%d" i n))) "next")
    ("R" (-let [(i . n) (lsp-ui-find-prev-reference '(:role 8))]
           (if (> n 0) (message "read %d/%d" i n))) "prev read" :bind nil)
    ("r" (-let [(i . n) (lsp-ui-find-next-reference '(:role 8))]
           (if (> n 0) (message "read %d/%d" i n))) "next read" :bind nil)
    ("W" (-let [(i . n) (lsp-ui-find-prev-reference '(:role 16))]
           (if (> n 0) (message "write %d/%d" i n))) "prev write" :bind nil)
    ("w" (-let [(i . n) (lsp-ui-find-next-reference '(:role 16))]
           (if (> n 0) (message "write %d/%d" i n))) "next write" :bind nil)))

(defun +advice/xref-set-jump (&rest args)
  (require 'lsp-ui)
  (lsp-ui-peek--with-evil-jumps (evil-set-jump)))
(advice-add '+lookup/definition :before #'+advice/xref-set-jump)
(advice-add '+lookup/references :before #'+advice/xref-set-jump)


(defvar +my/xref-blacklist nil
  "List of paths that should not enable xref-find-* or dumb-jump-go")

(after! xref
  ;; This is required to make `xref-find-references' not give a prompt.
  ;; `xref-find-references' asks the identifier (which has no text property)
  ;; and then passes it to `lsp-mode', which requires the text property at
  ;; point to locate the references.
  ;; https://debbugs.gnu.org/cgi/bugreport.cgi?bug=29619
  (setq xref-prompt-for-identifier '(not xref-find-definitions
                                         xref-find-definitions-other-window
                                         xref-find-definitions-other-frame
                                         xref-find-references)))

(after! ivy-xref
  (push '(ivy-xref-show-xrefs . nil) ivy-sort-functions-alist))

(use-package! rust-mode
  :mode "\\*.rs$"
  :config
  (map! :map rust-mode-map
        :leader
        :n "=" #'rust-format-buffer))

(use-package! lsp-rust
  :defer t
  :init (add-hook 'rust-mode-hook #'lsp-rust-enable)
  :config)

(after! projectile
  (setq compilation-read-command nil) ; no prompt in projectile-compile-project)
  ;; . -> Build
  (projectile-register-project-type 'cmake '("CMakeLists.txt")
                                    :configure "cmake -H. -Bbuild -DCMAKE_EXPORT_COMPILER_COMMANDS=on"
                                    :compile "cmake --build build"
                                    :test "ctest")
  (add-to-list 'projectile-globally-ignored-directories ".ccls-cache"))

(after! counsel-projectile
  (ivy-add-actions
   'counsel-projectile-switch-project
   `(("b" counsel-projectile-switch-project-action-switch-to-buffer
      "jump to a project buffer")
     ("s" counsel-projectile-switch-project-action-save-all-buffers
      "save all project buffers")
     ("k" counsel-projectile-switch-project-action-kill-buffers
      "kill all project buffers")
     ("c" counsel-projectile-switch-project-action-compile
      "run project compilation command")
     ("e" counsel-projectile-switch-project-action-edit-dir-locals
      "edit project dir-locals")
     ("v" counsel-projectile-switch-project-action-vc
      "open project in vc-dir / magit / monky")
     ("xe" counsel-projectile-switch-project-action-run-eshell
      "invoke eshell from project root")
     ("xt" counsel-projectile-switch-project-action-run-term
      "invoke term from project root")
     ("_" counsel-projectile-switch-project-action-org-capture
      "org-capture into project"))))

(use-package! smartparens
  :defer t
  :config
  (setq sp-autoinsert-pair t
        sp-autodelete-pair t
        sp-escape-quotes-after-insert t)
  (setq-default sp-autoskip-closing-pair t))

(use-package! rmsbolt
  :defer t
  :after (cc-mode)
  :config
  (setq rmsbolt-asm-format "att")
  (set-popup-rules! '(("^\\*rmsbolt-output\\*$" :size 0.5 :side right))))

;; (setq yas-triggers-in-field t)

;; (use-package! elpy
;;   :defer t
;;   :after (python-mode)
;;   :init
;;   (elpy-enable)
;;   :config
;;   (setq python-indent-offset 4)
;;   )

;; (use-package evil-terminal-cursor-changer
;;   :defer t
;;   :config
;;   (unless (display-graphic-p)
;;     (require 'evil-terminal-cursor-changer)
;;     (evil-terminal-cursor-changer-activate)
;;     )
;;   (setq evil-motion-state-cursor 'box)
;;   (setq evil-visual-state-cursor 'box)
;;   (setq evil-normal-state-cursor 'box)
;;   (setq evil-insert-state-cursor 'bar)
;;   (setq evil-replace-state-cursor 'bar)
;;   (setq evil-emacs-state-cursor 'box)
;;   )

;; (after! python-mode
;;   :config
;;   (yas-minor-mode -1)
;;   )

(use-package! lsp-treemacs :defer t)

(use-package! flycheck-clang-tidy
  :defer t
  :hook (flycheck-mode . flycheck-clang-tidy-setup)
  :config
  (setq flycheck-clang-tidy-extra-options "--checks=-*,clang-analyzer-*,cppcoreguidelines-*,-cppcoreguidelines-avoid-non-const-global-variables,-cppcoreguidelines-special-member-functions,-cppcoreguidelines-avoid-magic-numbers,-cppcoreguidelines-pro-type-vararg,modernize-*,-modernize-use-trailing-return-type"))

(set-popup-rules! '(
                    ("^\\*helpful" :size 0.4)
                    ("^\\*info.*" :size 80 :size right)
                    ("^\\*Man.*" :size 80 :size right)))

(use-package! yasnippet
  :config
  (setq yas-triggers-in-field t)
  (setq yas-inhibit-overlay-modification-protection t)
  (map! :map yas-keymap "<backspace>" nil))

(after! lispy
  (setq lispy-outline "^;; \\(?:;[^#]\\|\\*+\\)"
        lispy-outline-header ";; "
        lispy-ignore-whitespace t)
  (map! :map lispy-mode-map
        :i "C-c (" #'lispy-wrap-round
        :i "_" #'special-lispy-different
        "d" nil
        :i [remap delete-backward-char] #'lispy-delete-backward))

(after! lispyville
  (map! :map lispyville-mode-map
        :i "C-w" #'backward-delete-char
        :n "M-j" nil
        :n "H" #'sp-backward-sexp
        :n "L" #'sp-forward-sexp))

(map! :after elisp-mode
      :map emacs-lisp-mode-map
      :n "gh" #'helpful-at-point
      :n "gl" (lambda! (let (lispy-ignore-whitespace) (call-interactively #'lispyville-right)))
      :n "C-<left>" #'lispy-forward-barf-sexp
      :n "C-<right>" #'lispy-forward-slurp-sexp
      :n "C-M-<left>" #'lispy-backward-slurp-sexp
      :n "C-M-<right>" #'lispy-backward-barf-sexp
      :i "C-w" #'delete-backward-char
      :n "<tab>" #'lispyville-prettify
      :localleader
      :n "x" (lambda! (save-excursion (forward-sexp) (eval-last-sexp nil))))

(after! pyim
  (setq pyim-page-tooltip 'posframe)
  (setq-default pyim-punctuation-half-width-functions '(pyim-probe-punctuation-after-punctuation)))

(use-package! pdf-continuous-scroll-mode
  :defer t)

(use-package! pdf
  :hook (pdf-view-mode . pdf-view-midnight-minor-mode)
  :init
  (add-hook 'pdf-view-mode #'pdf-continuous-scroll-mode)
  :config
  (setq pdf-view-continuous t))

(map! :after pdf-continuous-scroll-mode
      :map pdf-continuous-scroll-mode-map
      :n "j" #'pdf-continuous-scroll-forward
      :n "k" #'pdf-continuous-scroll-backward)

;; TODO workaround emacsclient -nw a.cc
(advice-add #'+doom-dashboard|make-frame :override #'ignore)
