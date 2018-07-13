(provide 'init-auto-complete)

(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-20170124.1845/")
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20170124.1845/dict/")
(require 'auto-complete-config)
(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-clang-20140409.52/")
(require 'auto-complete-clang)
;; 设置不自动启动
(setq ac-auto-start nil)
;; 设置响应时间 0.5
(setq ac-quick-help-delay 0.5)
;;(ac-set-trigger-key "TAB")
;;(define-key ac-mode-map  [(control tab)] 'auto-complete)
;; 提示快捷键为 M-/
(define-key ac-mode-map  (kbd "M-/") 'auto-complete)
(defun my-ac-config ()
  (setq ac-clang-flags
        (mapcar(lambda (item)(concat "-I" item))
               (split-string
                "
 /usr/include/c++/7
 /usr/include/x86_64-linux-gnu/c++/7
 /usr/include/c++/7/backward
 /usr/lib/gcc/x86_64-linux-gnu/7/include
 /usr/local/include
 /usr/lib/gcc/x86_64-linux-gnu/7/include-fixed
 /usr/include/x86_64-linux-gnu
 /usr/include
"
)))
(setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
(add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
(add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
(add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
(add-hook 'css-mode-hook 'ac-css-mode-setup)
(add-hook 'auto-complete-mode-hook 'ac-common-setup)
(global-auto-complete-mode t))
(defun my-ac-cc-mode-setup ()
  (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))
(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
;; ac-source-gtags
(my-ac-config)
(ac-config-default)
(setq ac-ignore-case t)

(require 'yasnippet)
(yas/global-mode 1)
