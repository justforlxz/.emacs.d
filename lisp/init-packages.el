(require 'cl)
(defvar my/packages '(
                      auto-complete
                      auto-complete-c-headers
                      dumb-jump
                      irony
                      irony-eldoc
                      flycheck-irony
                      flycheck-ycmd
                      company-irony
                      company-ycmd
                      company-jedi
                      go-mode
                      yasnippet
                      yasnippet-snippets
                      exec-path-from-shell
                      smartparens
                      monokai-theme
                      neotree
                      expand-region
                      use-package
                      elpy ;;python
                      flycheck ;;python
                      company-jedi ;;python
                      virtualenvwrapper
                      dumb-jump ;;跳转
                      all-the-icons
                      rtags ;;cmake-ide depend
                      cmake-ide
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

(load-theme 'monokai 1)
    (add-to-list 'package-archives
                 '("melpa" . "http://melpa.org/packages/"))

;; neotree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;; all icon
(require 'all-the-icons)

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

;(add-hook 'c++-mode-hook 'irony-mode)
;(add-hook 'c-mode-hook 'irony-mode)
;(add-hook 'objc-mode-hook 'irony-mode)

;(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(provide 'init-packages)
