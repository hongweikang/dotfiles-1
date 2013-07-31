(add-to-list 'load-path "~/.emacs.d/")
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(case-fold-search t)
 '(current-language-environment "UTF-8")
 '(default-input-method "rfc1345")
 '(global-font-lock-mode t nil (font-lock))
 '(gud-gdb-command-name "gdb --annotate=1")
 '(inhibit-splash-screen t)
 '(large-file-warning-threshold nil)
 '(show-paren-mode t nil (paren))
 '(transient-mark-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(flymake-errline ((((class color)) (:slant italic)))))

;; python

;; (setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
;; (setq interpreter-mode-alist (cons '("python" . python-mode)
;;                    interpreter-mode-alist))
;; (autoload 'python-mode "python-mode" "Python editing mode." t)
;; (add-hook 'python-mode-hook 'turn-on-font-lock t)

;; c++
(add-hook 'c-mode-hook  'turn-on-font-lock t)
(add-hook 'c++-mode-hook 'turn-on-font-lock t)
(setq c-basic-offset 4)
(autoload 'c++-mode  "cc-mode" "C++ Editing Mode" t)
(autoload 'c-mode    "cc-mode" "C Editing Mode" t)
(autoload 'objc-mode "cc-mode" "Objective-C Editing Mode" t)
(autoload 'java-mode "cc-mode" "Java Editing Mode" t)
(require 'cc-mode)


(require 'yaml-mode)
(setq auto-mode-alist
  (append
    '(("\\.C$"    . c++-mode)
      ("\\.H$"    . c++-mode)
      ("\\.cc$"   . c++-mode)
      ("\\.cch$"   . c++-mode)
      ("\\.cpp$"   . c++-mode)
      ("\\.hh$"   . c++-mode)
      ("\\.c$"    . c-mode)
      ("\\.h$"    . c++-mode)
      ("\\.m$"    . objc-mode)
      ("\\.java$" . java-mode)
      ("\\.py$" . python-mode)
      ("\\.yml$" . yaml-mode)
      ("\\.yaml$" . yaml-mode)
     ) auto-mode-alist))



;; key bindings
(global-set-key "\M-g" 'goto-line)
(global-set-key "\M-r" 'replace-string)
(global-set-key (kbd "C-x C-\\") 'comment-region)
(global-set-key (kbd "C-x M-\\") 'uncomment-region)



;; no tabs
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)

(setq column-number-mode t)
(setq line-number-mode 1)
(setq line-number-display-limit 1000000)
(setq line-number-display-limit-width 1000000)

;; Delete trailing whitespaces
;;(add-hook 'write-file-hooks 'delete-trailing-whitespace)
;;(setq require-final-newline t)
(setq require-final-newline nil)

(load "hilit19")

;;(set-face-foreground 'font-lock-comment-face "red")
;;(set-face-foreground 'font-lock-comment-delimiter-face "red")

;; (require 'color-theme)
;; (color-theme-initialize)
;; (color-theme-clarity)

(require 'color-theme)
(color-theme-initialize)
(color-theme-twilight)

;;show trailing whitespace
(setq-default show-trailing-whitespace t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)