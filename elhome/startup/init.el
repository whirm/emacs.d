;;; init

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Pre-init stuff

;;; timestamps in *Messages* THIS MAKES FLYCHECK (AND MAYBE OTHERS) STOP SHOWING STUFF IN THE MINBUFFER
;; (defun current-time-microseconds ()
;;   (let* ((nowtime (current-time))
;;          (now-ms (nth 2 nowtime)))
;;     (concat (format-time-string "[%Y-%m-%dT%T" nowtime) (format ".%d] " now-ms))))

;; (defadvice message (before test-symbol activate)
;;   (if (not (string-equal (ad-get-arg 0) "%s%s"))
;;       (let ((deactivate-mark nil))
;;         (save-excursion
;;           (set-buffer "*Messages*")
;;           (goto-char (point-max))
;;           (if (not (bolp))
;;               (newline))
;;           (insert (current-time-microseconds))))))


;; (toggle-debug-on-quit)
;; (toggle-debug-on-error)

(load "server")
(unless (server-running-p) (server-start))


;; EO Pre-init
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Looks

;; Grey mouse cursor
(set-mouse-color "grey")

;; Cursor is a line instead of a box
(setq-default cursor-type 'bar)

;; Show keystrokes in the minibuffer
(setq echo-keystrokes 0.1)

(add-hook 'minibuffer-setup-hook
          (lambda ()
            (make-local-variable 'face-remapping-alist)
            (add-to-list 'face-remapping-alist '(default (:background "#333333")))))

(defun disable-bars ()
  "Disable bars visibility."
  (interactive)
  (menu-bar-mode 0)
  (tool-bar-mode 0)
  (scroll-bar-mode 0)
  )
(defun enable-bars ()
  "Enables bars visibility."
  (interactive)
  (menu-bar-mode 1)
  (tool-bar-mode 1)
  (scroll-bar-mode 1)
  )

(global-set-key (kbd "C-ª") 'disable-bars)
(global-set-key (kbd "C-º") 'enable-bars)
(disable-bars)

;; EO Looks
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Behavior

(global-set-key (kbd "<RET>") 'newline-and-indent)

;; Move files to trash when deleting
(setq delete-by-moving-to-trash t)

;; Overwrite region when pasting/writing
;(delete-selection-mode +1) ;; conflicts with autoparens

;; Use only spaces for indenting
(setq-default indent-tabs-mode nil)
;;^

;; Uniquify buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
;;^

;; Use hippie-expand
(global-set-key (kbd "M-/") 'hippie-expand)
;;^

;; Use winner to undo window changes
(winner-mode t)
;;^

;; Set Unicode data file location. (used by what-cursor-position and describe-char)
(let ((x (concat user-emacs-directory "lib/UnicodeData.txt")))
  (when (file-exists-p x)
    (setq describe-char-unicodedata-file x)))
;;^

;; Unicode pallete file
;; open my Unicode template with F7 key
(global-set-key (kbd "<f7>")
                (lambda () (interactive) (find-file (concat user-emacs-directory "elhome/lib/unicode.txt"))))
;;^

;; Save point position between sessions
(setq-default save-place t)
(setq save-place-file (concat user-emacs-directory "var/places"))
(require 'saveplace)
;;^

;; Sync primary buffer with X buffer
(global-set-key "\M-w" 'clipboard-kill-ring-save)
(global-set-key "\C-y" 'clipboard-yank)
;;^

;; Disable popup windows
(defadvice yes-or-no-p (around prevent-dialog activate)
  "Prevent 'yes-or-no-p' from activating a dialog."
  (let ((use-dialog-box nil))
    ad-do-it))
(defadvice y-or-n-p (around prevent-dialog-yorn activate)
  "Prevent 'y-or-n-p' from activating a dialog."
  (let ((use-dialog-box nil))
    ad-do-it))

;; Do not use pop-up question windows and use y-n instead of yes-no
(defalias 'yes-or-no-p 'y-or-n-p)

;; Cycle through amount of spaces (all->one->none)
(global-set-key (kbd "S-SPC") 'cycle-spacing)

;;Not sure if I like those...
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

(global-set-key "\C-w" 'backward-kill-word)

;; Set a hotkey for revert-buffer
(global-set-key (kbd "C-S-r") 'revert-buffer)

;; Clean trailing spaces when saving file
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Make executable if script
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;; don't accelerate scrolling
(setq mouse-wheel-progressive-speed nil)

;; Only show line numbers when being asked for line number
(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input."
  (interactive)
  (unwind-protect
      (progn
        (setq linum-format 'dynamic)
        (linum-mode 1)
        (goto-line (read-number "Goto line: ")))
    (linum-mode -1)))

(global-set-key [remap goto-line] 'goto-line-with-feedback)

;; Relative jump line
(defun jump-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the amount of lines to jump."
  (interactive)
  (unwind-protect
      (progn
        (setq linum-format 'linum-relative)
        (linum-mode 1)
        (next-line (read-number "Jump to line: ")))
    (progn
      (setq linum-format 'dynamic)
      (linum-mode -1))
    )
  )
(global-set-key (kbd "M-g f") 'jump-line-with-feedback)

;; Auto refresh buffers
;;(global-auto-revert-mode 1)
(setq revert-without-query t)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)
;;^

;; Hide uninteresting files in dired by default
(setq dired-omit-mode t)
;;^

;; Convenience functions to create new lines before-after current one (even while mid-line)
(defun open-line-below ()
  (interactive)
  (let ((region-used nil))
    (if (and mark-active transient-mark-mode)
        (progn
          (kill-region (mark) (point))
          (setq region-used t)
          )
      )
    (end-of-line)
    (newline)
    (indent-for-tab-command)
    (if region-used
        (yank)
      )
    )
  )

(defun open-line-above ()
  (interactive)
  (let ((region-used nil))
    (if (and mark-active transient-mark-mode)
        (progn
          (kill-region (mark) (point))
          (setq region-used t)
          )
      )
    (beginning-of-line)
    (newline)
    (forward-line -1)
    (indent-for-tab-command)
    (if region-used
        (yank)
      )
    )
  )

(global-unset-key (kbd "<S-return>"))
(global-set-key (kbd "<S-return>") 'open-line-below)
(global-unset-key (kbd "<C-S-return>"))
(global-set-key (kbd "<C-S-return>") 'open-line-above)
;;^

;; Duplicate current line with C-D
(defun duplicate-line()
  (interactive)
  (save-excursion
    (whole-line-or-region-call-with-region 'copy-region-as-kill 1 t)
    (forward-line 1)
    (yank))
  (next-line)
  )
(global-set-key (kbd "C-d") 'duplicate-line)

;; Kill word at point
(defun kill-word-at-point ()
  "Kill the word the point is at"
  (interactive)
  (right-word)
  (let ((beg (point)))
    (left-word 1)
    (delete-region beg (point))
    )
  (setq bds (bounds-of-thing-at-point 'whitespace))
  (delete-region (car bds) (cdr bds))
  (insert " ")
  )

(global-set-key (kbd "C-S-<delete>") 'kill-word-at-point)

;; Delete current buffer's file.
(defun delete-current-buffer-file ()
  "Removes file connected to current buffer and kills buffer."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (ido-kill-buffer)
      (when (yes-or-no-p "Are you sure you want to remove this file? ")
        (delete-file filename)
        (kill-buffer buffer)
        (message "File '%s' successfully removed" filename)))))

(global-set-key (kbd "C-x C-k") 'delete-current-buffer-file)
;;^


;; Rename current buffer file
(defun rename-current-buffer-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))

(global-set-key (kbd "C-x C-r") 'rename-current-buffer-file)
;;^

;; Toggles window splitting (hor-vert)
(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
             (next-win-buffer (window-buffer (next-window)))
             (this-win-edges (window-edges (selected-window)))
             (next-win-edges (window-edges (next-window)))
             (this-win-2nd (not (and (<= (car this-win-edges)
                                         (car next-win-edges))
                                     (<= (cadr this-win-edges)
                                         (cadr next-win-edges)))))
             (splitter
              (if (= (car this-win-edges)
                     (car (window-edges (next-window))))
                  'split-window-horizontally
                'split-window-vertically)))
        (delete-other-windows)
        (let ((first-win (selected-window)))
          (funcall splitter)
          (if this-win-2nd (other-window 1))
          (set-window-buffer (selected-window) this-win-buffer)
          (set-window-buffer (next-window) next-win-buffer)
          (select-window first-win)
          (if this-win-2nd (other-window 1))))))
;;^

;; Join next line with this one
(global-set-key (kbd "M-j")
                (lambda ()
                  (interactive)
                  (join-line -1)))
;;^

;; Keep region when undoing in region
(defadvice undo-tree-undo (around keep-region activate)
  (if (use-region-p)
      (let ((m (set-marker (make-marker) (mark)))
            (p (set-marker (make-marker) (point))))
        ad-do-it
        (goto-char p)
        (set-mark m)
        (set-marker p nil)
        (set-marker m nil))
    ad-do-it))
;;^

;; Write backup files to own directory
(setq backup-directory-alist
      `((".*" . ,(expand-file-name
                 (concat user-emacs-directory "var/backups")))))
(setq auto-save-file-name-transforms
      `((".*" , (concat user-emacs-directory "var/autosaves") t)))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Highlight current line
(global-hl-line-mode 1)
;; Customize the background color
(set-face-background 'hl-line "#110")
(set-face-foreground 'highlight nil) ;;To prevent crushing other styles from the theme

;; Disable C-z
(global-unset-key (kbd "C-z"))

;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; change case of letters
;; http://ergoemacs.org/emacs/modernization_upcase-word.html
(defun toggle-letter-case ()
  "Toggle the letter case of current word or text selection.
Toggles between: “all lower”, “Init Caps”, “ALL CAPS”."
  (interactive)
  (let (p1 p2 (deactivate-mark nil) (case-fold-search nil))
    (if (region-active-p)
        (setq p1 (region-beginning) p2 (region-end))
      (let ((bds (bounds-of-thing-at-point 'word) ) )
        (setq p1 (car bds) p2 (cdr bds)) ) )

    (when (not (eq last-command this-command))
      (save-excursion
        (goto-char p1)
        (cond
         ((looking-at "[[:lower:]][[:lower:]]") (put this-command 'state "all lower"))
         ((looking-at "[[:upper:]][[:upper:]]") (put this-command 'state "all caps") )
         ((looking-at "[[:upper:]][[:lower:]]") (put this-command 'state "init caps") )
         ((looking-at "[[:lower:]]") (put this-command 'state "all lower"))
         ((looking-at "[[:upper:]]") (put this-command 'state "all caps") )
         (t (put this-command 'state "all lower") ) ) )
      )

    (cond
     ((string= "all lower" (get this-command 'state))
      (upcase-initials-region p1 p2) (put this-command 'state "init caps"))
     ((string= "init caps" (get this-command 'state))
      (upcase-region p1 p2) (put this-command 'state "all caps"))
     ((string= "all caps" (get this-command 'state))
      (downcase-region p1 p2) (put this-command 'state "all lower")) )
    )
  )

;;set this to M-c
(global-set-key "\M-c" 'toggle-letter-case)
;;^

(add-hook 'prog-mode-hook (lambda ()
                            (local-set-key (kbd "C-#") 'comment-or-uncomment-region)
                            ))
;; EO Behaviour
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Utility functions


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; diff-region* - Diff two regions
;;
;; To compare two regions, select the first region
;; and run `diff-region`. The region is now copied
;; to a seperate diff-ing buffer. Next, navigate
;; to the next region in question (even in another file).
;; Mark the region and run `diff-region-now`, the diff
;; of the two regions will be displayed by ediff.
;;
;; You can re-select the first region at any time
;; by re-calling `diff-region`.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun diff-region ()
  "Select a region to compare"
  (interactive)
  (when (use-region-p) ; there is a region
    (let (buf)
      (setq buf (get-buffer-create "*Diff-regionA*"))
      (save-current-buffer
        (set-buffer buf)
        (erase-buffer))
      (append-to-buffer buf (region-beginning) (region-end)))
    )
  (message "Now select other region to compare and run `diff-region-now`")
  )

(defun diff-region-now ()
  "Compare current region with region already selected by `diff-region`"
  (interactive)
  (when (use-region-p)
    (let (bufa bufb)
      (setq bufa (get-buffer-create "*Diff-regionA*"))
      (setq bufb (get-buffer-create "*Diff-regionB*"))
      (save-current-buffer
        (set-buffer bufb)
        (erase-buffer))
      (append-to-buffer bufb (region-beginning) (region-end))
      (ediff-buffers bufa bufb))
    ))
;;^

;; Indent whole buffer, removes trailing witespaces and then reindents the whole thing
(defun wh/indent-whole-buffer ()
  "Indent whole buffer."
  (interactive)
  (if (string= "python-mode" major-mode)
      (let ((orig-point (point)))
        (mark-whole-buffer)
        (autopep8)
        (goto-char orig-point))
    (progn
      (delete-trailing-whitespace)
      (indent-region (point-min) (point-max) nil)
      (untabify (point-min) (point-max)))
    ))

(add-hook 'prog-mode-hook (lambda ()
                            (local-set-key (kbd "C-c i") 'wh/indent-whole-buffer)
                            ))

;; Improve beginning-of-line
(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

;; remap C-a to `smarter-move-beginning-of-line'
(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)
;;^


;; Revert all buffers utility function
(defun revert-all-buffers ()
  "Refreshes all open buffers from their respective files"
  (interactive)
  (let* ((list (buffer-list))
         (buffer (car list)))
    (while buffer
      (when (and (buffer-file-name buffer)
                 (not (buffer-modified-p buffer)))
        (set-buffer buffer)
        (revert-buffer t t t))
      (setq list (cdr list))
      (setq buffer (car list))))
  (message "Refreshed open files"))
;;^

;; EO Utility
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(message "And we are ready to go!")

;; Stuff automatically added by emacs:
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
