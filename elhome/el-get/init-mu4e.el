;; Config for mu4e
(require 'mu4e)
(require 'mu4e-contrib)
(require 'smtpmail)
(require 'org-mu4e)

;; Toggle Mu4e with F8
(defun wh-start-mu4e ()
  "start mu4e in the mail workspace"
  (interactive)
  (if (string= (persp-name persp-curr) "email")
      (custom-persp-last)
    (progn
      (persp-switch "email")
      ;; Work around the fact that mu4e will fail to start if on a RO buffer
      (switch-to-buffer "*scratch*")
      (delete-other-windows)
      (mu4e))))

(global-set-key [(f8)] 'wh-start-mu4e)

(setq
 ;; mu4e-get-mail-command "~/.bin/sync-mail.sh"
 mu4e-msg2pdf "/usr/bin/msg2pdf"
 ;; mu4e-html2text-command "html2text -utf8 -width 90"
 ;; mu4e-html2text-command "lynx -stdin -dump -force_html -localhost -pseudo_inlines -width=100"
 ;; mu4e-html2text-command "w3m -dump -cols 120 -T text/html"
 mu4e-html2text-command 'mu4e-shr2text

 ;; For dark themes
 shr-color-visible-luminance-min 80

 ;;; Set mu4e as default mail user agent
 mail-user-agent 'mu4e-user-agent

 message-kill-buffer-on-exit t

 ;;; Enable inline images
 mu4e-view-show-images t

 ;;; Start in non-queuing mode
 smtpmail-queue-mail  nil
 smtpmail-queue-dir   "~/.mail/queue/cur"

 ;; starttls-use-gnutls t
 ;; smtpmail-debug-info t ; only to debug problems
 ;; smtpmail-debug-verb t
 message-send-mail-partially-limit nil
 mu4e-compose-complete-addresses nil

 mu4e-doc-dir mu4e-builddir
 )

(add-hook 'message-mode-hook 'orgtbl-mode 'append)
(add-hook 'message-mode-hook 'orgstruct++-mode 'append)
(add-hook 'message-mode-hook 'turn-on-auto-fill 'append)
(add-hook 'message-mode-hook 'turn-on-flyspell 'append)
;;(add-hook 'mu4e-compose-mode-hook 'bbdb-mail-aliases 'append)
(add-hook 'message-mode-hook
          '(lambda ()
             (setq-local fill-column 72)
             ;; This is should be removed once emacs 25.1 is out
             (setq-local inhibit-point-motion-hooks t)
             )
          'append)

;;; Use imagemagick if available
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

;;; Misc commands
(defun search-for-sender (msg)
  "Search for messages by the sender of the current one."
  (mu4e-headers-search (concat "from:" (cdar (mu4e-msg-field msg :from)))))

(add-to-list 'mu4e-view-actions
             '("xsearch for sender" . search-for-sender) t)

(defun mu4e-action-view-in-browser (msg)
  "View the body of the message in a web browser."
  (let ((html (mu4e-msg-field msg :body-html))
        (tmpfile (format "%s/%d.html" temporary-file-directory (random))))
    (unless html (error "No html part for this message"))
    (with-temp-file tmpfile
      (insert
       "<html>"
       "<head><meta http-equiv=\"content-type\""
       "content=\"text/html;charset=UTF-8\">"
       html))
    (browse-url (concat "file://" tmpfile))))

(add-to-list 'mu4e-view-actions
             '("bBrowser" . mu4e-action-view-in-browser) t)

;;; Spam training (WIP)
(defun dv-mu4e-train-spam (msg)
  "Train as spam and then mark for deletion."
  (let* ((cmd (format "sa-learn --spam  %s "
                      (shell-quote-argument (mu4e-msg-field msg :path)))))
    (shell-command cmd))
  (mu4e~headers-mark-delete)
  ;;(mu4e~view-mark-set 'delete)
  (message "Trained as SPAM")
  )

(add-to-list 'mu4e-headers-actions
             '("sTrain as SPAM" . dv-mu4e-train-spam) t)

(defun dv-mu4e-train-ham (msg)
  "Train as ham."
  (let* ((cmd (format "sa-learn --ham  %s "
                      (shell-quote-argument (mu4e-msg-field msg :path)))))
    (shell-command cmd))
  (message "Trained as HAM")
  )

(add-to-list 'mu4e-headers-actions
             '("hTrain as HAM" . dv-mu4e-train-ham) t)


;; Find ICS files in mail WIP
(defun scan-for-ics ()
  "Scan and import ICS files into the agenda"
  (interactive)
  (mu4e-view-for-each-part (mu4e-message-at-point)
                           (lambda (msg part)
                             (message (mu4e-message-part-field part :mime-type))
                             (when (string-match "text/calendar"
                                                 (or (mu4e-message-part-field part :mime-type)
                                                     "application/object-stream"))
                               (let ((index (mu4e-message-part-field part :index)))
                                 (save-excursion
                                   (let* ((docid (mu4e-message-field msg :docid))
                                          (fpath (make-temp-file "mu4e-import-ics")))
                                     (mu4e~proc-extract 'save docid index fpath)
                                     (icalendar-import-file fpath diary-file)
                                     (if (find-buffer-visiting fpath) (kill-buffer (find-buffer-visiting fpath)))
                                     (if (find-buffer-visiting diary-file) (bury-buffer (find-buffer-visiting diary-file)))
                                     )))))
                           ))

;; (add-hook 'mu4e-view-mode-hook 'scan-for-ics)


;; From http://mbork.pl/2015-11-28_Fixing_mml-attach-file_using_advice
(defun mml-attach-file--go-to-eob (orig-fun &rest args)
  "Go to the end of buffer before attaching files."
  (save-excursion
    (save-restriction
      (widen)
      (goto-char (point-max))
      (apply orig-fun args))))

(advice-add 'mml-attach-file :around #'mml-attach-file--go-to-eob)


(load "init-mu4e-private" t)
