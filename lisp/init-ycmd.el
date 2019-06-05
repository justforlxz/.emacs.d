(require 'ycmd)
(add-hook 'c++-mode-hook 'ycmd-mode)

(set-variable 'ycmd-server-command '("python" "/usr/bin/ycmd"))

(add-hook 'after-init-hook #'global-ycmd-mode)

(defun ycmd-setup-completion-at-point-function ()
  "Setup `completion-at-point-functions' for `ycmd-mode'."
  (add-hook 'completion-at-point-functions
            #'ycmd-complete-at-point nil :local))

(add-hook 'ycmd-mode-hook #'ycmd-setup-completion-at-point-function)

;;;; Completion framework
(require-package 'company-ycmd)
(require 'company-ycmd)
(company-ycmd-setup)

;;;; Enable flycheck
(require-package 'flycheck-ycmd)
(require 'flycheck-ycmd)
(flycheck-ycmd-setup)

(when (not (display-graphic-p))
  (setq flycheck-indication-mode nil))

(provide 'init-ycmd)
