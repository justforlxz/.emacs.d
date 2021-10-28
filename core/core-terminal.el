;;; core-terminal.el --- Terminal configurations
;;


;;; Commentary:
;;
;; This file sets up terminal.

;;; Code:

(global-set-key [mouse-4] (lambda () (interactive) (scroll-down 1)))
(global-set-key [mouse-5] (lambda () (interactive) (scroll-up 1)))

(require 'eshell)
(setq eshell-directory-name (expand-file-name "eshell" config-savefile-dir))

;; Start eshell or switch to it if it's active.
(global-set-key (kbd "C-x m") 'eshell)

;; Start a new eshell even if one is active.
(global-set-key (kbd "C-x M") (lambda () (interactive) (eshell t)))

;; Start a regular shell if you prefer that.
(global-set-key (kbd "C-x M-m") 'shell)

(when terminal
  (message "Will set default terminal to %s" terminal)
  (if (equal terminal "ansi-term")
      (require 'core-ansi-term)
    (require 'core-vterm)))

(provide 'core-terminal)

;;; core-terminal.el ends here
