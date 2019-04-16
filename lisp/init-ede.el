(require 'mode-local)
(setq-mode-local c++-mode
                 semanticdb-find-default-throttle
                 '(project unloaded recursive))

(global-ede-mode t)
(provide 'init-ede)
