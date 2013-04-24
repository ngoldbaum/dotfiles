(add-to-list 'load-path "~/.emacs.d/custom/")
(add-to-list 'load-path' "/usr/local/share/emacs/site-lisp")

(setq line-number-mode t)
(setq column-number-mode t)
(setq-default fill-column 80)

;; always end a file with a newline
(setq require-final-newline t)

;;to display time
(display-time)

;;to set the cursor color
(set-cursor-color "red")

;;to set foreground color to white
(set-foreground-color "white")

;;to set background color to black
(set-background-color "black")

;;don't clutter my filesystem
(setq
 backup-by-copying t      ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.emacs.d/saves"))    ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)       ; use versioned backups


;; Maximum colors
(setq font-lock-maximum-decoration t)

(setq frame-background-mode 'dark)

;; adding custom modes
(autoload `cython-mode "cython-mode.el" "Major mode for editing cython code" t)

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
			("\\.pro\\'"      . idlwave-mode)
			("\\.zshrc\\'"    . sh-mode)
			("\\.rst$"        . rst-mode)
			("\\.rest$"       . rst-mode)
			("\\.rb\\'"       . ruby-mode)))

;; Don't need to spell out yes or no
(fset 'yes-or-no-p 'y-or-n-p)

;; tab is two characters
(setq-default c-basic-offset 2)

;; load auctex
(require 'tex-site)
(load "preview-latex.el" nil t t)

;; LaTeX synctex support.  Need skim.app installed.
(add-hook 'LaTeX-mode-hook
	  (lambda ()
	    ;; Enable source-specials for Control-click forward/reverse search.
	    (TeX-PDF-mode 1)
	    (TeX-source-correlate-mode 1)
	    (setq TeX-source-correlate-method 'synctex)
	    (setq TeX-view-program-list
		  '(("Skim"
		     "/Applications/Skim.app/Contents/SharedSupport/displayline -g %n %o %b"))
		  TeX-view-program-selection
		  '((output-pdf "Skim")))))

(setq c-default-style "bsd")

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

(el-get 'sync)

(add-hook 'python-mode-hook 'auto-complete-mode)
(add-hook 'python-mode-hook 'jedi:ac-setup)

(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(require 'ido)
(ido-mode t)

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(add-hook 'after-init-hook #'global-flycheck-mode)

(add-to-list 'load-path "/Users/goldbaum/Documents/autopair/")
(require 'autopair)
(autopair-global-mode t)


