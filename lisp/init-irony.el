;; c++ headers 补全

;;; backends for irony-c-header
(use-package company-irony-c-headers
  :ensure t
  :defer t
  :init (progn (add-hook 'c-mode-hook
			 (lambda () (add-to-list 'company-backends 'company-irony-c-headers)))
	       (add-hook 'c++-mode-hook
			 (lambda () (add-to-list 'company-backends 'company-irony-c-headers)))
	 )
)

(use-package cmake-ide
  :ensure t
  :defer t
  :init (progn
	  (add-hook 'c++-mode-hook (lambda () (cmake-ide-setup)))
	  (add-hook 'c-mode-hook (lambda () (cmake-ide-setup)))
	  )
  )
(use-package cmake-mode
  :ensure t
  :mode (
	 ("CMakeLists\\.txt\\'" . cmake-mode)
	 ("\\.cmake\\'" . cmake-mode)
	 ))

(use-package flycheck-irony
  :ensure t
  :defer t
  :init (progn
	  (add-hook 'flycheck-mode-hook #'flycheck-irony-setup)
	  ))
(add-hook 'c++-mode-hook (lambda ()
			   (setq flycheck-clang-language-standard "c++11")
			   (setq irony-additional-clang-options '("-std=c++11"))
			   ))

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

(provide 'init-irony)
