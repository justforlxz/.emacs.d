(setq-default indent-tabs-mode nil)

(global-set-key (kbd "<backtab>") #'(lambda ()
                                      (interactive)
                                      (switch-to-buffer (other-buffer (current-buffer) 1))))

(global-set-key (kbd ",")
                #'(lambda ()
                    (interactive)
                    (insert ", ")))

;;设置TAB宽度为4
(setq default-tab-width 4)
;;以下设置缩进
;;用tab缩进
(setq indent-tabs-mode t)
(setq c-indent-level 4)
(setq c-continued-statement-offset 4)
(setq c-brace-offset -4)
(setq c-argdecl-indent 4)
(setq c-label-offset -4)
(setq c-basic-offset 4)
(global-set-key "\C-m" 'reindent-then-newline-and-indent)

(provide 'init-tab)
