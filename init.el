(package-initialize)

;; This is only needed once, near the top of the file
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (add-to-list 'load-path "~/.emacs.d/lisp/")
  (require 'use-package))

(require 'init-packages)
(require 'init-utils)
(require 'init-elpa)
(require 'init-auto-complete)
;;(require 'init-markdown)
(require 'init-font)
(require 'init-tab)
(require 'go-autocomplete)
(require 'init-irony)
(provide 'init)

(setq make-backup-files nil)

;; show fullscreen

(defun my-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen 'fullboth) ;this makes the frame go fullscreen
  (tool-bar-mode -1) ;these 3 lines turn off GUI junk
  (scroll-bar-mode -1)
  (menu-bar-mode -1))

(defun my-non-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'width 82)
  (set-frame-parameter nil 'fullscreen 'fullheight)
  (menu-bar-mode t)) ;I don't turn tool-bar and scroll-bar back on b/c I never want them

(defun toggle-fullscreen ()
  (interactive)
  (if (eq (frame-parameter nil 'fullscreen) 'fullboth)  ;tests if already fullscreened
      (my-non-fullscreen)
    (my-fullscreen)))

(global-set-key (kbd "<f11>") 'toggle-fullscreen)

;; 显示行号
(global-linum-mode 1)

(yas-global-mode 1)


;; 更改光标的样式（不能生效，解决方案见第二集）
(setq cursor-type 'bar)

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (auto-complete-c-headers auto-complete-clang company-go auto-compile go-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Golang
(require 'go-mode)(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook '(lambda ()
  (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
(add-hook 'go-mode-hook '(lambda ()
  (local-set-key (kbd "C-c C-g") 'go-goto-imports)))
(add-hook 'go-mode-hook '(lambda ()
(local-set-key (kbd "C-c C-f") 'gofmt)))(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook '(lambda ()
  (local-set-key (kbd "C-c C-k") 'godoc)))
(add-hook 'go-mode-hook 'company-mode)(add-hook 'go-mode-hook (lambda ()  (set (make-local-variable 'company-backends) '(company-go))
  (company-mode)))
