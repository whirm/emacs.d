;; local sources
(setq el-get-sources
      (append
       el-get-sources
       '(
         (:name notify)
         (:name ucs-utils
                :type elpa)
         (:name list-utils
                :type elpa)
         (:name unicode-progress-reporter ;; Has to be loaded before smart-mode-line
                :type elpa
                :after (progn
                         (unicode-progress-reporter-setup)
                         )
                )

         (:name smart-mode-line
                :after (progn
                         (require 'smart-mode-line)
                         (setq sml/theme 'dark)
                         ;; Separate the col-number with the number added by window-numbering
                         (setq sml/line-number-format " %2l")
                         (sml/setup)
                         )
                )
         (:name rich-minority)
         (:name emacs-async)
         (:name rw-ispell
                :type elpa)
         (:name rw-language-and-country-codes
                :type elpa)
         (:name rw-hunspell
                :type elpa
                :after (progn
                         (setq ispell-extra-args (quote ("--sug-mode=ultra")))
                         (setq ispell-program-name "hunspell")
                         (setq rw-hunspell-dicpath-list (quote ("/var/lib/dictionaries-common/hunspell" "/usr/share/hunspell")))
                         (setq rw-hunspell-make-dictionary-menu t)
                         (setq rw-hunspell-use-rw-ispell t)
                         (rw-hunspell-setup)
                         )
                :depends (rw-ispell rw-language-and-country-codes)
                )
         (:name goto-last-change
                :after (progn
                         (global-set-key (kbd "C-<") 'goto-last-change-reverse)
                         (global-set-key (kbd "C->") 'goto-last-change)
                         ))
         (:name helm
                ;;:checkout "b7ccbb082ea68bd4a8f505d7a20ef4a8af939be0" ;; works fine
                :after (progn
                         (require 'helm-config)
                         ;; TODO: check why this makes helm not find any results when grepping
                         ;; (setq
                         ;;  helm-grep-default-command "ack-grep -Hn --no-group --no-color %e %p %f"
                         ;;  helm-grep-default-recurse-command "ack-grep -H --no-group --no-color %e %p %f")
                         (setq
                          helm-adaptive-history-file "~/.emacs.d/var/helm-adaptive-history"
                          helm-bookmark-show-location t
                          helm-boring-file-regexp-list (quote ("\\.git$" "\\.hg$" "\\.svn$" "\\.CVS$" "\\._darcs$" "\\.la$" "\\.o$" "~$" "\\.pyo$" "\\.pyc$" "\\.elc$" "^#.*#$"))
                          helm-buffer-max-length 40
                          helm-ff-skip-boring-files t
                          helm-ff-tramp-not-fancy nil
                          helm-findutils-ignore-boring-files t
                          helm-for-files-preferred-list (quote (helm-source-buffers-list helm-source-recentf helm-source-bookmarks helm-source-file-cache helm-source-files-in-current-dir))
                          helm-imenu-delimiter " → "
                          helm-locate-command "locate %s -r %s"
                          helm-mode t
                          helm-quick-update t
                          helm-split-window-default-side (quote same)
                          )

                         (helm-mode 1)
                         (helm-adaptative-mode 1)

                         ;; Use helm
                         (global-set-key (kbd "C-M-p") 'helm-semantic-or-imenu)
                         (global-unset-key (kbd "C-q"))
                         (global-set-key (kbd "C-q") 'helm-mini)
                         (global-unset-key (kbd "M-C-q"))
                         (global-set-key (kbd "M-C-q") 'helm-for-files)

                         (global-unset-key (kbd "M-x"))
                         (global-set-key (kbd "M-x") 'helm-M-x)

                         (global-unset-key (kbd "M-y"))
                         (global-set-key (kbd "M-y") 'helm-show-kill-ring)

                         (define-key global-map [remap find-file] 'helm-find-files)
                         (define-key global-map [remap occur] 'helm-occur)
                         (define-key global-map [remap list-buffers] 'helm-buffers-list)
                         (define-key lisp-interaction-mode-map [remap completion-at-point] 'helm-lisp-completion-at-point)
                         (define-key emacs-lisp-mode-map       [remap completion-at-point] 'helm-lisp-completion-at-point)

                         (defun helm-projectile-grep ()
                           "like projectile-grep but with helm :D"
                           (interactive)
                           (helm-do-grep-1 (list (projectile-project-root)) t)
                           )

                         (defun helm-mini-devel ()
                           "helm-mini for prog-modes (TODO entries, helm-projectile, buffers and recentf)"
                           (interactive)
                           (require 'helm-files)
                           (require 'helm-misc)
                           (require 'helm-projectile)
                           (let ((helm-ff-transformer-show-only-basename nil))
                             (helm-other-buffer '(helm-source-fixme
                                                  helm-source-projectile-buffers-list
                                                  helm-source-projectile-recentf-list
                                                  helm-source-projectile-files-list
                                                  helm-source-buffers-list
                                                  helm-source-recentf
                                                  helm-source-buffer-not-found)
                                                "*helm mini devel*")))

                         (add-hook 'projectile-mode-hook (lambda ()
                                                           (local-set-key (kbd "C-q") 'helm-mini-devel)
                                                           (local-set-key (kbd "C-c g") 'helm-projectile-grep)
                                                           (local-set-key (kbd "C-S-M-p") 'helm-etags-select)
                                                           ))

                         (defalias 'grep 'helm-do-grep)
                         )
                )
         ;; wgrep-helm won't work if this is not manually loaded first?
         (:name wgrep
                :type elpa
                :after (progn
                         (require 'wgrep)
                         ))
         (:name wgrep-helm
                :type elpa)

         (:name undo-tree-mode
                :type builtin
                :after (progn
                         (add-hook 'emacs-startup-hook (lambda ()
                                                         (undo-tree-mode t)
                                                         ))))
         (:name bbdb)
         (:name org-mode)
         ;; (:name org-pomodoro
         ;;        :after (progn
         ;;                 (add-hook 'org-clock-in-hook (lambda ()
         ;;                                                (if (not org-timer-current-timer)
         ;;                                                    (org-pomodoro))))
         ;;                 ))
         (:name org-sync)
         (:name mu4e)
         (:name magit
                ;;:checkout "next"
                :after (progn
                         (global-set-key (kbd "C-x C-z") 'magit-status)

                         ;;;;;;;
                         ;; Toggle show whitespace-only changes with "W"
                         (defun magit-toggle-whitespace ()
                           (interactive)
                           (if (member "-w" magit-diff-options)
                               (magit-dont-ignore-whitespace)
                             (magit-ignore-whitespace)))

                         (defun magit-ignore-whitespace ()
                           (interactive)
                           (add-to-list 'magit-diff-options "-w")
                           (message "Ignoring whitespace changes")
                           (magit-refresh))

                         (defun magit-dont-ignore-whitespace ()
                           (interactive)
                           (setq magit-diff-options (remove "-w" magit-diff-options))
                           (message "Not ignoring whitespace changes")
                           (magit-refresh))
                         ;; EO Toggle whitespace
                         ;;;;;;;
                         ))
         (:name elisp-slime-nav
                :after (progn
                         ;; Elisp go-to-definition with M-. and back again with M-,
                         (autoload 'elisp-slime-nav-mode "elisp-slime-nav")
                         (add-hook 'emacs-lisp-mode-hook (lambda () (elisp-slime-nav-mode t)))
                         ))
         (:name asciidoc
                :after (progn
                         (autoload 'doc-mode "doc-mode" nil t)
                         (add-to-list 'auto-mode-alist '("\\.adoc$" . doc-mode))
                         (add-hook 'doc-mode-hook
                                   '(lambda ()
                                      (turn-on-auto-fill)
                                      (require 'asciidoc)
                                      ))))

         (:name lisppaste)
         (:name anchored-transpose
                :after (progn
                         (global-set-key (kbd "C-c M-t") 'anchored-transpose)
                         )
                )

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

         (:name html-accent
                :after (progn
                         (autoload 'html-accent "html-accent" "Accent HTML" t)
                         (autoload 'accent-html "html-accent" "HTML codes to accent" t)
                         ))
         (:name expand-region
                :after (progn
                         (require 'expand-region)
                         (global-set-key (kbd "C-z") 'er/expand-region)))
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
                ;; TODO: configure or remove this
                )
         (:name column-marker
                :after (progn
                         ;; Highlight character at "fill-column" position.
                         (require 'column-marker)
                         (add-hook 'python-mode-hook
                                   (lambda () (interactive)
                                     (column-marker-1 fill-column)))
                         )
                )
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
                         )
                )
         ;;(:name emacs-goodies-el :type apt-get)
         (:name autopair
                :after (progn
                         (add-hook 'prog-mode-hook (lambda ()
                                                     (autopair-mode t)
                                                     ))
                         ))
         (:name highlight-parentheses
                :after (progn
                         (require 'highlight-parentheses)
                         (add-hook 'prog-mode-hook (lambda ()
                                                     (highlight-parentheses-mode t)
                                                     ))
                         ))
         (:name yasnippet
                :after (progn
                         (require 'yasnippet)
                         (yas-global-mode 1)
                         (yas/load-directory "~/.emacs.d/elhome/snippets")
                         (setq yas-snippet-dirs (delete "~/.emacs.d/snippets" yas-snippet-dirs))
                         (add-to-list 'yas-snippet-dirs '"~/.emacs.d/elhome/snippets")
                         ))
         (:name popwin
                :after (progn
                         (require 'popwin)
                         (popwin-mode 1)
                         )
                )
         (:name header2
                :after (progn
                         (require 'header2)
                         (add-hook 'write-file-hooks 'auto-update-file-header)
                         (add-hook 'prog-mode-hook 'auto-make-header t)
                         )
                )
         (:name cask)
         (:name flycheck
                :after (progn
                         (global-flycheck-mode 1)
                         )
                )
         (:name lua-block
                :after (progn
                         ;;(require 'lua-block) ;; It always gets enabled on all buffers?
                         )
                )
         (:name yascroll
                :after (progn
                         (global-yascroll-bar-mode 1)
                         )
                )
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

                         )
                )
         (:name markdown-mode
                :after (progn
                         (require 'markdown-mode)))
         (:name weechat)
         ;; (:name erc
         ;; │18:51:40        whirm | is anybody using ERC/circe with client side cert auth?
         ;; │18:55:20  wgreenhouse | whirm: it's possible with ERC, through tweaking erc-server-connect-function
         ;; │18:55:35  wgreenhouse | to a version that supplies a :client-certificate arg to open-network-stream
         ;; │18:55:47  wgreenhouse | probably you could do the same hack with circe
         ;; │18:56:42        whirm | wgreenhouse: ok, I'll try that. Thanks
         ;; │18:56:48  wgreenhouse | whirm: I may try it soon for ERC on OFTC, I'll let you know if it worked.
         ;; │19:02:01   fledermaus | whirm: passing a :client-certificate value of t will automatically search auth-sources for a certificate
         ;; │                      | and key, so you could put those in your ~/.netrc and it would magically work.
         ;;        :after (progn
         ;;                 (require 'erc)
         ;;                 (defun irc-connect()
         ;;                   "Start ERC for all the networks I use."
         ;;                   (interactive)
         ;;                   (erc-tls :server "chat.freenode.net" :port 6697 :nick "whirm")
         ;;                   (erc-tls :server "irc.oftc.net" :port 6697 :nick "whirm")
         ;;                   (erc :server "localhost" :nick "whirm")
         ;;                   )
         ;;
         ;; TODO Check and install these extensions if I use ERC
         ;; erc-extension
         ;; erc-extras
         ;; erc-highlight-nicknames
         ;; erc-nick-notify
         ;;
         ;; stuff to set if I decide to use erc again
         ;; '(erc-auto-query (quote window))
         ;; '(erc-autoaway-mode t)
         ;; '(erc-autojoin-channels-alist (quote (("freenode.net" "#emacs" "#tribler") ("oftc.net" "#awesome") ("localhost" "&bitlbee"))))
         ;; '(erc-autojoin-mode t)
         ;; '(erc-autojoin-timing (quote ident))
         ;; '(erc-emacswiki-lisp-url "http://www.emacswiki.org/elisp/")
         ;; '(erc-frame-dedicated-flag t)
         ;; '(erc-log-channels-directory "~/.emacs.d/var/erc/logs/")
         ;; '(erc-log-mode t)
         ;; '(erc-modules (quote (autoaway autojoin button capab-identify completion dcc log move-to-prompt ring services smiley stamp track highlight-nicknames autojoin button capab-identify dcc fill irccontrols list log match menu move-to-prompt netsplit networks noncommands notify notifications readonly ring services smiley stamp spelling track truncate)))
         ;; '(erc-netsplit-mode t)
         ;; '(erc-nick "whirm")
         ;; '(erc-nick-uniquifier "_")
         ;; '(erc-nickserv-identify-mode (quote autodetect))
         ;; '(erc-nickserv-passwords nil)
         ;; '(erc-pcomplete-mode t)
         ;; '(erc-prompt-for-nickserv-password nil)
         ;; '(erc-services-mode t)
         ;; '(erc-stamp-mode t)
         ;; '(erc-track-exclude-server-buffer t)
         ;; '(erc-track-minor-mode t)
         ;; '(erc-track-mode t)
         ;; '(erc-truncate-mode t)

         ;;faces:
         ;;  '(erc-input-face ((t (:foreground "gray52"))) t)
         ;; '(erc-notice-face ((t (:foreground "gray28" :weight bold))) t)
         ;; '(erc-timestamp-face ((t (:foreground "chartreuse4" :weight bold))) t)
         ;;                 )
         ;;        )

         (:name deferred-flyspell
                :after (progn
                         (deferred-flyspell:config)
                         ;; Use flyspell now that deferred-flyspell is enabled
                         ;;(add-hook 'prog-mode-hook 'flyspell-prog-mode t)
                         ;;(add-hook 'message-mode-hook 'flyspell-mode t)
                         ;;(add-hook 'text-mode-hook 'flyspell-mode t)
                         ;;^
                         ))
         (:name insert-shebang
                :type elpa
                :after (progn
                         ;; (add-hook 'find-file-hook 'insert-shebang)
                         ))
         (:name evil-numbers
                :after (progn
                         (require 'evil-numbers)
                         (global-set-key (kbd "C-c +") 'evil-numbers/inc-at-pt)
                         (global-set-key  (kbd "C-c -") 'evil-numbers/dec-at-pt)
                         ))
         (:name flyguess
                :type emacswiki
                :after (progn
                         (setq flyguess-check-percentage 50)
                         (setq flyguess-mininum-buffer-size 200)
                         (setq flyguess-dictionary-list (quote ("ca_ES_hunspell" "en_US_hunspell" "es_ES_hunspell")))

                         ;; Activate Flyguess when composing a mail
                         ;;(add-hook 'mu4e-compose-mode-hook 'flyguess-guess)

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
                          (add-hook 'tuareg-mode-hook (lambda ()
                                                        (setq tuareg-interactive-program "utop")
                                                        ))
                          ))
         (:name utop)
         (:name merlin
                :after (progn
                          ;; Add opam emacs directory to the load-path
                          (setq opam-share (substring (shell-command-to-string "opam config var share 2> /dev/null") 0 -1))
                          (add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))

                          ;; Load merlin-mode
                          (require 'merlin)

                          ;; Start merlin on ocaml files
                          (add-hook 'tuareg-mode-hook 'merlin-mode t)
                          (add-hook 'caml-mode-hook 'merlin-mode t)

                          ;; Enable auto-complete
                          (setq merlin-use-auto-complete-mode 'easy)

                          ;; Use opam switch to lookup ocamlmerlin binary
                          (setq merlin-command 'opam)

                          ;; Take a look at https://github.com/the-lambda-church/merlin for more information

                          ))
         (:name rainbow-mode
                :type elpa
                ;; This minor mode sets background color to strings that match color
                ;; names, e.g. #0000ff is displayed in white with a blue background.
                :after (progn
                         (add-hook 'prog-mode-hook (lambda ()
                                                     (require 'rainbow-mode)
                                                     (rainbow-mode t)
                                                     ))
                         )
                )
         (:name projectile
                :checkout "b41017f795b7b13c2faaa5573574947873be0253" ;; either projectile or perspective recent versions break the mode line indicator (only shows main)
                :after (progn
                         (projectile-global-mode t)
                         ))
         (:name perspective
                :checkout "6c8cd35759039626815a0c9f85337eed75e5af4a" ;; either projectile or perspective recent versions break the mode line indicator (only shows main)
                :after (progn
                         (require 'perspective)
                         (persp-mode t)
                         (require 'persp-projectile)

                         (global-set-key (kbd "C-S-q") 'persp-switch-quick)

                         ;; loading code for our custom perspectives
                         ;; taken from Magnar Sveen
                         (defmacro custom-persp (name &rest body)
                           `(let ((initialize (not (gethash ,name perspectives-hash)))
                                  (current-perspective persp-curr))
                              (persp-switch ,name)
                              (when initialize ,@body)
                              (setq persp-last current-perspective)))

                         ;; Jump to last perspective
                         ;; taken from Magnar Sveen
                         (defun custom-persp-last ()
                           (interactive)
                           (persp-switch (persp-name persp-last)))

                         ;; Easily switch to your last perspective
                         (define-key persp-mode-map (kbd "C-x p -") 'custom-persp-last)

                         ;; (defun custom-persp/emacs ()
                         ;;   (interactive)
                         ;;   (custom-persp "emacs"
                         ;;                 (find-file "~/.emacs.d/init.el")))
                         ;; (define-key persp-mode-map (kbd "C-x p e") 'custom-persp/emacs)
                         (defun custom-persp/feeds ()
                            (interactive)
                            (custom-persp "feeds"
                                          (elfeed)))
                         (define-key persp-mode-map (kbd "C-x p f") 'custom-persp/feeds)
                         ))
         (:name iedit)
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
                         (require 'realgud)
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
                         (require 'window-numbering)
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
                         (global-company-mode 1)
                         ))
         (:name elpy
                ;;:checkout "473de81727de913a580f826511dddb233930dd11"
                :checkout "release"
                ;;:checkout "importmagic"
                :after (progn
                         (require 'elpy)
                         (elpy-enable)
                         (elpy-use-ipython)

                         ;;Disable hook as it has a fucked up keybind
                         (remove-hook 'python-mode-hook 'pylint-python-hook)
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
                         )
                )
         (:name elfeed
                :after (progn
                         (setq
                          elfeed-db-directory (concat user-emacs-directory "/var/elfeed/")
                          elfeed-sort-order (quote ascending)
                          )))
         )))

(setq my-packages
      (append
       my-packages
       (mapcar 'el-get-source-name el-get-sources)
       '(
         ;; rudel  http://www.emacswiki.org/emacs/Rudel (gobby compatible collaborative text editor)
         align
         android-mode
         auto-install
         autopair
         autopep8
         autosmiley
         cl-lib
         clevercss ;; TODO: is this still needed if using web-mode?
         css-palette
         cssh
         ein
         ess
         ess-smart-underscore
         filladapt
         fringe-helper
         fuzzy
         gist
         git-modes
         guru-mode
         helm-c-yasnippet
         jam-mode
         linum-relative
         list-utils ;; something depends on this but is not on the recipe
         lua-mode
         magit-gh-pulls ;; TODO: check if I need to configure it
         magit-view-file
         mingus
         newpaste
         nodejs-repl
         nsis-mode
         org-caldav ;; TODO configure!
         org-magit
         page-break-lines
         popup
         python-magic
         smooth-scrolling
         swank-js
         tidy
         unbound
         vkill
         volatile-highlights
         xcscope+
         yaml-mode
         )))

(el-get-cleanup my-packages)
(el-get 'sync my-packages)
