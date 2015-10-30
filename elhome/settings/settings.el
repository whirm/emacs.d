(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-PDF-mode t)
 '(TeX-source-correlate-method (quote synctex))
 '(TeX-source-correlate-mode t)
 '(TeX-source-correlate-start-server t)
 '(TeX-view-program-list (quote (("Okular" "okular --unique %o#src:%n`pwd`/./%b"))))
 '(TeX-view-program-selection
   (quote
    ((output-pdf "Okular")
     ((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "xdvi")
     (output-pdf "xpdf")
     (output-html "xdg-open"))))
 '(abbrev-file-name "~/.emacs.d/var/abbrev_defs")
 '(ac-comphist-file "~/.emacs.d/var/ac-comphist.dat")
 '(ac-use-menu-map t)
 '(ahs-default-range (quote ahs-range-whole-buffer))
 '(ahs-exclude (quote ((python-mode . "(self|def)"))))
 '(ahs-idle-interval 0.3)
 '(alert-default-style (quote libnotify))
 '(alert-user-configuration nil)
 '(ansi-color-names-vector
   ["black" "red3" "green3" "yellow3" "DodgerBlue2" "magenta3" "cyan3" "gray90"])
 '(auto-save-list-file-prefix "~/.emacs.d/var/auto-save-list/.saves-")
 '(autopep8-args " --max-line-length=120 --ignore=E501 -aaa -")
 '(autopep8-path "/usr/bin/autopep8")
 '(bbdb-layout-alist
   (quote
    ((one-line
      (order phone mail-alias mail notes)
      (name-end . 24)
      (toggle . t))
     (multi-line
      (omit creation-date timestamp name-format name-face bbdb-id asynk:owncloud0bbdb:cd asynk:owncloud0bbdb:bb folder)
      (indentation . 21)
      (toggle . t))
     (pop-up-multi-line
      (omit creation-date timestamp name-format name-face)
      (indentation . 21))
     (full-multi-line
      (indentation . 21)))))
 '(bbdb-merge-xfield-function-alist
   (quote
    ((creation-date . bbdb-merge-string-least)
     (timestamp . bbdb-merge-string-most)
     (bbdb-id . bbdb-merge-string-most)
     (asynk:owncloud0bbdb:cd . ignore)
     (notes: . bbdb-merge-concat-remove-duplicates)
     (bbdb-id . ignore))))
 '(bookmark-default-file "~/.emacs.d/var/bookmarks")
 '(browse-url-browser-function (quote browse-url-generic))
 '(browse-url-generic-program "iceweasel")
 '(c-default-style
   (quote
    ((c-mode . "linux")
     (c++-mode . "linux")
     (java-mode . "java")
     (awk-mode . "awk")
     (other . "gnu"))))
 '(column-number-mode t)
 '(company-ghc-show-info t)
 '(compilation-always-kill t)
 '(compilation-scroll-output t)
 '(cua-rectangle-mark-key [C-M-return])
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "025354235e98db5e7fd9c1a74622ff53ad31b7bde537d290ff68d85665213d85" "3a727bdc09a7a141e58925258b6e873c65ccf393b2240c51553098ca93957723" "6fe6ab4abe97a4f13533e47ae59fbba7f2919583f9162b440dd06707b01f7794" default)))
 '(default-input-method "catalan-prefix")
 '(dired-omit-files "^\\.?#\\|^\\.$\\|^\\.\\.$|.*\\.pyc$")
 '(ecb-options-version "2.40")
 '(ecb-source-path (quote ("~/code/")))
 '(ediff-split-window-function (quote split-window-horizontally))
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(eww-download-directory "~/INCOMING/")
 '(face-font-family-alternatives
   (quote
    (("Monospace" "Ttyp0" "courier" "fixed")
     ("courier" "CMU Typewriter Text" "fixed")
     ("Sans Serif" "helv" "helvetica" "arial" "fixed")
     ("helv" "helvetica" "arial" "fixed"))))
 '(fic-highlighted-words (quote ("FIXME" "TODO" "TODO:" "XXX" "BUG")))
 '(fill-column 120)
 '(flycheck-check-syntax-automatically (quote (save idle-change mode-enabled)))
 '(flycheck-checker-error-threshold 500)
 '(flycheck-idle-change-delay 5)
 '(font-use-system-font t)
 '(global-auto-complete-mode nil)
 '(global-git-gutter-mode t)
 '(global-prettify-symbols-mode t)
 '(global-semantic-idle-breadcrumbs-mode t nil (semantic/idle))
 '(global-yascroll-bar-mode t)
 '(grep-find-ignored-files
   (quote
    (".#*" "*.o" "*~" "*.bin" "*.lbin" "*.so" "*.a" "*.ln" "*.blg" "*.bbl" "*.elc" "*.lof" "*.glo" "*.idx" "*.lot" "*.fmt" "*.tfm" "*.class" "*.fas" "*.lib" "*.mem" "*.x86f" "*.sparcf" "*.dfsl" "*.pfsl" "*.d64fsl" "*.p64fsl" "*.lx64fsl" "*.lx32fsl" "*.dx64fsl" "*.dx32fsl" "*.fx64fsl" "*.fx32fsl" "*.sx64fsl" "*.sx32fsl" "*.wx64fsl" "*.wx32fsl" "*.fasl" "*.ufsl" "*.fsl" "*.dxl" "*.lo" "*.la" "*.gmo" "*.mo" "*.toc" "*.aux" "*.cp" "*.fn" "*.ky" "*.pg" "*.tp" "*.vr" "*.cps" "*.fns" "*.kys" "*.pgs" "*.tps" "*.vrs" "*.pyc" "*.pyo" "de_aqui_cap_avall_son_meves" "TAGS" "#*#")))
 '(haskell-tags-on-save t)
 '(history-delete-duplicates t)
 '(history-length 300)
 '(horizontal-scroll-bar-mode nil)
 '(image-dired-db-file "~/.emacs.d/var/image-dired/image-dired_db")
 '(image-dired-dir "~/.emacs.d/var/image-dired/")
 '(image-dired-gallery-dir "~/.emacs.d/var/image-dired/image-dired_gallery")
 '(image-dired-temp-image-file "~/.emacs.d/var/image-dired/image-dired_temp")
 '(imenu-auto-rescan t)
 '(indicate-buffer-boundaries (quote right))
 '(inhibit-startup-echo-area-message "whirm")
 '(inhibit-startup-screen t)
 '(insert-shebang-ignore-extensions (quote ("txt" "org" "el" "xml" "json")))
 '(ispell-extra-args
   (quote
    ("--sug-mode=ultra" "--run-together" "--run-together-limit=5" "--run-together-min=2")))
 '(list-colors-sort (quote luminance))
 '(magithub-use-ssl t)
 '(make-header-hook
   (quote
    (header-title header-blank header-file-name header-description header-author header-maintainer header-copyright header-creation-date header-commentary header-blank header-blank header-blank header-end-line header-history header-blank header-blank header-end-line header-free-software header-code header-eof)))
 '(minimap-width-fraction 0.1)
 '(popwin-mode t)
 '(popwin:popup-window-height 0.4)
 '(predictive-auto-learn t t)
 '(predictive-mode t)
 '(projectile-globally-ignored-files (quote ("TAGS" "*.pyc" "*.pyo" "*.elc")))
 '(projectile-known-projects-file "~/.emacs.d/var/projectile-bookmarks.eld")
 '(projectile-mode-line (quote Projectile))
 '(projectile-mode-line-lighter "" t)
 '(projectile-use-git-grep t)
 '(py-autopair-mode t)
 '(py-set-fill-column-p t)
 '(pylint-options "--output-format=parseable --max-line-length=120")
 '(python-fill-docstring-style (quote django))
 '(recentf-exclude (quote (".*/.mail/.*")))
 '(recentf-max-saved-items 50)
 '(recentf-mode t)
 '(recentf-save-file "~/.emacs.d/var/recentf")
 '(revert-without-query (quote ("*")))
 '(revive-plus:last-wconf-file "~/.emacs.d/var/revive/last-wconf")
 '(revive-plus:wconf-archive-file "~/.emacs.d/var/revive/wconf-archive")
 '(rm-blacklist
   (quote
    (" hl-p" " SliNav" " MRev" " Helm" " me" " Undo-Tree" " AC" " GitGutter" " pair" " Rbow" " Elpy" " ||")))
 '(rm-excluded-modes (quote (" hl-p" " SliNav" " MRev")))
 '(safe-local-variable-values
   (quote
    ((org-export-latex-append-header . "\\renewcommand\\@maketitle{%
  \\newpage
  \\null
  \\vskip 2em%
  \\begin{center}%
  \\let \\footnote \\thanks
    {% set colour and font for the title
    \\color{NavyBlue}\\sffamily\\bfseries\\Huge
    \\@title \\par}%
    \\vskip 1.5em%
    {% set colour and font for the author
      \\color{CornflowerBlue}\\sffamily\\large
      \\lineskip .5em%
      \\begin{tabular}[t]{c}%
        @author
      \\end{tabular}\\par}%
    \\vskip 1em%
    {% set colour and font for the date
    \\color{CornflowerBlue}\\sffamily\\large \\@date}%
  \\end{center}%
  \\par
  \\vskip 1.5em}
")
     (org-export-latex-append-header . "\\usepackage{graphicx}
\\usepackage{multicol}
\\geometry{headheight=47pt}
\\fancyhead[L]{\\LARGE This is the header title}
\\fancyfoot[L]{\\small Overridden filename\\\\ \\today}
")
     (org-confirm-babel-evaluate)
     (projectile-project-compilation-cmd . "ANSIBLE_NOCOWS=1 ansible-playbook forums_tribler.yml")
     (python-shell-interpreter . "ipython3")
     (python-shell-interpreter . ipython3)
     (eval ignore-errors "Write-contents-functions is a buffer-local alternative to before-save-hook"
           (add-hook
            (quote write-contents-functions)
            (lambda nil
              (delete-trailing-whitespace)
              nil))
           (require
            (quote whitespace))
           "Sometimes the mode needs to be toggled off and on."
           (whitespace-mode 0)
           (whitespace-mode 1))
     (whitespace-line-column . 80)
     (whitespace-style face tabs trailing lines-tail)
     (test-case-name . twisted\.protocols\.test\.test_basic)
     (helm-grep-preferred-ext . \.py)
     (pydb-cmdline . "/var/data/feina/code/delft/tribler/Tribler/Main/tribler.py")
     (eval setenv "DISPLAY" ":1")
     (header-auto-update-enabled))))
 '(scroll-bar-mode nil)
 '(semantic-imenu-auto-rebuild-directory-indexes t)
 '(semantic-mode t)
 '(semantic-symref-auto-expand-results t)
 '(semanticdb-default-save-directory "~/.emacs.d/var/semanticdb")
 '(send-mail-function (quote smtpmail-send-it))
 '(show-paren-mode t)
 '(starttls-extra-args (quote ("--tofu")))
 '(starttls-extra-arguments (quote ("--tofu")))
 '(tidy-shell-command "tidy")
 '(tls-checktrust (quote ask))
 '(tramp-auto-save-directory "~/.emacs.d/var/tramp-autosaves")
 '(tramp-default-method "scp")
 '(tramp-persistency-file-name "/home/whirm/.emacs.d/var/tramp")
 '(unicode-fonts-fallback-font-list (quote ("Ttyp0" "Symbola" "Quivira")))
 '(unicode-fonts-skip-fonts (quote ("Libertine Display O")))
 '(url-configuration-directory "~/.emacs.d/var/url/")
 '(url-privacy-level (quote (email os lastloc cookie)))
 '(virtualenv-root "/var/data/feina/code/propis/scatter/venv")
 '(w3m-default-display-inline-images t)
 '(wg-buffer-auto-association (quote strong))
 '(wg-load-last-workgroup t)
 '(wg-remap-bury-buffer nil)
 '(workgroups-everywhere t)
 '(workgroups-mode t)
 '(yascroll:delay-to-hide 1.0))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#191717" :foreground "#D2DEC4" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal :family "Terminus"))))
 '(ahs-face ((t (:background "gray15" :underline "burlywood4"))))
 '(ahs-plugin-whole-buffer-face ((t (:background "gray24"))))
 '(column-marker-1 ((t (:background "#250000"))))
 '(company-preview ((t (:background "gray22" :foreground "wheat"))))
 '(company-preview-common ((t (:inherit company-preview :foreground "dark khaki"))))
 '(company-scrollbar-bg ((t (:inherit company-tooltip :background "gray32"))))
 '(company-tooltip ((t (:background "gray34"))))
 '(company-tooltip-annotation ((t (:inherit company-tooltip :foreground "PaleTurquoise2"))))
 '(company-tooltip-common ((t (:inherit company-tooltip :foreground "yellow3"))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :foreground "dark khaki"))))
 '(company-tooltip-selection ((t (:inherit company-tooltip :background "dark slate gray"))))
 '(diff-refine-added ((t (:inherit diff-refine-change :background "#225522"))))
 '(diff-refine-removed ((t (:inherit diff-refine-change :background "#552222"))))
 '(diredp-file-name ((t (:foreground "gainsboro"))))
 '(diredp-file-suffix ((t (:foreground "dark gray"))))
 '(diredp-ignored-file-name ((t (:foreground "dim gray"))))
 '(error ((t (:foreground "firebrick" :weight bold))))
 '(fic-author-face ((t (:foreground "OrangeRed4"))))
 '(fic-face ((t (:background "gray22" :foreground "tomato2" :weight bold))))
 '(flycheck-error ((t (:underline "dark red"))))
 '(flycheck-fringe-warning ((t (:foreground "Orange4"))))
 '(flycheck-info ((t (:underline "dark slate gray"))))
 '(flycheck-warning ((t (:underline "DarkOrange4"))))
 '(flymake-errline ((t (:underline (:color "firebrick4" :style wave)))))
 '(flyspell-duplicate ((t (:underline (:color "sienna2" :style wave)))))
 '(flyspell-incorrect ((t (:underline (:color "tomato2" :style wave) :weight bold))))
 '(font-lock-comment-face ((t (:foreground "#666f75"))))
 '(font-lock-warning-face ((t (:inherit error :foreground "dark orange"))))
 '(fringe ((t (:background "gray17"))))
 '(git-gutter-fr:added ((t (:foreground "#256b64"))))
 '(git-gutter-fr:deleted ((t (:foreground "#8b0000"))))
 '(git-gutter-fr:modified ((t (:foreground "gray12"))))
 '(helm-ff-directory ((t (:foreground "steel blue"))))
 '(helm-ff-prefix ((t (:background "gray12" :foreground "tomato4"))))
 '(helm-ff-symlink ((t (:foreground "DeepSkyBlue3"))))
 '(helm-grep-finish ((t (:foreground "chartreuse3"))))
 '(helm-selection ((t (:background "#3a4a4a"))))
 '(helm-source-header ((t (:background "gray18" :weight bold))))
 '(highlight-current-line-face ((t (:background "wheat"))) t)
 '(highlight-indentation-current-column-face ((t (:inherit fringe :background "maroon4"))))
 '(highlight-symbol-face ((((class color) (background dark)) (:background "gray30"))) t)
 '(hydra-face-red ((t (:foreground "dark red" :weight bold))))
 '(link ((t (:foreground "Cyan3" :underline t))))
 '(magit-diff-add ((t (:foreground "pale green"))))
 '(magit-diff-del ((t (:foreground "indian red"))))
 '(magit-item-highlight ((t (:background "gray27"))))
 '(makefile-space ((t (:background "brown4"))))
 '(match ((t (:background "midnight blue"))))
 '(minimap-active-region-background ((t (:background "gray6"))) t)
 '(mumamo-background-chunk-major ((t (:background "#000025"))) t)
 '(mumamo-background-chunk-submode1 ((t (:background "#002500"))) t)
 '(newsticker-enclosure-face ((t (:background "dark olive green" :weight bold))))
 '(newsticker-old-item-face ((t (:foreground "SteelBlue4" :weight bold))))
 '(newsticker-statistics-face ((t (:foreground "gray22" :slant italic :height 0.8))))
 '(org-mode-line-clock ((t (:foreground "red" :box (:line-width -1 :style released-button)))))
 '(org-tag ((t (:foreground "gray26" :box (:line-width 1 :color "gray22") :weight bold))))
 '(outline-4 ((t (:inherit font-lock-comment-face :foreground "Lightskyblue3"))))
 '(pinot:search-item-title ((t (:inherit bold :height 1.1))) t)
 '(powerline-active1 ((t (:inherit mode-line :background "gray57"))) t)
 '(powerline-active2 ((t (:inherit mode-line :background "honeydew3"))) t)
 '(pp^L-highlight ((t (:background "black"))))
 '(realgud-overlay-arrow1 ((t (:foreground "Firebrick1" :weight bold))))
 '(realgud-overlay-arrow2 ((t (:foreground "Firebrick3" :weight bold))))
 '(realgud-overlay-arrow3 ((t (:foreground "Firebrick4" :weight bold))))
 '(success ((t (:foreground "green4" :weight bold))))
 '(vertical-border ((t (:foreground "#191717"))))
 '(yascroll:thumb-fringe ((t (:background "RoyalBlue4" :foreground "RoyalBlue4")))))
