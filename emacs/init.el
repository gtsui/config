;; Don't launch startup menu
(setq inhibit-startup-message t)

;; Visible bell (mute alert sounds)
(setq visible-bell t)

(scroll-bar-mode -1) ; Disable visible scrollbar
(tool-bar-mode -1) ; Disable toolbar
(tooltip-mode -1) ; Disable tooltip
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
;; Be careful of the 't' parameter as loading custom themes can be dangerous
(load-theme 'doom-outrun-electric t)

;; Key bindings  
(global-set-key "\C-z" 'undo)
(global-set-key "\C-y" 'clipboard-yank)
(global-set-key "\M-w" 'clipboard-kill-ring-save)

;; tab-bar customizations
(tab-bar-mode 1)
(global-set-key (kbd "C-M-j") `tab-bar-switch-to-prev-tab)
(global-set-key (kbd "C-M-l") `tab-bar-switch-to-next-tab)
(global-set-key (kbd "C-x t") `(lambda () (interactive) (tab-bar-new-tab-to -1)))
(global-set-key (kbd "C-x w") `tab-close)
(setq tab-bar-close-button-show nil
      tab-bar-new-button-show nil)
(set-face-attribute 'tab-bar-tab nil :inherit 'doom-modeline-panel :background nil :foreground nil)
(set-face-attribute 'tab-bar-tab-inactive nil :background "gray30" :foreground "white")
(set-face-attribute 'tab-bar nil :background "gray30")
(setq tab-bar-separator " | ")

;; Tab spacing
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq js-indent-level 2)
(setq-default c-basic-offset 2)

;; Show matching parentheses
(show-paren-mode 1)

;; Display line numbers
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(set-face-attribute 'line-number nil :foreground "grey70")

;; Recognize custom file extensions
(setq auto-mode-alist (cons '("\\.ipp$" . c++-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.ejs$" . html-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.ts$" . javascript-mode) auto-mode-alist))

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; ivy (for completion mechanism)
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
(set-face-attribute 'ivy-current-match nil :inherit 'doom-modeline-panel :background nil)


(use-package swiper :ensure t)

;; doom-modeline for more aesthetic mode line
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))


;; Run the following command manually so that mode line icons display correctly:
;; M-x all-the-icons-install-fonts
(use-package all-the-icons)

;; doom-themes for better emacs themes integration with plugins
;; doom-themes package not found for some reason. Install manually
;; with package-install-file and .tar file downloaded from MELPA
;;(use-package doom-themes)

;; rainbow-delimiters for easy visualization of delimiters
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;(use-package ivy-rich)
;(ivy-rich-mode 1)


;(use-package counsel
;  :bind (("M-x" . counsel-M-x)
;         ("C-x b" . counsel-ibuffer)
;         ("C-x C-f" . counsel-find-file)))
         

;; company-mode for autocompletion
(use-package company
  :config
  (add-hook 'after-init-hook 'global-company-mode))

;; solidity-mode
(setq solidity-solc-path "/usr/bin/solc")
(use-package solidity-mode)
(use-package 'company-solidity)
(add-hook 'solidity-mode-hook
          (lambda ()
            (setq c-basic-offset 2)
            (setq tab-width 2)))


;; rust-mode
(use-package rust-mode)
(setq rust-indent-offset 2)

;; elm-mode
(use-package elm-mode)




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("da53441eb1a2a6c50217ee685a850c259e9974a8fa60e899d393040b4b8cc922" default))
 '(package-selected-packages '(doom-themes use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
