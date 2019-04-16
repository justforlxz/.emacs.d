;; after-load
(defmacro after-load (feature &rest body)
  "After FEATURE is loaded, evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,feature
     '(progn ,@body)))

(setq initial-frame-alist (quote ((fullscreen . maximized))))

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(global-hl-line-mode 1)
(global-font-lock-mode 1)

(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
    (t (save-excursion
         (ignore-errors (backward-up-list))
         (funcall fn)))))

(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "M-s e") 'iedit-mode)
(setq backup-directory-alist (quote (("." . "~/.emacs.d/backups"))))

;;只渲染当前屏幕语法高亮，加快显示速度
(setq lazy-lock-defer-on-scrolling t)
;;(setq font-lock-support-mode 'lazy-lock-mode)
(setq font-lock-maximum-decoration t)


;; 代码补全
(add-hook 'c-mode-hook 'company-mode)
(add-hook 'c++-mode-hook 'company-mode)


;; Enable global company mode
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0.1)
(setq company-minimum-prefix-length 1)
(setq company-backends '((company-capf company-files company-elisp company-inf-ruby company-anaconda company-go company-irony company-clang company-cmake company-css company-yasnippet) (company-dabbrev company-dabbrev-code)))

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(global-set-key [f1] 'whitespace-newline-mode)

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(setq dumb-jump-quiet t)
(setq dumb-jump-prefer-searcher 'ag)


;; 显示时间
(display-time-mode 1) ;; 常显
(setq display-time-24hr-format t) ;;格式
(setq display-time-day-and-date t) ;;显示时间、星期、日期

(provide 'init-utils)
