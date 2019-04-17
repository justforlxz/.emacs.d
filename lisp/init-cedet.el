
;;cedet
(semantic-mode 1)
(defun my:add-semantic-to-autocomplete()
  (add-to-list 'ac-sources 'ac-source-semantic))
(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)

(global-semanticdb-minor-mode t)	 ;;缓存解析过的源代码的结果，以便以后可以使用
(global-semantic-idle-scheduler-mode t)	 ;;emacs空闲时分析源代码
(global-semantic-idle-summary-mode t)	 ;;对当前位点处符号，显示分析出来的结果的摘要
(global-semantic-idle-completions-mode t);;代码补全功能，可以使用命令进行选择
(global-semantic-decoration-mode t)	 ;;顾名思义，使用不同的显示风格来显示分析出来的不同结果
(global-semantic-highlight-func-mode t)	 ;;高亮函数或者标签的声明行
(global-semantic-stickyfunc-mode t)	 ;;在文本的最上层显示函数的声明信息
(global-semantic-mru-bookmark-mode t)	 ;;保存使用过的所有tag，mru是最多最近使用的意思
;;f2补全快捷键
(global-set-key [f2] 'semantic-ia-complete-symbol-menu)

(provide 'init-cedet)
