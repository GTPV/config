(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(verilog-mode evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Set Vim mode
(require 'evil)
(evil-mode 0)

;; Set Smooth scrolling mode
(require 'smooth-scroll)
(smooth-scroll-mode t)

(global-font-lock-mode 1)

;; Show line number
(global-display-line-numbers-mode)

;; Tab settings
(setq-default tab-width 8)
(setq-default indent-tabs-mode nil)
(setq indent-line-function 'insert-tab)

;; Disable backup, auto-save
(setq make-backup-files nil)
(setq auto-save-default nil)

;;(setq mac-command-modifier 'meta)
;;(setq mac-option-modifier 'none)
;;(setq mac-command-key-is-meta t)
;;(setq mac-option-key-is-meta nil)

;; Misc settings
(setq auto-revert-interval 0.05)
(xterm-mouse-mode t)
;;(setq scroll-step 1
      ;;scroll-conservatively 100000)

;; Verilog mode settings
(setq verilog-indent-level 4)

;; Key bindings
(global-set-key (kbd "C-x d") 'dired)
