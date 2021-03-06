;;; init-magit.el ---
;;
;; Filename: init-magit.el
;; Description:
;; Author: Elric Milon
;; Maintainer:
;; Created: Mon Jul 20 13:13:01 2015 (+0200)
;;
;;; Commentary:
;;
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or (at
;; your option) any later version.
;;
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:


(setq
 magit-commit-extend-override-date t
 magit-diff-refine-hunk (quote all)
 magit-expand-staged-on-commit (quote full)
 magit-fetch-arguments nil
 magit-log-auto-more t
 magit-log-format-graph-function (quote magit-log-format-unicode-graph)
 magit-process-popup-time 10
 magit-restore-window-configuration t
 magit-set-upstream-on-push t
 magit-show-child-count t
 magit-push-always-verify nil
 magit-save-repository-buffers 'dontask
 magit-status-expand-stashes nil
 magit-status-buffer-switch-function (quote switch-to-buffer))

(require 'magit)

(autoload 'magit-define-popup-action "magit")

(bind-key "C-x C-z" 'magit-status)

;; I want the stash list on the bottom so I can easily see the unpushed commits.
(remove-hook 'magit-status-sections-hook 'magit-insert-stashes)
(add-hook 'magit-status-sections-hook 'magit-insert-stashes t)

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
;;^

(defun magit-wh-new-feature-branch ()
  (interactive)
  "Create a new branch from devel, set upstream and push"
  (let ((new_branch_name (read-from-minibuffer "New feature branch name: ")))
    (magit-fetch "upstream" nil)
    (magit-branch-and-checkout new_branch_name "upstream/devel")
    (magit-push-to-remote "whirm" "-u")
    ))

(defun magit-wh-new-bugfix-branch ()
  (interactive)
  "Create a new branch from next, set upstream and push"
  (let ((new_branch_name (read-from-minibuffer "New bugfix branch name: ")))
    (magit-fetch "upstream" nil)
    (magit-branch-and-checkout new_branch_name "upstream/next")
    (magit-push-to-remote "whirm" "-u")
    ))

(defun magit-wh-rebase-feature-branch ()
  (interactive)
  "Rebase against upstream/devel"
  (magit-fetch "upstream" nil)
  (magit-rebase "upstream/devel" nil))

(defun magit-wh-rebase-bugfix-branch ()
  (interactive)
  "Rebase against upstream/next"
  (magit-fetch "upstream" nil)
  (magit-rebase "upstream/next" nil))

(defun magit-wh-next-to-devel ()
  (interactive)
  "Create a next-to-devel branch"
  (magit-fetch "upstream" nil)
  (magit-run-git "branch" "-D" "next_to_devel")
  (magit-branch-and-checkout "next_to_devel" "upstream/devel")
  (magit-rebase "upstream/next" nil)
  ;; (magit-push-to-remote "whirm" "-u")
  )

(magit-define-popup-action 'magit-branch-popup ?f  "Create new feature branch" 'magit-wh-new-feature-branch)
(magit-define-popup-action 'magit-branch-popup ?F  "Create new bugfix branch" 'magit-wh-new-bugfix-branch)

(magit-define-popup-action 'magit-branch-popup ?N  "Create next-to-devel branch" 'magit-wh-next-to-devel)

(magit-define-popup-action 'magit-rebase-popup ?u  "Rebase against feature branch" 'magit-wh-rebase-feature-branch)
(magit-define-popup-action 'magit-rebase-popup ?U  "Rebase against bugfix branch" 'magit-wh-rebase-bugfix-branch)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-magit.el ends here
