(require 'package)
(package-initialize)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(add-to-list 'custom-theme-load-path "~/Documents/emacs-color-theme-solarized")
(add-to-list 'load-path "~/Documents/emacs-color-theme-solarized")
(load-theme 'solarized t)

(setq solarized-termcolors '256)

(require 'helm-config)

(if (display-graphic-p)
	(x-focus-frame nil)
  )

(add-to-list 'load-path "/Users/goldbaum/.emacs.d/custom")
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")
(load-library "misc-cmds")

(setq line-number-mode t)
(setq column-number-mode t)
(setq-default fill-column 80)

;; always end a file with a newline
;; (setq require-final-newline t)

;;to display time
(display-time)

;;to set the cursor color
(set-cursor-color "red")
;;to set foreground color to white
(set-foreground-color "white")

;;to set background color to black
(set-background-color "black")

(show-paren-mode t)

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
						("\\.rb\\'"       . ruby-mode)))

;; Don't need to spell out yes or no
(fset 'yes-or-no-p 'y-or-n-p)

(require 'ido)
(ido-mode t)

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(add-hook 'after-init-hook #'global-flycheck-mode)

;(require 'autopair)
;(autopair-global-mode)

;(require 'auto-complete)
;(require 'auto-complete-config)
;(require 'auto-complete-clang)
;(ac-config-default)
;(global-auto-complete-mode t)

;; Useful interfaces for command line python tools
(require 'grin)
(require 'pyflakes)

;(add-hook 'python-mode-hook
;          (lambda ()
;            (pymacs-load "ropemacs" "rope-")))

;; tab is four characters
(setq-default tab-width 4)
(setq-default c-basic-offset 2)

;; Spaces instead of tabs in all modes
(setq-default indent-tabs-mode nil)

(set-face-attribute 'default nil :height 120)
 (if window-system
      (set-frame-size (selected-frame) 95 50))

(setq inhibit-splash-screen t)

(setq focus-follows-mouse t)
(setq mouse-autoselect-window t)
(require 'follow-mouse)
(turn-on-follow-mouse)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-clean-confirm nil)
 '(TeX-command-list
   (quote
    (("latexmk" "latexmk -pdf %s" TeX-run-TeX nil t :help "Run latexmk on file")
     ("TeX" "%(PDF)%(tex) %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil
      (plain-tex-mode texinfo-mode ams-tex-mode)
      :help "Run plain TeX")
     ("LaTeX" "%`%l%(mode)%' %t" TeX-run-TeX nil
      (latex-mode doctex-mode)
      :help "Run LaTeX")
     ("Makeinfo" "makeinfo %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with Info output")
     ("Makeinfo HTML" "makeinfo --html %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with HTML output")
     ("AmSTeX" "%(PDF)amstex %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil
      (ams-tex-mode)
      :help "Run AMSTeX")
     ("ConTeXt" "texexec --once --texutil %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt once")
     ("ConTeXt Full" "texexec %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt until completion")
     ("BibTeX" "bibtex %s" TeX-run-BibTeX nil t :help "Run BibTeX")
     ("Biber" "biber %s" TeX-run-Biber nil t :help "Run Biber")
     ("View" "%V" TeX-run-discard-or-function nil t :help "Run Viewer")
     ("Print" "%p" TeX-run-command t t :help "Print the file")
     ("Queue" "%q" TeX-run-background nil t :help "View the printer queue" :visible TeX-queue-command)
     ("File" "%(o?)dvips %d -o %f " TeX-run-command t t :help "Generate PostScript file")
     ("Index" "makeindex %s" TeX-run-command nil t :help "Create index file")
     ("Check" "lacheck %s" TeX-run-compile nil
      (latex-mode)
      :help "Check LaTeX file for correctness")
     ("Spell" "(TeX-ispell-document \"\")" TeX-run-function nil t :help "Spell-check the document")
     ("Clean" "TeX-clean" TeX-run-function nil t :help "Delete generated intermediate files")
     ("Clean All" "(TeX-clean t)" TeX-run-function nil t :help "Delete generated intermediate and output files")
     ("Other" "" TeX-run-command t t :help "Run an arbitrary command"))))
 '(ansi-color-names-vector
   ["#262626" "#d70000" "#5f8700" "#af8700" "#0087ff" "#af005f" "#00afaf" "#626262"])
 '(background-color nil)
 '(background-mode dark)
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(cursor-color nil)
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" default)))
 '(ebib-autogenerate-keys t)
 '(ebib-preload-bib-files (quote ("~/Documents/gravinst_paper/ms.bib")))
 '(ebib-uniquify-keys t)
 '(fci-rule-color "#073642")
 '(foreground-color nil)
 '(frame-background-mode (quote dark))
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(magit-diff-use-overlays nil)
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#839496" 0.2))
 '(solarized-broken-srgb nil)
 '(solarized-degrade nil)
 '(solarized-termcolors 256)
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#ff7f00")
     (60 . "#ffbf00")
     (80 . "#b58900")
     (100 . "#ffff00")
     (120 . "#ffff00")
     (140 . "#ffff00")
     (160 . "#ffff00")
     (180 . "#859900")
     (200 . "#aaff55")
     (220 . "#7fff7f")
     (240 . "#55ffaa")
     (260 . "#2affd4")
     (280 . "#2aa198")
     (300 . "#00ffff")
     (320 . "#00ffff")
     (340 . "#00ffff")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-error ((t (:foreground "brightred" :underline (:color "brightred" :style wave)))))
 '(flycheck-warning ((t (:foreground "DarkOrange" :underline (:color "DarkOrange" :style wave))))))

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

;(add-hook 'python-mode-hook 'jedi:setup)
;(setq jedi:setup-keys t)                      ; optional
;(setq jedi:complete-on-dot t)                 ; optional

(setq c-default-style "linux")

(c-set-offset 'arglist-intro '++)
(c-set-offset 'arglist-cont-nonempty '++)

(add-hook 'c++-mode-hook
          (lambda () (setq comment-start "/* " 
                           comment-end " */" 
                           comment-empty-lines t 
                           comment-style 'extra-line)
            )
          )

(global-set-key (kbd "M-n") 'next-error)
(global-set-key (kbd "M-p") 'previous-error)

(menu-bar-mode -1)

(setq make-backup-files nil)

(put 'narrow-to-region 'disabled nil)


;; AucTeX
(setq TeX-auto-save t)
(setq TeX-save-query nil) ;; autosave before compiling
(setq TeX-parse-self t)
(setq TeX-command-force "")
(setq-default Tex-master nil)
(add-hook 'LaTeX-mode-hook 'auto-fill-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq TeX-PDF-mode t)

;; Use Skim as viewer, enable source <-> PDF sync
;; make latexmk available via C-c C-c
;; Note: SyncTeX is setup via ~/.latexmkrc (see below)
(add-hook 'LaTeX-mode-hook (lambda ()
                             (push
                              '("latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
                                :help "Run latexmk on file")
                              TeX-command-list)))
(add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))

;; use Skim as default pdf viewer
;; Skim's displayline is used for forward search (from .tex to .pdf)
;; option -b highlights the current line; option -g opens Skim in the background
(setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
(setq TeX-view-program-list
      '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))

(load "server")
(unless (server-running-p) (server-start))

(setq bibtex-align-at-equal-sign t
      bibtex-autokey-name-year-separator ""
      bibtex-autokey-year-title-separator ""
      bibtex-autokey-titleword-first-ignore '("the" "a" "if" "and" "an")
      bibtex-autokey-titleword-length 0
      bibtex-autokey-titlewords 0)
