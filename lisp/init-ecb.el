
;(let ((generated-autoload-file "~/.emacs.d/ecb/ecb.el"))
;  (update-directory-autoloads "~/emacs.d/ecb/"))

(add-to-list 'load-path
	     (expand-file-name
	      "/home/justforlxz/.emacs.d/ecb"))

(require 'ecb)
;;(require 'ecb-autoloads)

(provide 'init-ecb)
