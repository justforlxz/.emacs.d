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
;;(require 'init-ycmd)

(provide 'init)
