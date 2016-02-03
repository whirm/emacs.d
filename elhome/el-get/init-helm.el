(require 'helm-config)
(require 'helm-font)
;; TODO: check why this makes helm not find any results when grepping
;; (setq
;;  helm-grep-default-command "ack-grep -Hn --no-group --no-color %e %p %f"
;;  helm-grep-default-recurse-command "ack-grep -H --no-group --no-color %e %p %f")
(require 'helm-files)

(setq
 helm-adaptive-history-file "~/.emacs.d/var/helm-adaptive-history"
 helm-bookmark-show-location t
 helm-buffer-max-length 40
 helm-candidate-separator "┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅"
 helm-ff-skip-boring-files t
 helm-ff-tramp-not-fancy nil
 helm-findutils-ignore-boring-files t
 helm-for-files-preferred-list '(helm-source-buffers-list helm-source-recentf helm-source-bookmarks helm-source-file-cache helm-source-files-in-current-dir)
 helm-imenu-delimiter " → "
 helm-locate-command "locate %s -r %s"
 helm-mode t
 helm-quick-update t
 helm-split-window-default-side (quote same)
 helm-yas-display-key-on-candidate t
 )

(add-to-list 'helm-boring-file-regexp-list "TAGS")

(helm-mode 1)
(helm-adaptive-mode 1)

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


(bind-key "C-x 8 RET" 'helm-ucs)

(defun helm-projectile-grep ()
  "like projectile-grep but with helm :D"
  (interactive)
  (helm-do-grep-1 (list (projectile-project-root)) t)
  )

(defun helm-mini-devel ()
  "helm-mini for prog-modes (TODO entries, helm-projectile, buffers and recentf)"
  (interactive)
  (require 'helm-misc)
  (require 'helm-projectile)
  (let ((helm-ff-transformer-show-only-basename nil))
    (helm-other-buffer '(;; helm-source-fixme
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
