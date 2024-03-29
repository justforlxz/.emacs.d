;;; init.el --- The main entry for emacs -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; A big contributor to startup times is garbage collection. We up the gc
;; threshold to temporarily prevent it from running, and then reset it by the
;; `gcmh' package.
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

(unless (or (daemonp) noninteractive)
  ;; Keep a ref to the actual file-name-handler
  (let ((default-file-name-handler-alist file-name-handler-alist))
    ;; Set the file-name-handler to nil (because regexing is cpu intensive)
    (setq file-name-handler-alist nil)
    ;; Reset file-name-handler-alist after initialization
    (add-hook 'emacs-startup-hook
              (lambda ()
                (setq file-name-handler-alist default-file-name-handler-alist)))))

;; Increase how much is read from processes in a single chunk (default is 4kb).
;; `lsp-mode' benefits from that.
(setq read-process-output-max (* 1024 1024))

(require 'package)
(setq package-archives
      '(("melpa"  . "https://melpa.org/packages/")
        ("gnu"    . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")))

;; Emacs 27 introduces a quickstart mechanism which concatenate autoloads of all
;; packages to reduce the IO time.
;;
;; Don't forget to M-x package-quickstart-refresh if a new package is installed.
(setq package-quickstart t)

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure nil)
  (setq use-package-always-defer nil)
  (setq use-package-always-demand nil)
  (setq use-package-expand-minimally nil)
  (setq use-package-enable-imenu-support t))
(eval-when-compile
  (require 'use-package))

;; Bootstrap `quelpa'.
(use-package quelpa
  :ensure t
  :commands quelpa
  :custom
  (quelpa-git-clone-depth 1)
  (quelpa-self-upgrade-p nil)
  (quelpa-update-melpa-p nil)
  (quelpa-checkout-melpa-p nil))

(setq debug-on-error t)
(setq-default lexical-binding t)

(let ((dir (locate-user-emacs-file "lisp")))
  (add-to-list 'load-path (file-name-as-directory dir))
  (add-to-list 'load-path (file-name-as-directory (expand-file-name "lang" dir))))
(setq custom-file (locate-user-emacs-file "custom.el"))

(require 'init-base)
(require 'init-utils)
(require 'init-ui)
(require 'init-tools)
(require 'init-lsp)
(require 'init-git)
(require 'init-dev)
(require 'init-dired)
(require 'init-hydra)
(require 'init-minibuffer)

;; standalone apps
(require 'init-org)
(require 'init-text)
(require 'init-shell)
(require 'init-spell)
(require 'init-reader)

;; MacOS specific
(when (eq system-type 'darwin)
  (require 'init-osx))

(when (file-exists-p custom-file)
  (load custom-file))

(provide 'init)

;;; init.el ends here
