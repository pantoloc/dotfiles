(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(browse-url-firefox-program "conkeror")
 '(jde-compiler (quote ("javac" "")))
 '(sr-show-file-attributes nil)
 '(sr-terminal-program "zsh")
 '(sr-use-commander-keys nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
;;(add-to-list 'load-path "~/.elisp/orgmode/org-7.3")
;;(add-to-list 'load-path "~/.elisp/sunrise-commander/")
;;(add-to-list 'load-path "~/.elisp/dired-details/")
;;(add-to-list 'load-path "~/.elisp")
;;(add-to-list 'load-path "~/.elisp/bbdb-stuff.el")
(setq emacs-config-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "/home/veel/.emacs.d/smooth-scrolling.el")
;;(add-to-list 'load-path "/home/veel/.emacs.d/mic-paren.el")
(add-to-list 'load-path "/home/veel/.emacs.d/highlight-parentheses.el")
(setq blink-matching-paren nil) 
(load "/usr/share/emacs/site-lisp/haskell-mode/haskell-site-file.el")
(add-to-list 'load-path "~/.emacs.d/colorthemedjb.el")
(add-to-list 'load-path "~/.emacs.d/ii-mode.el")
(global-set-key [f8] 'kill-this-buffer)
(require 'color-theme)
(color-theme-initialize)
(color-theme-calm-forest)
(require 'ii-mode)
(setq ii-irc-directory "/home/veel/irc/")
(require 'sunrise-commander)
(require 'sunrise-x-popviewer)
;; (add-hook 'ii-mode-hook (lambda ()
;;                           (visual-line-mode)
;;                           (local-set-key (kbd "RET") 'newline)
;;                           (local-set-key (kbd "C-c C-s") 'ii-send-message)))

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

(defalias 'yes-or-no-p 'y-or-n-p)

(require 'highlight-parentheses)
(setq highlight-parentheses-mode t)

;;(require 'w3m-load)
;;(require 'sunrise-commander)
;;(require 'org-install)

;;(require 'tramp)                                                           

;; orgmode, one of the best things in life

(setq default-major-mode 'org-mode)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(global-linum-mode 1)
(setq org-agenda-files (list "~/.org/work.org"
                             "~/.org/uni.org" 
			     "~/.org/test.org"
                             "~/.org/home.org"
			     "~/.org/config.org"))

(setq load-path (append (list "/usr/share/emacs/site-lisp/elib")
                         load-path))
(load-file "/usr/share/emacs/site-lisp/cedet/common/cedet.el")


(add-to-list 'load-path (expand-file-name "/usr/share/emacs/site-lisp/jde/lisp"))
(add-to-list 'load-path (expand-file-name "/usr/share/emacs/site-lisp/cedet/common"))


;; If you want Emacs to defer loading the JDE until you open a
;; Java file, edit the following line
;;(setq defer-loading-jde nil)
;; to read:
;;
(setq defer-loading-jde t)
;;

(if defer-loading-jde
     (progn
       (autoload 'jde-mode "jde" "JDE mode." t)
       (setq auto-mode-alist
           (append
            '(("\\.java\\'" . jde-mode))
            auto-mode-alist)))
  (require 'jde))



(require 'doc-view)


(setq visible-bell t)
(menu-bar-mode -1)
(tool-bar-mode 0)
(setq-default indent-tabs-mode nil)

(cond ((fboundp 'global-font-lock-mode)

;; Turn on font-lock in all modes that support it
(global-font-lock-mode t)

;; Maximum colors
(setq font-lock-maximum-decoration t)))
;;(setq TeX-auto-save t)
;;(setq TeX-parse-self t)
;;(setq-default TeX-master nil)
;;(load "auctex.el" nil t t)
;;(load "preview-latex.el" nil t t)

;; don't cluster up my directories

(if (file-accessible-directory-p (expand-file-name "/home/veel/.trash"))
    (add-to-list 'backup-directory-alist
                 (cons "." (expand-file-name "/home/veel/.trash/emacs-backups/"))))

;; highlight cursor line
;;(global-hl-line-mode 1)
(require 'ido)
(ido-mode 1)
(define-key minibuffer-local-map [tab] 'minibuffer-complete)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
;;(setq ido-use-url-at-point nil) have to test it
(setq ido-create-new-buffer 'always)
;;(setq ido-file-extensions-order '(".org" ".txt" ".py" ".emacs" ".xml" ".el" ".ini" ".cfg" ".cnf")) might be needed at some point
;;ido-ignore-buffers 	Takes a list of buffers to ignore in C-x b
;;ido-ignore-directories 	Takes a list of directories to ignore in C-x d and C-x C-f
;;ido-ignore-files 	Takes a list of files to ignore in C-x C-f
(setq ido-ignore-extensions t)

(require 'recentf)
;; get rid of `find-file-read-only' and replace it with something
;; more useful.
(global-set-key (kbd "C-x C-r") 'ido-recentf-open)
 
;; enable recent files mode.
(recentf-mode t)
 
; 50 files ought to be enough.
(setq recentf-max-saved-items 50)
 
(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))

;; set indent to 2
(setq standard-indent 2)

;; scrolling
(require 'smooth-scrolling)

;;(setq scroll-step 1)

;;(setq
;;  scroll-margin 0                  
;;  scroll-conservatively 100000
;;  scroll-preserve-screen-position 1)
;; support mouse scrolling
(mouse-wheel-mode t)

(set-scroll-bar-mode nil)

;; use control keychain instead of M-x
(global-set-key "\C-x\C-m" 'execute-extended-command)

;;(setq-default left-margin 4)


;; better killing 
;; (global-set-key "\C-w" 'backward-kill-word) ;;
(global-set-key "\C-x\C-k" 'kill-region)
;;(global-set-key "\C-c\C-k" 'kill-region)




(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)

(setq dired-isearch-filenames t)


(global-set-key "\M-3" 'next-multiframe-window)

(defun getmail-get ()
  (interactive)
  (shell-command "getmail"))

(global-set-key "\C-x\M-m" 'getmail-get)

(setq org-todo-keywords
      '((sequence "TODO" "DONE" "CANCELED")))

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "/usr/bin/conkeror")


(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

;;keep this at the end
;;(load-file "/usr/share/emacs/site-lisp/cedet/common/cedet.el")

(require 'image-mode)
(define-key image-mode-map "n" 'next-image)
(define-key image-mode-map "p" 'previous-image)

(defun next-image (arg)
  "..."
  (interactive "P")
  (unless (and (buffer-file-name) (eq major-mode 'image-mode))
    (error "Not visiting a file in image mode"))
  (let* ((regexp  (image-file-name-regexp))
         (files   (directory-files default-directory nil regexp))
         (len     (length files))
         (this    (file-name-nondirectory (buffer-file-name)))
         (idx     0))
    (catch 'next-image
      (dolist (file  files)
        (when (string= this file) (throw 'next-image (1+ idx)))
        (setq idx  (1+ idx))))
    (setq idx  (+ idx (if arg -1 1)))
    (when (< idx 0) (setq idx (1- len)))
    (when (>= idx len) (setq idx 0))
    (find-file (elt files idx))))

(defun previous-image (arg)
  "..."
  (interactive "P")
  (next-image t))

(defun mailto-compose-mail (mailto-url)
  (if (and (stringp mailto-url)
           (string-match "\\`mailto:" mailto-url))
      (progn
        (require 'rfc2368)
        (let* ((headers (mapcar (lambda (h) (cons (intern (car h)) (cdr h)))
                          (rfc2368-parse-mailto-url mailto-url)))
               (good-headers (remove-if (lambda (h) (member (car h) '(Body))) headers))
               (body (cdr (assoc 'Body headers))))
          (wl-draft good-headers nil nil body)))))

(setq org-return-follows-link t)
(setq org-use-tag-inheritance t)

;;(defun org-add-new-behi ()
;;  (interactive)
  
;;(define-key global-map "f5" 'kill-buffer-and-window)
(global-set-key (kbd "<f7>") 'kill-buffer-and-window)
(global-set-key (kbd "<f5>") 'delete-window)
(global-set-key "\C-cx" 'sunrise)
(require 'emms-setup)
(emms-standard)
(emms-default-players)