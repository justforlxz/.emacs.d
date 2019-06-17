(when (>= emacs-major-version 24)
    (require 'package)
    (package-initialize)
    (setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
		      ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/"))))

;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像

(file-directory-p (expand-file-name (concat "~" init-file-user)))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

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
(require 'init-tab)
(require 'go-autocomplete)
(require 'init-irony)
(require 'init-python)
(require 'init-golang)
(require 'init-ede)
(require 'lk-file-search)
(require 'init-tabbar)
;;(require 'init-themes)
(require 'init-fonts)
(require 'init-git)
(require 'init-cedet)
(require 'init-ecb)
(require 'init-ycmd)
(require 'init-cmake)
(require 'init-yasnippet)
(require 'init-typescript)

(provide 'init)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(initial-frame-alist (quote ((fullscreen . fullboth))))
 '(package-selected-packages
   (quote
    (magit auto-complete auto-complete-c-headers dumb-jump irony irony-eldoc flycheck-irony flycheck-ycmd company-irony company-ycmd company-jedi go-mode yasnippet yasnippet-snippets exec-path-from-shell smartparens monokai-theme neotree expand-region use-package elpy flycheck company-jedi virtualenvwrapper dumb-jump all-the-icons rtags cmake-ide))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
