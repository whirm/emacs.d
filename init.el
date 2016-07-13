;;; init.el ---

;; This file only initializes the basic package manager stuff and elhome, the rest is done in the elhome/startup/ files




(let ((gc-cons-threshold most-positive-fixnum))
  (package-initialize)

  (setq package-archives '(
                           ("gnu"          . "https://elpa.gnu.org/packages/")
                           ("melpa-stable" . "https://stable.melpa.org/packages/")
                           ("marmalade"    . "https://marmalade-repo.org/packages/"))
        package-user-dir              (concat user-emacs-directory "var/package/")
        el-get-dir                    (concat user-emacs-directory "var/el-get/")
        el-get-user-package-directory (concat user-emacs-directory "elhome/el-get/")
        bcc-cache-directory           (concat user-emacs-directory "var/byte-cache/")
        bcc-blacklist                 '("/\\.recentf$" "/history$" "var/el-get/")
        custom-theme-directory        (concat user-emacs-directory "elhome/themes")
        custom-file                   (concat user-emacs-directory "elhome/custom.el")
        el-get-git-shallow-clone      t
        )
  (load custom-file)

  (let ((el-get-install-dir (concat el-get-dir "el-get/")))
    (add-to-list 'load-path el-get-install-dir)
    ;; TODO: This can be done better
    (require 'info)
    (add-to-list 'Info-additional-directory-list el-get-install-dir)
    )

  ;;(setq el-get-master-branch nil) ;; uncomment this to not use the master branch
  (unless (require 'el-get nil 'noerror)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
      (goto-char (point-max))
      (eval-print-last-sexp)
      (el-get-emacswiki-build-local-recipes) ;; used to be el-get-emacswiki-refresh
      (package-refresh-contents)
      (el-get-elpa-build-local-recipes)))

  (add-to-list 'el-get-recipe-path (concat user-emacs-directory "elhome/recipes/"))

  (setq my-packages '(
                      elhome
                      ))

  (el-get 'sync my-packages)

  (elhome-init))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init.el ends here
