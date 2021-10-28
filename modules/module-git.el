;;; module-git --- Git configurations
;;


;;; Commentary
;;
;; This file sets up git by magit. Disable if frontend is ivy.

;;; Code:
(require-packages '(magit))

;; diff-hl
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch)

(provide 'module-git)

;;; module-git.el ends here
