(require 'ycmd)
(add-hook 'c++-mode-hook 'ycmd-mode)

;;(set-variable 'ycmd-server-command '("python" "/usr/bin/ycmd"))
(set-variable 'ycmd-server-command `("/usr/bin/python3" ,(file-truename "~/.emacs.d/ycmd/ycmd/")))
;;(set-variable 'ycmd-global-config ".ycm_extra_conf.py")

(add-hook 'after-init-hook #'global-ycmd-mode)

(defun ycmd-setup-completion-at-point-function ()
  "Setup `completion-at-point-functions' for `ycmd-mode'."
  (add-hook 'completion-at-point-functions
            #'ycmd-complete-at-point nil :local))

(add-hook 'ycmd-mode-hook #'ycmd-setup-completion-at-point-function)

 ;;; show debug info to *Messages* buffer
(setq url-show-status t)

;;; tab setup
(setq tab-always-indent 'complete)

(defun setup-ycmd ()
  " setup ycmd, add `ycmd-complete-at-point' to
  `completion-at-point-functions' so that `C-M-i' can toggle the
  complete.
  "
  (interactive)
  (ycmd-mode 1)
  (add-hook 'completion-at-point-functions
            #'ycmd-complete-at-point nil :local))

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
