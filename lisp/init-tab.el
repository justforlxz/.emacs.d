(setq-default indent-tabs-mode nil)

(global-set-key (kbd "<backtab>") #'(lambda ()
                                      (interactive)
                                      (switch-to-buffer (other-buffer (current-buffer) 1))))

(global-set-key (kbd ",")
                #'(lambda ()
                    (interactive)
                    (insert ", ")))

(provide 'init-tab)
