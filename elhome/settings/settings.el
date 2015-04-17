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
 '(auto-save-list-file-prefix "~/.emacs.d/var/auto-save-list/.saves-")
 '(autopep8-args " --max-line-length=120 --ignore=E501 -a -")
 '(autopep8-path "/usr/bin/autopep8")
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
 '(company-auto-complete (quote (quote company-explicit-action-p)))
 '(company-auto-complete-chars (quote (41)))
 '(company-dabbrev-downcase nil)
 '(company-dabbrev-ignore-case t)
 '(company-minimum-prefix-length 1)
 '(company-show-numbers t)
 '(compilation-always-kill t)
 '(compilation-scroll-output t)
 '(cua-rectangle-mark-key [C-M-return])
 '(custom-safe-themes
   (quote
    ("6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "025354235e98db5e7fd9c1a74622ff53ad31b7bde537d290ff68d85665213d85" "3a727bdc09a7a141e58925258b6e873c65ccf393b2240c51553098ca93957723" "6fe6ab4abe97a4f13533e47ae59fbba7f2919583f9162b440dd06707b01f7794" default)))
 '(default-input-method "catalan-prefix")
 '(dired-omit-files "^\\.?#\\|^\\.$\\|^\\.\\.$|.*\\.pyc$")
 '(ecb-options-version "2.40")
 '(ecb-source-path (quote ("~/code/")))
 '(elpy-default-minor-modes (quote (eldoc-mode yas-minor-mode subword-mode)))
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-pyvenv elpy-module-highlight-indentation elpy-module-yasnippet elpy-module-sane-defaults)))
 '(elpy-rpc-project-specific t)
 '(elpy-test-runner (quote elpy-test-nose-runner))
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
 '(history-delete-duplicates t)
 '(history-length 300)
 '(hl-paren-colors
   (quote
    ("orange red" "dark orange" "gold" "yellow" "khaki1")))
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
 '(magit-commit-extend-override-date t)
 '(magit-diff-refine-hunk (quote all))
 '(magit-expand-staged-on-commit (quote full))
 '(magit-log-auto-more t)
 '(magit-log-format-graph-function (quote magit-log-format-unicode-graph))
 '(magit-process-popup-time 10)
 '(magit-restore-window-configuration t)
 '(magit-set-upstream-on-push t)
 '(magit-show-child-count t)
 '(magit-status-buffer-switch-function (quote switch-to-buffer))
 '(magithub-use-ssl t)
 '(make-header-hook
   (quote
    (header-title header-blank header-file-name header-description header-author header-maintainer header-copyright header-creation-date header-commentary header-blank header-blank header-blank header-end-line header-history header-blank header-blank header-end-line header-free-software header-code header-eof)))
 '(minimap-width-fraction 0.1)
 '(org-clock-persist-file "~/.emacs.d/var/org-clock-save.el")
 '(org-id-locations-file "~/.emacs.d/var/.org-id-locations")
 '(org-pomodoro-format ">%s<")
 '(org-pomodoro-play-sounds nil)
 '(popwin-mode t)
 '(popwin:popup-window-height 0.4)
 '(predictive-auto-learn t t)
 '(predictive-mode t)
 '(projectile-cache-file "~/.emacs.d/var/projectile.cache")
 '(projectile-completion-system (quote default))
 '(projectile-global-mode t)
 '(projectile-globally-ignored-directories
   (quote
    (".idea" ".eunit" ".git" ".hg" ".fslckout" ".bzr" "_darcs" ".tox" ".svn" "build" ".mail")))
 '(projectile-globally-ignored-files (quote ("TAGS" "*.pyc" "*.pyo" "*.elc")))
 '(projectile-known-projects-file "~/.emacs.d/var/projectile-bookmarks.eld")
 '(projectile-mode-line (quote Projectile))
 '(projectile-mode-line-lighter "")
 '(projectile-use-git-grep t)
 '(py-autopair-mode t)
 '(py-set-fill-column-p t)
 '(pylint-options "--output-format=parseable --max-line-length=120")
 '(recentf-exclude (quote (".*/.mail/.*")))
 '(recentf-max-saved-items 50)
 '(recentf-mode t)
 '(revert-without-query (quote ("*")))
 '(revive-plus:last-wconf-file "~/.emacs.d/var/revive/last-wconf")
 '(revive-plus:wconf-archive-file "~/.emacs.d/var/revive/wconf-archive")
 '(rm-blacklist
   (quote
    (" hl-p" " SliNav" " MRev" " Helm" " me" " Undo-Tree" " AC" " GitGutter" " pair" " Rbow" " Elpy" " ||")))
 '(rm-excluded-modes (quote (" hl-p" " SliNav" " MRev")))
 '(scroll-bar-mode nil)
 '(semantic-imenu-auto-rebuild-directory-indexes t)
 '(semantic-mode t)
 '(semantic-symref-auto-expand-results t)
 '(semanticdb-default-save-directory "~/.emacs.d/var/semanticdb")
 '(send-mail-function (quote smtpmail-send-it))
 '(show-paren-mode t)
 '(sml/hidden-modes (quote (" hl-p" " SliNav" " MRev")))
 '(sml/theme (quote dark))
 '(starttls-extra-args (quote ("--tofu")))
 '(starttls-extra-arguments (quote ("--tofu")))
 '(tidy-shell-command "tidy")
 '(tls-checktrust (quote ask))
 '(tramp-auto-save-directory "~/.emacs.d/var/tramp-autosaves")
 '(tramp-default-method "scp")
 '(unicode-fonts-fallback-font-list (quote ("Ttyp0" "Symbola" "Quivira")))
 '(unicode-fonts-skip-fonts (quote ("Libertine Display O")))
 '(unicode-progress-reporter-type "Triangles")
 '(url-configuration-directory "~/.emacs.d/var/url/")
 '(url-privacy-level (quote paranoid))
 '(virtualenv-root "/var/data/feina/code/propis/scatter/venv")
 '(w3m-default-display-inline-images t)
 '(wg-buffer-auto-association (quote strong))
 '(wg-load-last-workgroup t)
 '(wg-remap-bury-buffer nil)
 '(workgroups-everywhere t)
 '(workgroups-mode t)
 '(yas-prompt-functions
   (quote
    (yas-dropdown-prompt yas-completing-prompt yas-ido-prompt yas-no-prompt)))
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
 '(magit-diff-add ((t (:foreground "pale green"))))
 '(magit-diff-del ((t (:foreground "indian red"))))
 '(magit-item-highlight ((t (:background "gray27"))))
 '(match ((t (:background "midnight blue"))))
 '(minimap-active-region-background ((t (:background "gray6"))) t)
 '(mumamo-background-chunk-major ((t (:background "#000025"))) t)
 '(mumamo-background-chunk-submode1 ((t (:background "#002500"))) t)
 '(newsticker-enclosure-face ((t (:background "dark olive green" :weight bold))))
 '(newsticker-old-item-face ((t (:foreground "SteelBlue4" :weight bold))))
 '(newsticker-statistics-face ((t (:foreground "gray22" :slant italic :height 0.8))))
 '(org-mode-line-clock ((t (:foreground "red" :box (:line-width -1 :style released-button)))))
 '(org-tag ((t (:foreground "gray26" :box (:line-width 1 :color "gray22") :weight bold))))
 '(pinot:search-item-title ((t (:inherit bold :height 1.1))) t)
 '(powerline-active1 ((t (:inherit mode-line :background "gray57"))) t)
 '(powerline-active2 ((t (:inherit mode-line :background "honeydew3"))) t)
 '(realgud-overlay-arrow1 ((t (:foreground "Firebrick1" :weight bold))))
 '(realgud-overlay-arrow2 ((t (:foreground "Firebrick3" :weight bold))))
 '(realgud-overlay-arrow3 ((t (:foreground "Firebrick4" :weight bold))))
 '(success ((t (:foreground "green4" :weight bold))))
 '(yascroll:thumb-fringe ((t (:background "RoyalBlue4" :foreground "RoyalBlue4")))))
