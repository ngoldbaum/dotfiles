(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))
(package-initialize)
(provide 'init-elpa)

;; Turn on spell checking for text buffers
(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))
(dolist (hook '(change-log-mode-hook log-edit-mode-hook))
  (add-hook hook (lambda () (flyspell-mode -1))))

;; Turn on auto-fill-mode for text buffers
(add-hook 'text-mode-hook 'turn-on-auto-fill)

(add-to-list 'custom-theme-load-path "~/Documents/emacs-color-theme-solarized")
(add-to-list 'load-path "~/Documents/emacs-color-theme-solarized")
(load-theme 'solarized-dark t)

(setq solarized-termcolors '256)

(add-to-list 'default-frame-alist '(background-color . "black"))

(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))

(add-hook 'window-setup-hook 'on-after-init)


(add-hook 'rust-mode-hook 'cargo-minor-mode)
(add-hook 'rust-mode-hook #'flycheck-rust-setup)

(menu-bar-mode -1)

(set-frame-parameter nil 'background-mode 'dark)

(require 'helm-config)

(add-to-list 'load-path "/Users/goldbaum/.emacs.d/custom")
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")
(load-library "misc-cmds")

(setq line-number-mode t)
(setq column-number-mode t)
(setq-default fill-column 80)

;; to display time
(display-time)

;; to set the cursor color
(set-cursor-color "red")
;; to set foreground color to white
(set-foreground-color "white")

;; Maximum colors
(setq font-lock-maximum-decoration t)

(setq frame-background-mode 'dark)

;; adding custom modes
(autoload `cython-mode 
  "cython-mode.el" "Major mode for editing cython code" t)
(autoload `markdown-mode
  "markdown-mode.el" "Major mode for editing Markdown files" t)

(setq auto-mode-alist '(("\\.ad[bs]\\'"   . ada-mode)
                        ("\\.awk\\'"      . awk-mode)
                        ("\\.lex\\'"      . c-mode)
                        ("\\.[cy]\\'"     . c++-mode)
                        ("\\.h\\'"        . c++-mode)
                        ("\\.hxx\\'"      . c++-mode)
                        ("\\.[CH]\\'"     . c++-mode)
                        ("\\.java\\'"     . java-mode)
                        ("\\.cc\\'"       . c++-mode)
                        ("\\.hh\\'"       . c++-mode)
                        ("\\.cxx\\'"      . c++-mode)
                        ("\\.cpp\\'"      . c++-mode)
                        ("\\.hpp\\'"      . c++-mode)                        
                        ("\\.rc\\'"       . c++-mode) ;; resource files
                        ("\\.rcv\\'"      . c++-mode)
                        ("\\.m\\'"        . matlab-mode)
                        ("\\.p[lm]\\'"    . perl-mode)
                        ("\\.cgi\\'"      . perl-mode)
                        ("\\.f\\'"      . fortran-mode)
                        ("\\.F\\'"      . fortran-mode)
                        ("\\.f90\\'"      . f90-mode)
                        ("\\.F90\\'"      . f90-mode)
                        ("\\.el\\'"       . emacs-lisp-mode)
						("\\.emacs\\'"    . emacs-lisp-mode)
                        ("\\.tex\\'"      . LaTeX-mode)
                        ("\\.bib\\'"      . bibtex-mode)
                        ("[Mm]akefile\\'" . makefile-mode)
                        ("\\.mak\\'"      . makefile-mode)
                        ("\\[Mm]akefile.\\'" . makefile-mode)
                        ("\\.bat\\'"      . shell-script-mode)
                        ("\\.tar\\'"      . tar-mode)
                        ("\\.php\\'"     . php-mode)
                        ("\\.html\\'"     . html-mode)
                        ("\\.jnlp\\'"     . html-mode)
                        ("\\.xml\\'"     . html-mode)
                        ("\\.pddl\\'"     . lisp-mode)
                        ("\\.css\\'"      . css-mode)
                        ("\\.py\\'"       . python-mode)
                        ("\\.yml\\'"      . yaml-mode)
                        ("\\.lisp\\'"     . lisp-mode)
						("\\.pyx\\'"      . cython-mode)
                        ("\\.pxd\\'"      . cython-mode)
						("\\.pro\\'"      . idlwave-mode)
						("\\.zshrc\\'"    . sh-mode)
						("\\.rst$"        . rst-mode)
                        ("\\.markdown\\'" . markdown-mode)
                        ("\\.md\\'"       . markdown-mode)
						("\\.rest$"       . rst-mode)
						("\\.rb\\'"       . ruby-mode)
                        ("\\.rs\\'"       . rust-mode)
                        ("\\.toml\\'"     . toml-mode)))

;; Don't need to spell out yes or no
(fset 'yes-or-no-p 'y-or-n-p)

(require 'ido)
(ido-mode t)

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(add-hook 'after-init-hook #'global-flycheck-mode)

;; tab is four characters
(setq-default tab-width 4)
(setq-default c-basic-offset 2)

;; Spaces instead of tabs in all modes
(setq-default indent-tabs-mode nil)

(set-face-attribute 'default nil :height 120)
 (if window-system
      (set-frame-size (selected-frame) 95 50))

(setq inhibit-splash-screen t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-error ((t (:foreground "brightred" :underline (:color "brightred" :style wave)))))
 '(flycheck-warning ((t (:foreground "DarkOrange" :underline (:color "DarkOrange" :style wave))))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (json-mode magit magithub yaml-mode toml-mode solarized-theme rust-playground helm flycheck-rust cargo))))
(put 'narrow-to-region 'disabled nil)
