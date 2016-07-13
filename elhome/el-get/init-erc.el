;;; init-erc.el ---
;;
;; Filename: init-erc.el
;; Description:
;; Author: Elric Milon
;; Maintainer:
;; Created: Wed Jul 13 09:43:11 2016 (+0200)
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


(require 'erc)
(require 'erc-track)
(require 'tls)

(add-to-list 'tls-program "openssl s_client -connect %h:%p -no_ssl2 -ign_eof -CAfile ~/.ssl/spi_ca.pem -cert ~/.ssl/certs/whirm.pem ")
;; (add-to-list 'tls-program "gnutls-cli --tofu --priority SECURE256 --x509cafile ~/.ssl/spi_ca.pem --x509certfile ~/.ssl/certs/whirm.pem -p %p %h")

;; (defun wh-client-cert-open-network-stream (&rest args)
;;   (let (
;;         (my_args (append args '(:client-certificate t) ))
;;         )
;;     (apply open-network-stream my_args))
;;   )

;; (setq
;;  erc-server-connect-function 'wh-client-cert-open-network-stream
;;  )

(defun gnutls-available-p ()
  "Function redefined in order not to use built-in GnuTLS support"
  nil)

(defun irc-connect()
  "Start ERC for all the networks I use."
  (interactive)
  (erc-tls :server "chat.freenode.net" :port 6697 :nick "whirm" )
  ;; (erc-tls :server "irc.oftc.net"      :port 6697 :nick "whirm" )
  ;; (erc :server "localhost" :nick "whirm")
  )
;;
;; TODO Check and install these extensions if I use ERC
;; erc-extension
;; erc-extras
;; erc-highlight-nicknames
;; erc-nick-notify
;;
;; stuff to set if I decide to use erc again


(setq
 erc-auto-query '(window)
 erc-autoaway-mode t
 erc-autojoin-channels-alist '(("freenode.net" "#emacs" "#tribler") ("oftc.net" "#awesome") ("localhost" "&bitlbee"))
 erc-autojoin-mode t
 erc-autojoin-timing '(ident)
 erc-emacswiki-lisp-url "http://www.emacswiki.org/elisp/"
 erc-frame-dedicated-flag t
 erc-log-channels-directory "~/.emacs.d/var/erc/logs/"
 erc-log-mode t
 erc-netsplit-mode t
 erc-nick "whirm"
 erc-modules '(autoaway autojoin button capab-identify completion dcc log move-to-prompt ring services smiley stamp track autojoin button capab-identify dcc fill irccontrols list log match menu move-to-prompt netsplit networks noncommands notify notifications readonly ring services smiley stamp spelling track truncate)
 erc-nick-uniquifier "_"
 erc-pcomplete-mode t
 erc-services-mode t
 erc-stamp-mode t
 erc-track-exclude-server-buffer t
 erc-track-minor-mode t
 erc-track-mode t
 erc-truncate-mode t
 )
;;faces:
;;  '(erc-input-face ((t (:foreground "gray52"))) t)
;; '(erc-notice-face ((t (:foreground "gray28" :weight bold))) t)
;; '(erc-timestamp-face ((t (:foreground "chartreuse4" :weight bold))) t)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-erc.el ends here
