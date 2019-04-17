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

(setq dumb-jump-quiet t)
(setq dumb-jump-prefer-searcher 'ag)

;; 显示时间
(display-time-mode 1) ;; 常显
(setq display-time-24hr-format t) ;;格式
(setq display-time-day-and-date t) ;;显示时间、星期、日期

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

(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . fullboth)))))

(my-fullscreen)

;; 显示行号
(global-linum-mode 1)

;; 更改光标的样式（不能生效，解决方案见第二集）
(setq cursor-type 'bar)

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)
;;(custom-set-variables
;; ;; custom-set-variables was added by Custom.
;; ;; If you edit it by hand, you could mess it up, so be careful.
;; ;; Your init file should contain only one such instance.
;; ;; If there is more than one, they won't work right.
;; '(custom-enabled-themes (quote (sanityinc-solarized-dark)))
;; '(custom-safe-themes
;;   (quote
;;    ("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
;; '(package-selected-packages
;;   (quote
;;    (## auto-complete-c-headers auto-complete-clang company-go auto-compile go-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init-utils)
