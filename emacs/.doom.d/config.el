;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Helder Burato Berto"
  user-mail-address "helder.burato@gmail.com")

;; Set default to maximize frame when starts
(add-to-list 'default-frame-alist '(fullscreen . maximized))

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
(setq doom-font (font-spec :family "Hack" :size 14))
(setq doom-big-font (font-spec :family "Hack" :size 18))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dracula)

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

;; It is used to Magit Forge
(setq auth-sources '("~/.authinfo"))

(after! ivy
  :config
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)

  ;; enable this if you want `swiper' to use it
  (setq search-default-mode #'char-fold-to-regexp)
  (setq ivy-re-builders-alist
    '((swiper . ivy--regex-plus)
       (counsel-rg . ivy--regex-plus)
       (t      . ivy--regex-fuzzy))))

(after! deft
  :defer t
  :config
  (setq deft-directory org-directory)
  (setq deft-extensions '("org" "md" "txt"))
  (setq deft-default-extension "org")
  (setq deft-recursive t)
  (setq deft-use-filename-as-title nil)
  (setq deft-use-filter-string-for-filename t)
  (setq deft-file-naming-rules '((nospace . "-"))))

(after! doom-modeline
  :config
  (setq doom-modeline-continuous-word-count-modes
    '(markdown-mode gfm-mod)))

(defun maybe-use-prettier ()
  "Enable prettier-js-mode if .prettierrc or .prettierrc.json or .prettierrc.js file is located."
  (if (or (locate-dominating-file default-directory ".prettierrc")
       (or (locate-dominating-file default-directory ".prettierrc.json"))
       (or (locate-dominating-file default-directory ".prettierrc.js")))
        (prettier-js-mode +1)))

(use-package! prettier-js)
(after! prettier-js
  :config
  (setq! prettier-js-args '(
                             "--trailing-comma" "all"
                             "--bracket-spacing" "true"
                             )))
(add-hook! '(
              js2-mode-hook
              rjsx-mode-hook
              web-mode-hook
              typescript-mode-hook
              typescript-tsx-mode-hook) 'maybe-use-prettier)

