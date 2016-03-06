;;; control_gc.el ---
;;
;; Description:
;; Author: Elric Milon
;; Created: Fri Feb 12 18:21:32 2016 (+0100)


;; From: https://bling.github.io/blog/2016/01/18/why-are-you-changing-gc-cons-threshold/

;; This works surprisingly well. While the minibuffer is open, garbage collection will never occur, but once we make a
;; selection, or cancel, garbage collection will kick off immediately and then revert back to the default, sensible
;; behavior.
;; No more random freezing! Success!

(defun my-minibuffer-setup-hook ()
  (setq gc-cons-threshold most-positive-fixnum))

(defun my-minibuffer-exit-hook ()
  (setq gc-cons-threshold 800000))

(add-hook 'minibuffer-setup-hook #'my-minibuffer-setup-hook)
(add-hook 'minibuffer-exit-hook #'my-minibuffer-exit-hook)
