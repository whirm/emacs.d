;;; mu4e-settings.el ---
;;
;; Filename: mu4e-settings.el
;; Description:
;; Author: Elric Milon
;; Maintainer:
;; Created: Fri Dec  5 18:14:46 2014 (+0100)
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



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; mu4e-settings.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mu4e-attachment-dir "/tmp/")
 '(mu4e-auto-retrieve-keys t)
 '(mu4e-compose-complete-only-after "2013-01-01")
 '(mu4e-compose-complete-only-personal t)
 '(mu4e-compose-dont-reply-to-self t)
 '(mu4e-confirm-quit nil)
 '(mu4e-headers-visible-lines 15)
 '(mu4e-maildir "~/.mail")
 '(mu4e-update-interval 120)
 '(mu4e-view-image-max-height 1000)
 '(mu4e-view-image-max-width 1200)
 '(mu4e-view-mode-hook (quote (turn-on-visual-line-mode)))
 '(mu4e-view-prefer-html t)
 '(mu4e-view-show-addresses t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mu4e-cited-1-face ((t (:inherit font-lock-builtin-face :weight normal))))
 '(mu4e-cited-2-face ((t (:inherit font-lock-type-face :weight normal))))
 '(mu4e-cited-3-face ((t (:inherit font-lock-variable-name-face :weight normal))))
 '(mu4e-cited-4-face ((t (:inherit font-lock-pseudo-keyword-face :weight normal))))
 '(mu4e-header-highlight-face ((t (:underline t))))
 '(mu4e-moved-face ((t (:inherit font-lock-comment-face))))
 '(mu4e-system-face ((t (:inherit font-lock-comment-face))))
 '(mu4e-unread-face ((t (:foreground "RoyalBlue2" :weight bold)))))
