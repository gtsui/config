;; Don't launch startup menu
(setq inhibit-startup-message t)

;; Visible bell (mute alert sounds)
(setq visible-bell t)

(scroll-bar-mode -1) ; Disable visible scrollbar
(tool-bar-mode -1) ; Disable toolbar
(tooltip-mode -1) ; Disable tooltips
(menu-bar-mode -1) ; Disable menu bar

;; Disable backup files, autosave, scratch buffer
(setq make-backup-files nil)
(setq auto-save-default nil)
(kill-buffer "*scratch*")

;; Display column number
(setq column-number-mode t)

;; Set Font Size
(set-face-attribute 'default nil :height 125)

;; Set Transparency
(set-frame-parameter (selected-frame) 'alpha '(85 85))
(add-to-list 'default-frame-alist '(alpha 85 85))

;; Set Theme
(load-theme 'wombat)

;; Key bindings  
(global-set-key "\C-z" 'undo)
(global-set-key "\C-y" 'clipboard-yank)
(global-set-key "\M-w" 'clipboard-kill-ring-save)

;; Tab spacing
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq js-indent-level 2)
(setq-default c-basic-offset 2)

;; Show matching parentheses
(show-paren-mode 1)

;; Display line numbers
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; Recognize custom file extensions
(setq auto-mode-alist (cons '("\\.ipp$" . c++-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.ejs$" . html-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.ts$" . javascript-mode) auto-mode-alist))

;; Package repositories
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Install use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)


;; Ivy
;; M-x package-install [RET] ivy
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))
(ivy-mode 1)

(use-package swiper :ensure t)

;; (use-package ivy-rich
;;   :init
;;   (ivy-rich-mode 1))


;; doom-modeline
;; M-x package-install [RET] doom-modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))
(setq doom-modeline-height 5)


;; Company
;; M-x package-install [RET] company-mode
(use-package company
  :config
  (add-hook 'after-init-hook 'global-company-mode))

;; Solidity
;; M-x package-install [RET] solidity-mode
(setq solidity-solc-path "/usr/bin/solc")
(require 'solidity-mode)
(require 'company-solidity)

;; Solidity indentation
(add-hook 'solidity-mode-hook
          (lambda ()
            (setq c-basic-offset 2)
            (setq tab-width 2)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (elm-mode rust-mode swiper use-package ivy doom-modeline company-solidity))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Rust
;; M-x package-install [RET] rust-mode
(require 'rust-mode)
;; Rust indentation: Use spaces instead of tabs and only 2 spaces
(setq rust-indent-offset 2)

;; Elm
;; M-x package-install [RET] elm-mode
(require `elm-mode)
