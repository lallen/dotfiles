
;; Slight Doom

(defvar last-file-name-handler-alist file-name-handler-alist)
(setq gc-cons-threshold 402653184
      gc-cons-percentage 0.6
      file-name-handler-alist nil)


;; My emacs config

;; Basic Settings

(setq inhibit-startup-message t)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(menu-bar-mode -1)
(setq visible-bell 1)
(setq create-lockfiles nil)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)

;; Fixing Save files
(setq backup-directory-alist `(("." . "~/.saves")))

;; (setq gc-cons-threshold most-positive-fixnum)
;; (add-hook 'emacs-startup-hook (lambda ()
;;   (setq gc-cons-threshold (* 2 1024 1024))))

;; Themeing
(load-theme 'tango-dark)
(set-face-attribute 'default nil :font "Fira Code" :height 130)

;; Profile emacs startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "*** Loaded in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))


(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)


;; Projectile
(require 'projectile)
(projectile-mode 1)


;; Enable evil mode
(require 'evil)
(require 'evil-surround)
(require 'evil-escape)
(require 'evil-leader)
;(evil-leader/set-key "f" 'projectile-find-file)

(setq-default evil-escape-key-sequence "jk")

(evil-mode 1)
(evil-escape-mode 1)
(global-evil-surround-mode 1)

(global-evil-leader-mode 1)
(evil-leader/set-leader "<Space>")

;; Enable ivy
(require 'ivy)
(ivy-mode 1)

;; Enable Which key
(require 'which-key)
(which-key-mode 1)

;; Company mode
(add-hook 'after-init-hook 'global-company-mode 1)

;; Paredit For Lisps
;; (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
;; (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
;; (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
;; (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
;; (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
;; (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
;; (add-hook 'scheme-mode-hook           #'enable-paredit-mode)


;; Language Supports

;; R Language
(require 'ess)

;; No touch !
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(ess cider company paredit counsel evil leuven-theme magit which-key)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
