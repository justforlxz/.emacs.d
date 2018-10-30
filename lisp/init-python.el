(use-package auto-virtualenv
  :ensure t
  :config
  (add-hook 'python-mode-hook 'auto-virtualenv-set-virtualenv)
)


(use-package indent-tools
  :ensure t
  :init
  (add-hook 'python-mode-hook
            (lambda () (define-key python-mode-map (kbd "C-c i") 'indent-tools-hydra/body))
            )
)

(use-package company
  :ensure t
  :init
  (setq company-minimum-prefix-length 2)
  (setq company-dabbrev-ignore-case t)
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous)
  (define-key company-active-map (kbd "C-s") #'company-filter-candidates)

  (global-set-key (kbd "C-c y") 'company-yasnippet)
)

;; enable elpy jedi backend
(setq elpy-rpc-backend "jedi")

;; Fixing a key binding bug in elpy
(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)

;; Fixing another key binding bug in iedit mode
(define-key global-map (kbd "C-c o") 'iedit-mode)

;; 自动完成
(require 'company)
(global-company-mode t); 全局开启

(setq company-idle-delay 0.2;菜单延迟
      company-minimum-prefix-length 1; 开始补全字数
      company-require-match nil
      company-dabbrev-ignore-case nil
      company-dabbrev-downcase nil
      company-show-numbers t; 显示序号
      company-transformers '(company-sort-by-backend-importance)
      company-continue-commands '(not helm-dabbrev)
      )
                    ; 补全后端使用anaconda
(add-to-list 'company-backends '(company-anaconda :with company-yasnippet))
                    ; 补全快捷键
(global-set-key (kbd "<C-tab>") 'company-complete)
                    ; 补全菜单选项快捷键
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)

;; 在python模式中自动启用
(add-hook 'python-mode-hook 'anaconda-mode)

;; jedi
(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)


(provide 'init-python)
