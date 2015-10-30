;; local sources
(setq el-get-sources
      (append
       el-get-sources
       '(
         (:name async)
         (:name ucs-utils
                :type elpa)
         (:name list-utils
                :type elpa)
         (:name unicode-progress-reporter ;; Has to be loaded before smart-mode-line
                :type elpa
                :after (progn
                         (autoload 'unicode-progress-reporter-type "ucs-utils")
                         (setq unicode-progress-reporter-type "Triangles")
                         (unicode-progress-reporter-setup)))
         (:name smart-mode-line
                :after (progn
                         (require 'smart-mode-line)
                         (setq sml/theme 'dark
                               sml/hidden-modes '(" hl-p" " SliNav" " MRev")
                               ;; Separate the col-number with the number added by window-
                               sml/line-number-format " %2l")
                         (sml/setup)))
         (:name rich-minority)
         (:name emacs-async)
         (:name bind-key
                :type elpa
                :after (progn
                         (require 'bind-key)))

         (:name rw-ispell
                :type elpa)
         (:name rw-language-and-country-codes
                :type elpa)
         (:name rw-hunspell
                :type elpa
                :after (progn
                         ;; (require 'rw-hunspell)
                         ;; (setq ispell-extra-args '("--sug-mode=ultra")
                         ;;       ispell-program-name "hunspell"
                         ;;       rw-hunspell-dicpath-list '("/var/lib/dictionaries-common/hunspell" "/usr/share/hunspell")
                         ;;       rw-hunspell-make-dictionary-menu t
                         ;;       rw-hunspell-use-rw-ispell t)
                         ;; (rw-hunspell-setup)
                         )
                :depends (rw-ispell rw-language-and-country-codes))
         (:name goto-last-change
                :after (progn
                         (bind-key "C-<" 'goto-last-change-reverse)
                         (bind-key "C->" 'goto-last-change)))
         (:name swiper
                :after (progn
                         (bind-key "C-s" 'swiper)
                         (bind-key "C-r" 'swiper)
                         (bind-key "C-c C-r" 'ivy-resume)
                         ))
         (:name helm)
         ;; wgrep-helm won't work if this is not manually loaded first?
         (:name wgrep
                :type elpa)
         (:name wgrep-helm
                :type elpa)
         (:name helm-dash
                :after (progn
                         (setq helm-dash-docsets-path (concat user-emacs-directory "var/dash")
                               helm-dash-browser-func 'eww)
                         (add-hook 'python-mode-hook '(lambda ()
                                                        (setq-local helm-dash-docsets '("Python 2" "Twisted"))))
                         (add-hook 'tuareg-mode-hook '(lambda ()
                                                        (setq-local helm-dash-docsets '("OCaml"))))
                         ))
         (:name hydra)
         (:name which-key
                :after (progn
                         ;TODO: Customitzar aixo!
                         (which-key-mode)
                         (which-key-setup-side-window-right-bottom)
                        ))
         (:name undo-tree-mode
                :type builtin
                :after (progn
                         (add-hook 'emacs-startup-hook (lambda ()
                                                         (undo-tree-mode t)
                                                         ))))
         (:name visual-regexp
                :after (progn
                         (bind-key "C-c r" 'vr/replace global-map)
                         (bind-key "C-c q" 'vr/query-replace global-map)
                         ;; if you use multiple-cursors, this is for you:
                         (bind-key "C-c m" 'vr/mc-mark global-map)
                         ;; to use visual-regexp-steroids's isearch instead of the built-in regexp isearch, also include the following lines:
                         (bind-key "C-r" 'vr/isearch-backward esc-map) ;; C-M-r
                         (bind-key "C-s" 'vr/isearch-forward esc-map) ;; C-M-s
                         ))
         (:name visual-regexp-steroids
                :after (progn
                         (require 'visual-regexp-steroids)
                         ))
         (:name bbdb
                :after (progn
                         (require 'bbdb-anniv)
                         (autoload 'bbdb-insinuate-mu4e "bbdb-mu4e")
                         (bbdb-initialize 'message 'mu4e 'pgp)
                         ;;(bbdb-mua-auto-update-init 'message 'mu4e 'pgp)
                         (setq bbdb-mail-user-agent '(message-user-agent)
                               bbdb-mua-pop-up t
                               bbdb-mua-pop-up-window-size 5)
                         (add-hook 'mu4e-view-mode-hook 'bbdb-mua-auto-update)
                         (bind-key "R" 'bbdb-merge-records bbdb-mode-map)

                         ;; Already done in init-mu4e.el
                         ;;(setq mu4e-compose-complete-addresses nil)
                         ))
         (:name org-mode
                ;; :checkout "release_8.2.10"
                ;; :checkout "release_8.3beta" ;broken
                ;; :checkout "release_8.1.2"
                )
         (:name org-pomodoro
                :after (progn
                         (setq org-pomodoro-format ">%s<"
                               org-pomodoro-play-sounds nil)
                         (add-hook 'org-clock-in-hook (lambda ()
                                                        (if (not (bound-and-true-p org-timer-current-timer))
                                                            (org-pomodoro))))

                         (run-with-timer 60 (* 5 60)
                                         (lambda ()
                                           (if (and (boundp 'org-pomodoro-state) (eq org-pomodoro-state :none))
                                               (alert "Whatcha doin!?" :title "Pomodoro:\n")))
                                         )))
         (:name org-sync)
         (:name mu4e)
         (:name magit
                ;; :checkout "next"
                :info "Documentation"
                :compile "lisp/*.el"
                :depends (cl-lib dash)
                :load-path ("lisp"))
         (:name magit-gh-pulls)
         (:name magit-view-file)
         (:name org-magit)
         (:name elisp-slime-nav
                :after (progn
                         ;; Elisp go-to-definition with M-. and back again with M-,
                         (autoload 'elisp-slime-nav-mode "elisp-slime-nav")
                         (add-hook 'emacs-lisp-mode-hook (lambda () (elisp-slime-nav-mode t)))
                         ))
         (:name paredit)
         (:name paredit-everywhere)
         (:name asciidoc
                :after (progn
                         (autoload 'doc-mode "doc-mode" nil t)
                         (add-to-list 'auto-mode-alist '("\\.adoc$" . doc-mode))
                         (add-hook 'doc-mode-hook
                                   '(lambda ()
                                      (turn-on-auto-fill)
                                      ;;(require 'asciidoc)
                                      ))))

         (:name lisppaste)
         (:name anchored-transpose
                :after (progn
                         (global-set-key (kbd "C-c M-t") 'anchored-transpose)
                         ))
         (:name move-text
                :after (progn
                         ;; Move line-region around
                         (defun move-text-horizontal-internal (arg)
                           (if (and mark-active transient-mark-mode)
                               (progn
                                 (if (> (point) (mark))
                                     (exchange-point-and-mark))
                                 (let ((column (current-column))
                                       (text (delete-and-extract-region (point) (mark))))
                                   (right-char arg)
                                   (set-mark (point))
                                   (insert text)
                                   (exchange-point-and-mark)
                                   (setq deactivate-mark nil)))))

                         (defun move-text-left (arg)
                           "Move region arg lines left"
                           (interactive "*p")
                           (move-text-horizontal-internal (- arg)))

                         (defun move-text-right (arg)
                           "Move region arg lines right"
                           (interactive "*p")
                           (move-text-horizontal-internal arg))

                         (global-set-key (kbd "<M-S-up>") 'move-text-up)
                         (global-set-key (kbd "<M-S-down>") 'move-text-down)

                         (global-set-key (kbd "<M-S-left>") 'move-text-left)
                         (global-set-key (kbd "<M-S-right>") 'move-text-right)
                         ;;^
                         ))
         (:name indicators)

         (:name git-gutter-fringe
                :after (progn
                         (require 'git-gutter-fringe)
                         (global-git-gutter-mode t)
                         (add-hook 'prog-mode-hook (lambda ()
                                                     (local-set-key (kbd "<M-up>") 'git-gutter:previous-hunk)
                                                     (local-set-key (kbd "<M-down>") 'git-gutter:next-hunk)
                                                     ))
                         ))
         ;;(:name origami)
         (:name html-accent
                :after (progn
                         (autoload 'html-accent "html-accent" "Accent HTML" t)
                         (autoload 'accent-html "html-accent" "HTML codes to accent" t)
                         ))
         (:name expand-region
                :after (progn
                         (bind-key "C-z" 'er/expand-region)))
         (:name tramp
                :type builtin
                :after (progn
                         (setq tramp-backup-directory-alist backup-directory-alist)

                         ;; Bookmarks for ZSH
                         (defadvice bookmark-write-file
                             (after local-directory-bookmarks-to-zsh-advice activate)
                           (local-directory-bookmarks-to-zsh))

                         (defun local-directory-bookmarks-to-zsh ()
                           (interactive)
                           (when (and (require 'tramp nil t)
                                      (require 'bookmark nil t))
                             (set-buffer (find-file-noselect "~/.zsh.bmk" t t))
                             (delete-region (point-min) (point-max))
                             (insert "# -*- mode:sh -*-\n")
                             (let (collect-names)
                               (mapc (lambda (item)
                                       (let ((name (replace-regexp-in-string "-" "_" (car item)))
                                             (file (cdr (assoc 'filename
                                                               (if (cddr item) item (cadr item))))))
                                         (when (and (not (tramp-tramp-file-p file))
                                                    (file-directory-p file))
                                           (setq collect-names (cons (concat "~" name) collect-names))
                                           (insert (format "%s=\"%s\"\n" name (expand-file-name file) name)))))
                                     bookmark-alist)
                               (insert ": " (mapconcat 'identity collect-names " ") "\n"))
                             (let ((backup-inhibited t)) (save-buffer))
                             (kill-buffer (current-buffer))))
                         ;;^
                         ))
         (:name nose
                :after (progn
                         (require 'nose)
                         ;; TODO: those local keys do nothing, they should be enabled when in programming modes
                         (local-set-key "\C-ca" 'nosetests-all)
                         (local-set-key "\C-cm" 'nosetests-module)
                         (local-set-key "\C-c." 'nosetests-one)
                         (local-set-key "\C-cpa" 'nosetests-pdb-all)
                         (local-set-key "\C-cpm" 'nosetests-pdb-module)
                         (local-set-key "\C-cp." 'nosetests-pdb-one)
                         ))
         (:name whole-line-or-region
                :after (progn
                         (whole-line-or-region-mode)
                         (bind-key "M-w" 'whole-line-or-region-kill-ring-save)
                         ))
         (:name column-marker
                :after (progn
                         ;; Highlight character at "fill-column" position.
                         (require 'column-marker)
                         (add-hook 'python-mode-hook
                                   (lambda () (interactive)
                                     (column-marker-1 fill-column)))
                         ))
         ;; (:name twittering-mode
         ;;        :after (progn
         ;;                  (add-hook 'twittering-mode-hook
         ;;                            (setq twittering-use-master-password t)
         ;;                            (twittering-icon-mode t)
         ;;                            )
         ;;                  )
         ;;        )
         ;; (:name annoying-arrows-mode
         ;;        :after (progn
         ;;                 (annoying-arrows-mode)
         ;;                 )
         ;;        )
         (:name fic-mode
                :after (progn
                         (add-hook 'prog-mode-hook 'fic-mode t)
                         ))
         ;;(:name emacs-goodies-el :type apt-get)
         (:name wrap-region
                :depends (dash)
                :after (progn
                         (require 'wrap-region)
                         (wrap-region-add-wrappers
                          '(("*" "*" nil org-mode)
                            ("~" "~" nil org-mode)
                            ("/" "/" nil org-mode)
                            ("=" "=" nil org-mode)
                            ("_" "_" nil org-mode)
                            ("$" "$" nil (org-mode latex-mode))))
                         (add-hook 'org-mode-hook 'wrap-region-mode)
                         (add-hook 'latex-mode-hook 'wrap-region-mode)))
         (:name autopair
                :after (progn
                         (add-hook 'prog-mode-hook (lambda ()
                                                     (autopair-mode t)
                                                     ))
                         ))
         (:name highlight-parentheses
                :after (progn
                         (require 'highlight-parentheses)
                         (setq hl-paren-colors '("orange red" "dark orange" "gold" "yellow" "khaki1"))
                         (add-hook 'prog-mode-hook (lambda ()
                                                     (highlight-parentheses-mode t)
                                                     ))
                         ))
         (:name ansible
                ;; needs to go before yasnippet
                :after (progn
                         ;;(require 'ansible)
                         (bind-key "C-c C-c" 'compile ansible::key-map)
                         ))
         (:name yasnippet
                :after (progn
                         (require 'yasnippet)

                         (yas-global-mode 1)
                         ;;(yas-load-directory "~/.emacs.d/elhome/snippets")
                         (setq yas-snippet-dirs (delete "~/.emacs.d/snippets" yas-snippet-dirs)
                               yas-prompt-functions '(yas-dropdown-prompt
                                                      yas-completing-prompt
                                                      yas-ido-prompt
                                                      yas-no-prompt)
                               yas-use-menu nil)
                         (add-to-list 'yas-snippet-dirs '"~/.emacs.d/elhome/snippets")

                         ;; I don't want to have yasnippet on TAB
                         (unbind-key "TAB" yas-minor-mode-map)
                         ;; Strangely, just redefining one of the variations below won't work.
                         ;; All rebinds seem to be needed.
                         (define-key yas-minor-mode-map [(tab)]        nil)
                         (define-key yas-minor-mode-map (kbd "TAB")    nil)
                         (define-key yas-minor-mode-map (kbd "<tab>")  nil)
                         ))
         (:name helm-c-yasnippet
                :after (progn
                         (bind-key "<C-tab>" 'helm-yas-complete yas-minor-mode-map)
                         ))
         (:name popwin
                :after (progn
                         (require 'popwin)
                         (popwin-mode 1)
                         ))
         (:name header2
                :after (progn
                         (require 'header2)
                         (add-hook 'write-file-hooks 'auto-update-file-header)
                         (add-hook 'prog-mode-hook 'auto-make-header t)
                         ))
         ;; (:name cask)
         (:name flycheck
                :after (progn
                         (global-flycheck-mode 1)
                         ))
         (:name lua-block
                :after (progn
                         ;;(require 'lua-block) ;; It always gets enabled on all buffers?
                         ))
         (:name yascroll
                :after (progn
                         (global-yascroll-bar-mode 1)
                         ))
         (:name dired+
                :after (progn
                         (toggle-diredp-find-file-reuse-dir 1)

                         ;; Enable toggling of uninteresting files.
                         (setq dired-omit-files-p t)

                         ;; Make dired go to first file/last file instead of first line/last line with C-[<>]
                         (defun dired-back-to-top ()
                           (interactive)
                           (beginning-of-buffer)
                           (dired-next-line 4))

                         (define-key dired-mode-map
                           (vector 'remap 'beginning-of-buffer) 'dired-back-to-top)

                         (defun dired-jump-to-bottom ()
                           (interactive)
                           (end-of-buffer)
                           (dired-next-line -1))

                         (define-key dired-mode-map
                           (vector 'remap 'end-of-buffer) 'dired-jump-to-bottom)
                         ;;^
                         ))
         (:name markdown-mode
                :after (progn
                         (require 'markdown-mode)))
         (:name sx)
         (:name shorten) ;; tracking depends on it
         (:name tracking
                ;; weechat-tracking module depends on it
                :after (progn
                         (require 'tracking)))
         (:name weechat
                :after (progn
                         ))
         ;; Circe doesn't support client cert auth either :(
         ;; (:name circe
         ;;        :type elpa
         ;;        :after (progn
         ;;                 (setq circe-network-options
         ;;                       '(("Freenode"
         ;;                          :tls t
         ;;                          :nick "whirm"
         ;;                          :sasl-username "whirm"
         ;;                          :sasl-password "my-password"
         ;;                          :channels ("#emacs-circe")
         ;;                          )))))

         ;; (:name erc
         ;;        ;; │18:51:40        whirm | is anybody using ERC/circe with client side cert auth?
         ;;        ;; │18:55:20  wgreenhouse | whirm: it's possible with ERC, through tweaking erc-server-connect-function
         ;;        ;; │18:55:35  wgreenhouse | to a version that supplies a :client-certificate arg to open-network-stream
         ;;        ;; │18:55:47  wgreenhouse | probably you could do the same hack with circe
         ;;        ;; │18:56:42        whirm | wgreenhouse: ok, I'll try that. Thanks
         ;;        ;; │18:56:48  wgreenhouse | whirm: I may try it soon for ERC on OFTC, I'll let you know if it worked.
         ;;        ;; │19:02:01   fledermaus | whirm: passing a :client-certificate value of t will automatically search auth-sources for a certificate
         ;;        ;; │                      | and key, so you could put those in your ~/.netrc and it would magically work.
         ;;        :after (progn
         ;;                 (require 'erc)
         ;;                 (add-to-list 'tls-program "gnutls-cli --tofu --priority SECURE256 --x509cafile ~/.ssl/spi_ca.pem --x509certfile ~/.ssl/certs/whirm.pem -p %p %h")
         ;;                 (defun wh-client-cert-open-network-stream (&rest args)

         ;;                 (defun wh-client-cert-open-network-stream (&rest args)
         ;;                   (let (
         ;;                         (my_args (append args '(:client-certificate t) ))
         ;;                         )
         ;;                     (apply open-network-stream my_args))
         ;;                   )

         ;;                 ;; (setq
         ;;                 ;;  (erc-server-connect-function wh-client)
         ;;                 ;;  )
         ;;                 (defun gnutls-available-p ()
         ;;                   "Function redefined in order not to use built-in GnuTLS support"
         ;;                   nil)

         ;;                 (defun irc-connect()
         ;;                   "Start ERC for all the networks I use."
         ;;                   (interactive)
         ;;                   (erc-tls :server "chat.freenode.net" :port 6697 :nick "whirm")
         ;;                   (erc-tls :server "irc.oftc.net"      :port 6697 :nick "whirm")
         ;;                   (erc :server "localhost" :nick "whirm")
         ;;                   )
         ;;                 ;;
         ;;                 ;; TODO Check and install these extensions if I use ERC
         ;;                 ;; erc-extension
         ;;                 ;; erc-extras
         ;;                 ;; erc-highlight-nicknames
         ;;                 ;; erc-nick-notify
         ;;                 ;;
         ;;                 ;; stuff to set if I decide to use erc again

         ;;                 (setq
         ;;                  erc-auto-query '(window)
         ;;                  erc-autoaway-mode t
         ;;                  erc-autojoin-channels-alist '((("freenode.net" "#emacs" "#tribler") ("oftc.net" "#awesome") ("localhost" "&bitlbee")))
         ;;                  erc-autojoin-mode t
         ;;                  erc-autojoin-timing '(ident)
         ;;                  erc-emacswiki-lisp-url "http://www.emacswiki.org/elisp/"
         ;;                  erc-frame-dedicated-flag t
         ;;                  erc-log-channels-directory "~/.emacs.d/var/erc/logs/"
         ;;                  erc-log-mode t
         ;;                  erc-modules '((autoaway autojoin button capab-identify completion dcc log move-to-prompt ring services smiley stamp track highlight-nicknames autojoin button capab-identify dcc fill irccontrols list log match menu move-to-prompt netsplit networks noncommands notify notifications readonly ring services smiley stamp spelling track truncate))
         ;;                  erc-netsplit-mode t
         ;;                  erc-nick "whirm"
         ;;                  erc-nick-uniquifier "_"
         ;;                  erc-nickserv-identify-mode '(autodetect)
         ;;                  erc-nickserv-passwords nil
         ;;                  erc-pcomplete-mode t
         ;;                  erc-prompt-for-nickserv-password nil
         ;;                  erc-services-mode t
         ;;                  erc-stamp-mode t
         ;;                  erc-track-exclude-server-buffer t
         ;;                  erc-track-minor-mode t
         ;;                  erc-track-mode t
         ;;                  erc-truncate-mode t
         ;;                  )
         ;;                 ;;faces:
         ;;                 ;;  '(erc-input-face ((t (:foreground "gray52"))) t)
         ;;                 ;; '(erc-notice-face ((t (:foreground "gray28" :weight bold))) t)
         ;;                 ;; '(erc-timestamp-face ((t (:foreground "chartreuse4" :weight bold))) t)
         ;;                 ))

         ;; (:name deferred-flyspell
         ;;        :after (progn
         ;;                 ;; (deferred-flyspell:config)
         ;;                 ;; Use flyspell now that deferred-flyspell is enabled
         ;;                 ;;(add-hook 'prog-mode-hook 'flyspell-prog-mode t)
         ;;                 ;;(add-hook 'message-mode-hook 'flyspell-mode t)
         ;;                 ;; (add-hook 'text-mode-hook 'flyspell-mode t)
         ;;                 ;;^
         ;;                 ))
         (:name insert-shebang
                :type elpa
                :after (progn
                         ;; (add-hook 'find-file-hook 'insert-shebang)
                         ))
         (:name evil-numbers
                :after (progn
                         (global-set-key (kbd "C-c +") 'evil-numbers/inc-at-pt)
                         (global-set-key  (kbd "C-c -") 'evil-numbers/dec-at-pt)
                         ))
         (:name flyguess
                :type emacswiki
                :after (progn
                         (autoload 'flyguess-guess "flyguess")

                         (setq flyguess-check-percentage 50
                               flyguess-mininum-buffer-size 200
                               flyguess-dictionary-list '("ca_ES_hunspell" "en_US_hunspell" "es_ES_hunspell"))

                         ;; Activate Flyguess when composing a mail
                         ;; (add-hook 'mu4e-compose-mode-hook 'flyguess-guess)

                         ;; When the language is guessed, change the dictionary, activate flyspell
                         ;; and recheck the buffer
                         (add-hook 'flyguess-guessed-hook (lambda (dictionary)
                                                            (message dictionary)
                                                            (ispell-change-dictionary dictionary)
                                                            (flyspell-mode 1)
                                                            (flyspell-buffer)))
                         ))
         (:name tuareg-mode
                :after (progn
                         (add-to-list 'auto-mode-alist '("\\.eliom\\'" . tuareg-mode))

                         (add-hook 'tuareg-mode-hook (lambda ()
                                                       (setq tuareg-interactive-program "utop")
                                                       (bind-key "C-z" 'merlin-enclosing-expand tuareg-mode-map)
                                                       ))))
         (:name utop)
         (:name merlin
                :after (progn
                         ;; Add opam emacs directory to the load-path
                         (setq opam-share (substring (shell-command-to-string "opam config var share 2> /dev/null") 0 -1))
                         (add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))

                         ;; Start merlin on ocaml files
                         (add-hook 'tuareg-mode-hook 'merlin-mode t)
                         (add-hook 'caml-mode-hook 'merlin-mode t)

                         ;; Enable auto-complete
                         (setq merlin-use-auto-complete-mode 'easy)

                         ;; Use opam switch to lookup ocamlmerlin binary
                         (setq merlin-command 'opam)

                         ;; Take a look at https://github.com/the-lambda-church/merlin for more information

                         (require 'ocp-indent)
                         (require 'ocp-index)
                         ))
         (:name rainbow-mode
                :type elpa
                ;; This minor mode sets background color to strings that match color
                ;; names, e.g. #0000ff is displayed in white with a blue background.
                :after (progn
                         (add-hook 'prog-mode-hook (lambda ()
                                                     (rainbow-mode t)
                                                     ))
                         ))
         (:name perspective
                ;; :checkout "b37f9e54f8cace9949565cb0180e06d4625152ec"
                )
         (:name projectile
                ;; :checkout "74afdbbdbb5ee472571d3741fe64d3832881e5ef"
                :after (progn
                         (setq projectile-cache-file "~/.emacs.d/var/projectile.cache"
                               projectile-completion-system 'helm
                               projectile-global-mode t
                               projectile-known-projects-file "~/.emacs.d/var/projectile-bookmarks.eld"
                               projectile-mode-line 'Projectile
                               projectile-mode-line-lighter ""
                               projectile-use-git-grep t)
                         (eval-after-load 'projectile
                           '(progn
                              (dolist (item (list "build" ".mail"))
                                (add-to-list 'projectile-globally-ignored-directories item))
                              (dolist (item (list "*.pyc" "*.pyo" "*.elc"))
                                (add-to-list 'projectile-globally-ignored-files item))))
                         (projectile-global-mode t)
                         ))
         (:name iedit)
         ;; (:name eww-lnum)
         (:name web-mode
                :after (progn
                         (require 'web-mode)
                         (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
                         (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
                         (add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
                         (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
                         (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
                         (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
                         (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
                         (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
                         ))
         (:name realgud
                :after (progn
                         (defun xars-grizzl-select-cmdbuf()
                           "Lets the user select a realgud command buffer, unless there's a single
command buffer, in which case returns the buffer directly."
                           (interactive)
                           (let ((cmdbuffers (-select #'realgud-cmdbuf? (buffer-list))))
                             (if (> (length cmdbuffers) 1)
                                 (let* ((cmdbuffers-names (-map #'buffer-name cmdbuffers))
                                        (cmdbuffers-index (grizzl-make-index cmdbuffers-names)))
                                   (let ((selection (grizzl-completing-read
                                                     "Debugger Buffer: " cmdbuffers-index)))
                                     (when selection
                                       (message "Selected debugger %s" selection)
                                       (get-buffer selection))))
                               ;; else (no buffer or a single one)
                               (car cmdbuffers))))

                         (defun xars-attach-to-cmdbuf ()
                           "Attaches current buffer to a debugging session."
                           (interactive)
                           (-when-let (cmdbuf (xars-grizzl-select-cmdbuf))
                             (message "Attaching current buffer %s to command buffer %s"
                                      (current-buffer) cmdbuf)
                             (realgud-srcbuf-init-or-update (current-buffer) cmdbuf)))

                         ))
         (:name window-numbering
                :after (progn
                         (window-numbering-mode t)
                         ))
         (:name ace-jump-mode
                :after (progn
                         (global-set-key (kbd "M-SPC")  'ace-jump-word-mode)
                         ))
         (:name pyvenv) ;; elpy fails to install if this is not installed before?
         (:name virtualenv)
         (:name auto-complete
                ;; kill the recipe's post-init so it doesn't enable auto-complete-mode globally as I use company-mode.
                :post-init ())
         (:name company-mode
                ;;:checkout "0.8.0"
                :after (progn
                         (setq company-auto-complete 'company-explicit-action-p
                               company-auto-complete-chars '(41)
                               company-bbdb-modes '(message-mode mu4e:compose)
                               company-dabbrev-downcase nil
                               company-dabbrev-ignore-case t
                               company-minimum-prefix-length 1
                               company-quickhelp-mode t
                               company-show-numbers t)
                         (global-company-mode 1)
                         ))
         (:name company-quickhelp)
         (:name elpy
                ;; :checkout "release"
                :checkout "master"
                :after (progn
                         (setq elpy-default-minor-modes '(eldoc-mode yas-minor-mode subword-mode)
                               elpy-rpc-project-specific t
                               elpy-test-runner 'elpy-test-nose-runner)
                         (eval-after-load 'elpy
                           '(progn
                              (dolist (item (list 'elpy-module-eldoc 'elpy-module-flymake))
                                (delete item elpy-modules))
                              ))


                         (require 'elpy)
                         (elpy-enable)
                         (elpy-use-ipython)

                         ;;Disabled hooks they have conflicting keybinds
                         (remove-hook 'python-mode-hook 'pylint-add-key-bindings)
                         (remove-hook 'python-mode-hook 'pylint-add-menu-items)
                         ;;(add-hook 'python-mode-hook 'py-autopair-mode-on)

                         ;; C-c C-% will set a buffer local hook to use mode-compile after saving
                         (global-set-key '[(ctrl c) (%)]
                                         (lambda ()
                                           (interactive)
                                           (if (member 'mode-compile-quiet after-save-hook)
                                               (progn
                                                 (setq after-save-hook
                                                       (remove 'projectile-compile-project after-save-hook))
                                                 (message "No longer compiling after saving."))
                                             (progn
                                               (add-to-list 'after-save-hook 'projectile-compile-project)
                                               (message "Compiling after saving.")))))
                         ))
         (:name elfeed
                :after (progn
                         (setq elfeed-db-directory (concat user-emacs-directory "/var/elfeed/")
                               elfeed-sort-order 'ascending)))
         (:name align
                :after (progn
                         (require 'align)))

         ;; From there on stuff in trial phase.
         (:name bts-github
                :after (progn
                         (require 'bts-github)))
         (:name yaml-mode
                :after (progn
                         (add-hook 'yaml-mode-hook (lambda ()
                                                     (bind-key "C-c C-c" 'compile yaml-mode-map)))))
         (:name package
                :post-init (progn
                             ;; The following overrides the upstream recipe's post-init to not add
                             ;; (broken) package repositories I don't want to my list.

                             ;; add package.rcp's old `package-user-dir' to
                             ;; `package-directory-list', in case there are
                             ;; packages installed there from before
                             (let ((old-package-user-dir
                                    (expand-file-name
                                     (convert-standard-filename
                                      (concat (file-name-as-directory
                                               default-directory)
                                              "elpa")))))
                               (when (file-directory-p old-package-user-dir)
                                 (add-to-list 'package-directory-list old-package-user-dir)))
                             ;; Ensure `package-archives' is defined
                             (setq package-archives (bound-and-true-p package-archives))))
         ;; Haskell stuff
         (:name haskell-mode
                :after (progn
                         (custom-set-variables '(haskell-tags-on-save t))
                         (add-hook 'haskell-mode-hook 'haskell-indentation-mode)))
         (:name hindent
                :after (progn
                         (add-hook 'haskell-mode-hook #'hindent-mode)))
         (:name ghc-mod
                :after (progn
                         (add-hook 'haskell-mode-hook (lambda () (ghc-init) (hare-init)))))
         (:name company-ghc
                :after (progn
                         (add-to-list 'company-backends 'company-ghc)
                         (custom-set-variables '(company-ghc-show-info t))))
         (:name structured-haskell-mode)
         ;; Full recipes I have to make into PR's to upstream
         (:name jenkins
                :dpends (dash json)
                :type github
                :branch "master"
                :pkgname "rmuslimov/jenkins.el"
                :after (progn
                         (setq jenkins-api-token "bc7834c1ba369c94e0446fbaa3799575"
                               jenkins-url "https://jenkins.tribler.org/"
                               jenkins-username "whirm")
                         ;; (setq jenkins-viewname "<viewname>") ;; if you're not using views skip this line
                         )
                )
         (:name org-pretty-table
                :depends (org-mode)
                :type github
                :branch "master"
                :pkgname "Fuco1/org-pretty-table"
                )
         (:name org-html-themes
                :depends (org-mode)
                :type github
                :branch "master"
                :pkgname "fniessen/org-html-themes"
                :prepare (progn
                           (setq org-html-themes-dir default-directory)))
         )))

(setq my-packages
      (append
       my-packages
       (mapcar 'el-get-source-name el-get-sources)
       '(
         ;; rudel  http://www.emacswiki.org/emacs/Rudel (gobby compatible collaborative text editor)
         align-by-current-symbol
         align-let
         android-mode
         ansible-doc
         auto-install
         autopair
         autopep8
         autosmiley
         cl-lib
         clevercss ;; TODO: is this still needed if using web-mode?
         css-palette
         cssh
         ein
         ;; ical-pull
         ;; ess
         ess-smart-underscore
         fringe-helper
         fuzzy
         gist
         git-timemachine
         gnuplot-mode
         guru-mode
         jam-mode
         linum-relative
         list-utils ;; something depends on this but is not on the recipe
         lua-mode
         magit-view-file
         mingus
         newpaste
         nodejs-repl
         nsis-mode
         org-caldav ;; TODO configure!
         page-break-lines
         popup
         swank-js
         tidy
         unbound
         vkill
         volatile-highlights
         xcscope+
         )))

(el-get-cleanup my-packages)
(el-get 'sync my-packages)
