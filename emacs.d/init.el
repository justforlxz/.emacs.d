(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'init-packages)
(require 'init-utils)
(require 'init-elpa)
;;(require 'init-fonts)
;;(require 'init-markdown)

(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)
(provide 'init)

;; 显示行号
(global-linum-mode 1)

;; 更改光标的样式（不能生效，解决方案见第二集）
(setq cursor-type 'bar)

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (company-go auto-compile go-mode))))
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
