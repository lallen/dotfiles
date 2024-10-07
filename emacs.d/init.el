

;; Slight Doom

;; Loads 
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                     ;("marmalade" . "http://marmalade-repo.org/packages/")
                     ("melpa" . "http://melpa.org/packages/")))

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
(setq visible-bell nil)
(setq ring-bell-function 'ignore)
(blink-cursor-mode 0)
(setq create-lockfiles nil)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)
(setq-default truncate-lines 1)
(show-paren-mode 1)
(defalias 'yes-or-no-p 'y-or-n-p)


;; Fixing Save files
(setq backup-directory-alist `(("." . "~/.saves")))

;; Themeing
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'dracula t)


;;(load-theme 'tango-dark)

(set-face-attribute 'default nil :font "DejaVu Sans Mono" :height 250)

;; Profile emacs startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "*** Loaded in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))


;; Skip packages on startup
(setq package-enable-at-startup nil)


(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

  (package-refresh-contents)
  (unless (package-installed-p 'use-package)
    (package-install 'use-package))
  (require 'use-package)
  (setf use-package-always-ensure t)

;; ;; EXWM
;; (require 'exwm)
;; ;; Set the initial workspace number.
;; (setq exwm-workspace-number 4)
;; ;; Make class name the buffer name.
;; (add-hook 'exwm-update-class-hook
;;   (lambda () (exwm-workspace-rename-buffer exwm-class-name)))
;; ;; Global keybindings.
;; (setq exwm-input-global-keys
;;       `(([?\s-r] . exwm-reset) ;; s-r: Reset (to line-mode).
;;         ([?\s-w] . exwm-workspace-switch) ;; s-w: Switch workspace.
;;         ([?\s-&] . (lambda (cmd) ;; s-&: Launch application.
;;                      (interactive (list (read-shell-command "$ ")))
;;                      (start-process-shell-command cmd nil cmd)))
;;         ;; s-N: Switch to certain workspace.
;;         ,@(mapcar (lambda (i)
;;                     `(,(kbd (format "s-%d" i)) .
;;                       (lambda ()
;;                         (interactive)
;;                         (exwm-workspace-switch-create ,i))))
;;                   (number-sequence 0 9))))
;; ;; Enable EXWM
;; (exwm-enable)

;; QOL

;; Which Key ?
(use-package which-key)

;; Golden Ratio
(use-package golden-ratio
  :ensure t
  :hook (after-init . golden-ratio-mode))


;; Ido
;; (require 'ido-completing-read+)

;; (ido-mode 1)
;; (ido-everywhere 1)
;; (ido-ubiquitous-mode 1)

;; Projectile
(projectile-mode +1)

;; Recommended keymap prefix on macOS
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)

;; Recommended keymap prefix on Windows/Linux
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; Magit
(use-package magit
  :bind (("C-x g" . magit-status)
         ))

;; Enable evil mode

;; Enable Evil

(use-package evil
  :config
  (evil-mode 1))

(use-package evil-surround
  :config
  (global-evil-surround-mode 1))

(use-package evil-escape
  :config
  (evil-escape-mode 1))

(use-package evil-leader
  :config
  (evil-leader-mode 1))

(setq-default evil-escape-key-sequence "jj")
(setq-default evil-escape-delay 0.1) ;; Adjust as needed
(evil-leader/set-leader "<Space>")
(global-evil-leader-mode 1)

;; Bind jj, kk, and kj to escape to normal mode
(define-key evil-insert-state-map (kbd "jk") 'evil-normal-state)
(define-key evil-insert-state-map (kbd "kk") 'evil-normal-state)
(define-key evil-insert-state-map (kbd "kj") 'evil-normal-state)


;; Keybindings
;; Binding for config 
(global-set-key (kbd "C-/") 'comment-or-uncomment-region)


(with-eval-after-load 'evil
(define-key evil-normal-state-map (kbd "SPC `") (lambda ()
                                                      (interactive)
                                                      (find-file "~/.emacs.d/init.el"))))

;; Keybindings for meta
(with-eval-after-load 'evil
(define-key evil-normal-state-map (kbd "SPC SPC") 'execute-extended-command))

;; Keybinding for Dired
(with-eval-after-load 'evil
(define-key evil-normal-state-map (kbd "SPC d") 'dired))

(with-eval-after-load 'evil-leader
  (evil-leader/set-key
    "bb" 'switch-to-buffer
    "bd" 'kill-buffer
    "bl" 'list-buffers
    "bs" 'save-buffer))

;; Keybinding for Evil mode (SPC q)
(with-eval-after-load 'evil
(define-key evil-normal-state-map (kbd "SPC q") 'kill-buffer-and-window))

;; Keybinding for non-Evil mode (C-q)
(global-set-key (kbd "C-q")'kill-buffer-and-window)

;; Treemacs
(use-package treemacs)
(define-key evil-normal-state-map (kbd "SPC e") 'treemacs)


;; Bind SPC m to open the Magit menu

(with-eval-after-load 'evil
(define-key evil-normal-state-map (kbd "SPC m") 'magit-dispatch))

(with-eval-after-load 'evil
(define-key evil-normal-state-map (kbd "SPC p") 'projectile-command-map))

;; Rotate buffers
(define-key evil-normal-state-map (kbd "SPC r") 'evil-rotate-upwards)  ;; Adjust or define this function as needed

;; Enlarge text (zoom in)
(define-key evil-normal-state-map (kbd "C-+") 'text-scale-increase)  ;; Ctrl + Plus
(define-key evil-normal-state-map (kbd "SPC +") 'text-scale-increase)  ;; Space + Plus

;; Reduce text (zoom out)
(define-key evil-normal-state-map (kbd "C--") 'text-scale-decrease)  ;; Ctrl + Minus
(define-key evil-normal-state-map (kbd "SPC -") 'text-scale-decrease)  ;; Space + Minus

;; Enable vertico
(use-package vertico
  :init
  (vertico-mode)
  )

(use-package vertico-posframe
  :custom
  (vertico-posframe-parameters
   '((left-fringe . 8)
     (right-fringe .8))))

(require 'vertico-posframe)
(vertico-posframe-mode 1)

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))


  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Emacs 28: Hide commands in M-x which do not work in the current mode.
  ;; Vertico commands are hidden in normal buffers.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Enable recursive minibuffers
  ;; (setq enable-recursive-minibuffers t))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package marginalia
  :ensure t
  :config
  (marginalia-mode))

;; Enable Which key
(use-package which-key
  :config
  (which-key-mode 1))

;; Language Supports


;; Flying and checking
(use-package flycheck)

;; General
(use-package rustic
  :config
  (setq rustic-lsp-server 'rust-analyzer)
  (use-package flycheck
    :hook (prog-mode . flycheck-mode))


  ;; (use-package company
;;     :hook (prog-mode . company-mode)
;;     :config (setq company-tooltip-align-annotations t)
    
;;     (setq company-minimum-prefix-length 1)
;; :bind
;;   (:map company-active-map
;; 	      ("C-n". company-select-next)
;; 	      ("C-p". company-select-previous)
;; 	      ("M-<". company-select-first)
;; 	      ("M->". company-select-last)
;; 	      ("<tab>" . company-complete-selection)
;; 	      )
;;     )

;; Svelte 
(use-package svelte-mode)
(use-package toml-mode)

;; Rust
(use-package rust-mode

  :hook (rust-mode . lsp))
(use-package cargo
  :hook (rust-mode . cargo-minor-mode))
(use-package flycheck-rust
  :config (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))


;; Go

(use-package go-mode)
(setenv "PATH" (concat "/usr/local/go/bin" (getenv "PATH")))




;; No touch !
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(svelte-mode lsp-clients eglot yasnippet flycheck rustic lsp-ui lsp-mode vertico ess cider company paredit counsel evil leuven-theme magit which-key)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(vertico-posframe golden-ratio projectile svelte-mode lsp-clients eglot yasnippet flycheck rustic lsp-ui lsp-mode vertico ess cider company paredit counsel evil leuven-theme magit which-key)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


