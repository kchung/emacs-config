(setq-default indent-tabs-mode nil)
;;(setq-default tab-width 4)

(setq-default c-basic-offset 4
              tab-width 4
              indent-tabs-mode t)

;; Desktop Mode
(desktop-save-mode 1)

;; Shell Mode Ansi Colors
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; InteractivelyDoThings (ido)
(require 'ido)   
(ido-mode 1)

;;
;; Expand Region
;; =============
;; https://github.com/magnars/expand-region.el
;;

(add-to-list 'load-path "~/.emacs.d/expand-region/")
(require 'expand-region)
(global-set-key (kbd "C-\\") 'er/expand-region)
(global-set-key (kbd "M-\\") 'er/contract-region)

;;
;; Ibuffer Mode
;; ============
;;

;; Defaulty use Ibuffer Mode
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Use human readable Size column instead of original one
(define-ibuffer-column size-h
  (:name "Size" :inline t)
  (cond
   ((> (buffer-size) 1000) (format "%7.3fk" (/ (buffer-size) 1000.0)))
   ((> (buffer-size) 1000000) (format "%7.3fM" (/ (buffer-size) 1000000.0)))
   (t (format "%8d" (buffer-size)))))

;; Modify the default ibuffer-formats
(setq ibuffer-formats
	  '((mark modified read-only " "
			  (name 18 18 :left :elide)
			  " "
			  (size-h 9 -1 :right)
			  " "
			  (mode 16 16 :left :elide)
			  " "
			  filename-and-process)))

;;
;; Magit 
;; ===========
;; http://philjackson.github.com/magit/
;;

(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

;; Change Magit diff colors (good for black backround terminals)
(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")
     (when (not window-system)
       (set-face-background 'magit-item-highlight "gray8"))))



;;
;; TRAMP Mode
;; =============
;;

;; Enable to edit through SSH
(setq tramp-default-method "ssh")

;; Stop TRAMP from autosaving
;; prevents hangs when on a bad VPN connection
(require 'tramp)
(add-to-list 'backup-directory-alist
			 (cons tramp-file-name-regexp nil))

;; Allow desktop mode to save TRAMP connections
(setq desktop-files-not-to-save "^$")


;;
;; Editing Modes
;; =============
;;

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


;;
;; Auto-save
;; =========
;;

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

;;
;; custom-set-faces
;; =================
;; changes are automatically added by 'customize-face'
;; these colors are meant to to go better with my dark terminal background

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(match ((t (:background "yellow")))))
