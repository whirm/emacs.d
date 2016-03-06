;;; init-perspective.el ---
;;
;; Filename: init-perspective.el
;; Description:
;; Author: Elric Milon
;; Maintainer:
;; Created: Fri Jul 17 23:02:26 2015 (+0200)
;;
;;; Code:

(require 'perspective)
(persp-mode t)

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

(defun custom-persp/feeds ()
  (interactive)
  (custom-persp "feeds"
                (elfeed)))

(defun wh-persp-edit-journal ()
  "Visit project's journal file"
  (interactive)
  (find-file (concat (projectile-project-root) "journal.org")))

(require 'hydra)
(defhydra persp-navigate (global-map "C-x")
  "perspective navigate"
  ("e" wh-persp-edit-journal "edit journal")
  ("l" custom-persp-last "last")
  ("q" persp-switch-quick "quick switch")
  ("j" projectile-persp-switch-project "jump")
  ("f" custom-persp/feeds "feeds")
  ("n" persp-next "next")
  ("p" persp-prev "previous"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-perspective.el ends here
