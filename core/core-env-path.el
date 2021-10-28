;;; core-env-path.el --- Environment path configurations
;;


;;; Commentary:
;;
;; This file sets up environment variables.

;;; Code:
(require-packages '(exec-path-from-shell))

(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

(provide 'core-env-path)

;;; core-env-path.el ends here
