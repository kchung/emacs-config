(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; Enable to edit through SSH
(setq tramp-default-method "ssh")

;; Saving Emacs Sessions
(desktop-save-mode 1)

;; Allow desktop mode to save Tramp connections
(setq desktop-files-not-to-save "^$")

;; Shell Mode Ansi Colors
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; InteractivelyDoThings (ido)
(require 'ido)   
(ido-mode 1)

;; Magit 
;; http://philjackson.github.com/magit/
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

;; Change Magit diff colors (good for black backround terminals)
(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")
     (when (not window-system)
       (set-face-background 'magit-item-highlight "gray8"))))


;; Editing Modes
;; =============

;; Haml Mode
(add-to-list 'load-path "~/.emacs.d/haml-mode")
(add-to-list 'auto-mode-alist '("\\.haml\\'"   . haml-mode))
(autoload 'haml-mode "haml-mode" "Mode for haml" t)

;; nginx-mode
;; https://github.com/ajc/nginx-mode
(add-to-list 'load-path "~/.emacs.d/nginx-mode")
(autoload 'nginx-mode "nginx-mode" "Mode fo nginx" t)

;; Espresso mode
;; http://www.nongnu.org/espresso/
(add-to-list 'load-path "~/.emacs.d/espresso-mode")
(add-to-list 'auto-mode-alist '("\\.js$" . espresso-mode))
(autoload 'espresso-mode "espresso" "Espresso" t)

;; PHP mode
;; http://php-mode.sourceforge.net/  
(add-to-list 'load-path "~/.emacs.d/php-mode/")
(add-to-list 'auto-mode-alist '("\\.php\\'"   . php-mode))
(autoload 'php-mode "php-mode" "Mode for editing sass files" t)

;; SCSS mode
;; https://github.com/antonj/scss-mode
(add-to-list 'load-path "~/.emacs.d/scss-mode/")
(add-to-list 'auto-mode-alist '("\\.scss\\'"   . scss-mode))
(autoload 'scss-mode "scss-mode" "Mode for editing sass files" t)


;; Auto-save
;; =========

;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs.d/autosaves/\\1" t))))
 '(backup-directory-alist (quote ((".*" . "~/.emacs.d/backups/")))))

;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)
(make-directory "~/.emacs.d/backups/" t)
