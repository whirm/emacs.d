;;; init.el ---

;; This file only initializes the basic package manager stuff and elhome, the rest is done in the elhome/startup/ files

;; Elpa
(require 'package)
(setq package-archives '(
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa-stable" . "http://stable.melpa.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         )
      )

;; El-get
(setq el-get-dir (concat user-emacs-directory "var/el-get/"))

(add-to-list 'load-path (concat el-get-dir "el-get/"))

(setq el-get-user-package-directory (concat user-emacs-directory "elhome/el-get/"))


;;(setq el-get-master-branch nil) ;; uncomment this to not use the master branch
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)
    (el-get-emacswiki-refresh)
    (el-get-elpa-build-local-recipes)
    )
  )

(add-to-list 'el-get-recipe-path (concat user-emacs-directory "elhome/recipes/"))

(setq my-packages '(
                    elhome
                    ))

(el-get 'sync my-packages)

(elhome-init)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init.el ends here
