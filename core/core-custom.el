;;; core-custom.el --- Define configuration variables.
;;


;;; Commentary:
;;
;; This file defines some custom variables.

;;; Code:

;; customize
(defgroup wen nil
  "Emacs Wen configuration."
  :prefix ""
  :group 'convenience)

(defcustom auto-save t
  "Non-nil values enable Wen's auto save."
  :type 'boolean
  :group 'wen)

(defcustom guru t
  "Non-nil values enable `guru-mode'."
  :type 'boolean
  :group 'wen)

(defcustom whitespace t
  "Non-nil values enable Wen's whitespace visualization."
  :type 'boolean
  :group 'wen)

(defcustom clean-whitespace-on-save t
  "Cleanup whitespace from file before it's saved.
Will only occur if `whitespace' is also enabled."
  :type 'boolean
  :group 'wen)

(defcustom flyspell t
  "Non-nil values enable Wen's flyspell support."
  :type 'boolean
  :group 'wen)

(defcustom indent-sensitive-modes
  '(conf-mode coffee-mode haml-mode python-mode slim-mode yaml-mode)
  "Modes for which auto-indenting is suppressed."
  :type 'list
  :group 'wen)

(defcustom yank-indent-modes '(LaTeX-mode TeX-mode)
  "Modes in which to indent regions that are yanked (or yank-popped).
Only modes that don't derive from `prog-mode' should be listed here."
  :type 'list
  :group 'wen)

(defcustom yank-indent-threshold 1000
  "Threshold (# chars) over which indentation does not automatically occur."
  :type 'number
  :group 'wen)

(defcustom theme 'zenburn
  "The default color theme, change this in your /personal/preload config."
  :type 'symbol
  :group 'wen)

(defcustom frontend "ivy"
  "The default frontend, avaliables: ivy, helm."
  :type 'string
  :group 'wen)

(defcustom terminal "ansi-term"
  "The default terminal, avaliables: ansi-term, vterm."
  :type 'string
  :group 'wen)

(defcustom tex-server "texlab"
  "The default latex server, avaliables: digestif, texlab."
  :type 'string
  :group 'wen)

(provide 'core-custom)

;;; core-custom.el ends here
