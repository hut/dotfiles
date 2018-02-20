

(require 'org)
(setq viper-mode t)
(require 'viper)
(org-babel-load-file "~/emacs/configuration.org")
(global-set-key "\C-ca" 'org-agenda)

