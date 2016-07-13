;;; init-circe.el ---
;;
;; Filename: init-circe.el
;; Description:
;; Author: Elric Milon
;; Maintainer:
;; Created: Wed Jul 13 09:41:57 2016 (+0200)
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

(require 'lui-logging)
(setq circe-network-options '(("Freenode"
                               :tls t
                               :nick "whirm"
                               :nickserv-nick "whirm"
                               :nickserv-password "irrelevant"
                               :nickserv-ghost-command "PRIVMSG NickServ :GHOST {nick}"
                               :channels ("#emacs" "#tribler"))
                              ;; :channels ("#emacs"))
                              ("Bitlbee"
                               :nick "whirm"
                               :nickserv-password "higgiavcapMeikwoHikMengUktoiWuf6"
                               :pass "kanUmzocairAptedviadTitNukotugth")
                              ("OFTC"
                               :tls t
                               :nick "whirm"
                               :channels ("#awesome"))
                              )

      circe-format-server-topic "*** Topic change by {userhost}: {topic-diff}"

      helm-mode-no-completion-in-region-in-modes '(circe-channel-mode
                                                   circe-query-mode
                                                   circe-server-mode)

      circe-use-cycle-completion t
      circe-reduce-lurker-spam t
      circe-nickserv-ghost-style 'after-auth
      circe-color-nicks-everywhere t
      circe-color-nicks-pool-type '("#b58900" "#cb4b16" "#dc322f" "#d33682" "#6c71c4"
                                    "#268bd2" "#2aa198" "#859900" "#7b6000" "#deb542"
                                    "#f2804f" "#ff6e64" "#f771ac" "#9ea0e5" "#00629d"
                                    "#69b7f0" "#00736f" "#69cabf" "#546e00" "#b4c342")

      circe-default-directory lui-logging-directory
      )

(eval-after-load 'circe '(require 'circe-chanop))

(eval-after-load 'circe '(defadvice circe (around set-tls-connection-command activate)
                           "Set the right tls-connection-command so my client side cert is passed"
                           (let ((tls-connection-command
                                  "openssl s_client -connect %h:%p -no_ssl2 -ign_eof -CAfile ~/.ssl/certs/spi.pem -cert ~/.ssl/certs/whirm.pem "))
                             ad-do-it)
                           ))

(require 'lui-autopaste)
(add-hook 'circe-channel-mode-hook 'enable-lui-autopaste)

                         ;; (load "lui-logging" nil t)

(enable-lui-logging-globally)

(setq
 lui-time-stamp-position 'left
 lui-time-stamp-format "%H:%M")

(add-hook 'lui-mode-hook 'my-circe-set-margin)
(defun my-circe-set-margin ()
  (setq right-margin-width 5))

(defvar my-circe-bot-list '("fsbot" "rudybot"))
(defun my-circe-message-option-bot (nick &rest ignored)
  (when (member nick my-circe-bot-list)
    '((text-properties . (face circe-fool-face
                               lui-do-not-track t)))))
(add-hook 'circe-message-option-functions 'my-circe-message-option-bot)


(defun circe-network-connected-p (network)
  "Return non-nil if there's any Circe server-buffer whose
`circe-server-netwok' is NETWORK."
  (catch 'return
    (dolist (buffer (circe-server-buffers))
      (with-current-buffer buffer
        (if (string= network circe-server-network)
            (throw 'return t))))))


(defun circe-maybe-connect (network)
  "Connect to NETWORK, but ask user for confirmation if it's
already been connected to."
  (interactive "sNetwork: ")
  (if (or (not (circe-network-connected-p network))
          (y-or-n-p (format "Already connected to %s, reconnect?" network)))
      (circe network)))

(defun my-irc ()
  "Connect to all my IRC servers after enabling contrib modules."
  (interactive)
  (circe-lagmon-mode)
  (enable-circe-color-nicks)
  (enable-lui-autopaste)
  (enable-lui-track-bar)
  (require 'circe-chanop)
  (circe-maybe-connect "Bitlbee")
  (circe-maybe-connect "Freenode")
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-circe.el ends here
