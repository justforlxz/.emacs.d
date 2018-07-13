 (when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			      ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/"))))

;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像
(require 'cl)
(defvar my/packages '(
                      auto-complete
                      auto-complete-c-headers
                      dumb-jump
                      irony
                      company-irony
                      company-ycmd
		      go-mode
                      yasnippet
                      yasnippet-snippets
                      exec-path-from-shell
		      smartparens
		      monokai-theme
		      neotree
		      expand-region
		      iedit
                      use-package
		      ) "Defualt packages")

(setq package-selected-packages my/packages)
(defun my/packages-installed-p ()
  (loop for pkg in my/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (my/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg my/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(provide 'init-packages)

(load-theme 'monokai 1)
    (add-to-list 'package-archives
                 '("melpa" . "http://melpa.org/packages/"))

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(setq hippie-expand-try-function-list '(try-expand-debbrev
					try-expand-debbrev-all-buffers
					try-expand-debbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))
