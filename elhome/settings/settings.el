
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
 '(bbdb-pop-up-window-size 5)
 '(bookmark-default-file "~/.emacs.d/var/bookmarks")
 '(browse-url-browser-function (quote browse-url-generic))
 '(browse-url-generic-program "firefox")
 '(bts:project-cache-file "~/.emacs.d/var/bts-project")
 '(bts:query-cache-file "~/.emacs.d/var/bts-query")
 '(c-default-style
   (quote
    ((c-mode . "linux")
     (c++-mode . "linux")
     (java-mode . "java")
     (awk-mode . "awk")
     (other . "gnu"))))
 '(column-number-mode t)
 '(company-ghc-show-info t)
 '(company-go-show-annotation t)
 '(compilation-always-kill t)
 '(compilation-auto-jump-to-first-error nil)
 '(compilation-scroll-output t)
 '(cua-rectangle-mark-key [C-M-return])
 '(custom-safe-themes
   (quote
    ("7caa5745416ad85e6641331a8d0e837358f96e6019535c5f771f11394b289d41" "cbac98a075b19b3c741a636d3ac4d8a64367211807105448c1d13435ac581f09" "430160a22f573e60b0d139c0f327188525cf3ed571954d8b821ed38d3d30c610" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(custom-theme-directory "~/.emacs.d/elhome/themes")
 '(debug-on-error nil)
 '(default-input-method "catalan-prefix")
 '(dired-omit-files "^\\.?#\\|^\\.$\\|^\\.\\.$|.*\\.pyc$")
 '(ecb-options-version "2.40")
 '(ecb-source-path (quote ("~/code/")))
 '(ediff-split-window-function (quote split-window-horizontally))
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(erc-server-connect-function (quote wh-client-cert-open-network-stream))
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
 '(go-projectile-switch-gopath (quote maybe))
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
 '(kill-whole-line t)
 '(list-colors-sort (quote luminance))
 '(magit-diff-arguments (quote ("--no-ext-diff" "-M" "-C")))
 '(magithub-use-ssl t)
 '(make-header-hook
   (quote
    (header-title header-blank header-file-name header-description header-author header-maintainer header-copyright header-creation-date header-commentary header-blank header-blank header-blank header-end-line header-history header-blank header-blank header-end-line header-free-software header-code header-eof)))
 '(minimap-width-fraction 0.1)
 '(package-selected-packages (quote (queue ivy groovy-mode nil)))
 '(popwin-mode t)
 '(popwin:popup-window-height 0.4)
 '(predictive-auto-learn t t)
 '(predictive-mode t)
 '(prettify-symbols-unprettify-at-point (quote right-edge))
 '(pretty-control-l-mode t)
 '(projectile-globally-ignored-files (quote ("TAGS" "*.pyc" "*.pyo" "*.elc")))
 '(projectile-known-projects-file "~/.emacs.d/var/projectile-bookmarks.eld")
 '(projectile-mode-line (quote Projectile))
 '(projectile-mode-line-lighter "" t)
 '(projectile-use-git-grep t)
 '(pusher:centering-width 125)
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
    ((projectile-project-test-cmd . "nosetests Tribler/Test -x --failed")
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
     (go--coverage-current-file-name . ".coverage")
     (go-test-args . "--coverprofile=.coverage")
     (projectile-project-compilation-cmd . "ANSIBLE_NOCOWS=1 ansible-playbook forums_tribler.yml")
     (test-case-name . twisted\.web\.test\.test_web)
     (org-html-inline-images . t)
     (helm-grep-preferred-ext . \.py)
     (pydb-cmdline . "/var/data/feina/code/delft/tribler/Tribler/Main/tribler.py")
     (eval setenv "DISPLAY" ":1")
     (org-confirm-babel-evaluate)
     (header-auto-update-enabled))))
 '(scroll-bar-mode nil)
 '(select-enable-clipboard nil)
 '(select-enable-primary t)
 '(semantic-imenu-auto-rebuild-directory-indexes t)
 '(semantic-mode t)
 '(semantic-symref-auto-expand-results t)
 '(semanticdb-default-save-directory "~/.emacs.d/var/semanticdb")
 '(send-mail-function (quote smtpmail-send-it))
 '(show-paren-mode t)
 '(starttls-extra-args (quote ("--tofu")))
 '(starttls-extra-arguments (quote ("--tofu")))
 '(tags-revert-without-query t)
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
 '(weechat-auto-monitor-buffers t)
 '(weechat-buffer-kill-buffers-on-disconnect t)
 '(weechat-connect-hook (quote (weechat-re-monitor-buffers weechat-auto-monitor)))
 '(weechat-modules
   (quote
    (weechat-button weechat-complete weechat-spelling weechat-tracking weechat-image)))
 '(weechat-prompt "         [%10n] ")
 '(weechat-sync-buffer-read-status t)
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
 '(circe-highlight-nick-face ((t (:background "dark slate blue" :foreground "#82e2ed" :weight bold))))
 '(company-template-field ((t (:background "yellow4" :foreground "black"))))
 '(echoline-face ((t (:background "#1f2f2f"))))
 '(lui-track-bar ((t (:inherit default :background "DarkSlateGray" :height 0.1))))
 '(org-mode-line-clock ((t (:foreground "red" :box (:line-width -1 :style released-button)))))
 '(vhl/default-face ((t (:inherit nil :background "#20203b")))))
