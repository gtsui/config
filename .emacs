;; Don't launch startup menu
(setq inhibit-startup-message t)

(scroll-bar-mode -1) ; Disable visible scrollbar
(tool-bar-mode -1) ; Disable toolbar
(tooltip-mode -1) ; Disable tooltips
(menu-bar-mode -1) ; Disable menu bar
(set-fringe-mode 10) 

;; Disable backup files, autosave, scratch buffer
(setq make-backup-files nil)
(setq auto-save-default nil)
(kill-buffer "*scratch*")

;; Display column number
(setq column-number-mode t)

;; Set Font Size
(set-face-attribute 'default nil :height 75)

;; Set Theme
(load-theme 'tango-dark)

;; Key bindings  
(global-set-key "\C-z" 'undo)
(global-set-key "\C-y" 'clipboard-yank)
(global-set-key "\M-w" 'clipboard-kill-ring-save)

;; Tab spacing
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq js-indent-level 2)
(setq-default c-basic-offset 2)

;; Recognize custom file extensions
(setq auto-mode-alist (cons '("\\.ipp$" . c++-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.ejs$" . html-mode) auto-mode-alist))

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

;; Show matching parentheses
(show-paren-mode 1)

;; Ivy
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

;; (use-package ivy-rich
;;   :init
;;   (ivy-rich-mode 1))

;; ;; Company
;; (use-package company
;;   :config
;;   (add-hook 'after-init-hook 'global-company-mode))

;; Solidity
;; M-x package-install [RET] solidity-mode
(setq solidity-solc-path "/home/tsuigeo/.config/truffle/compilers/node_modules/soljson-v0.5.16+commit.9c3226ce.js")
(require 'solidity-mode)

;; Solidity indentation
(add-hook 'solidity-mode-hook
          (lambda ()
            (setq c-basic-offset 2)
            (setq tab-width 2)))
