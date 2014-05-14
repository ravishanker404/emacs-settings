;;Editor settings
(global-linum-mode 1)
(scroll-bar-mode 0)
(auto-save-mode 0)
(tool-bar-mode -1)
(menu-bar-mode -1)
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))
(setq-default indent-tabs-mode nil)
(set-default-font "Monaco 14")


;; magitshortcut
(global-set-key (kbd "C-x g") 'magit-status)

;;Toggle comment and uncomment
;; Original idea from  http://www.opensubscriber.com/message/emacs-devel@gnu.org/10971693.html
;; (defun toggle-comment-region (&optional arg)
;;   "Replacement for the comment-dwim command.
;;         If no region is selected and current line is not blank and we are not at the end of the line,
;;         then comment current line.
;;         Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
;;   (interactive "*P")
;;   (comment-normalize-vars)
;;   (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
;;       (comment-or-uncomment-region (line-beginning-position) (line-end-position))
;;     (comment-dwim arg)))
;; (global-unset-key (kbd "C-?"))
;; (global-set-key (kbd "C-?") 'toggle-comment-region)

(defun toggle-comment-region (&optional arg)
  "Replacement for the 'comment-dwim' command.
ARG: The number of comment character to use in the comment.
If no region is selected and current line is not blank and we are not
at the end of the line,then comment current line.
Replaces default behavior of 'comment-dwim', when it inserts
comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))

(global-unset-key (kbd "C-x /"))
(global-set-key (kbd "C-x /") 'toggle-comment-region)


;;TO STOP POP UPS
(setq pop-up-windows nil)
(setq use-dialog-box nil)

(add-hook 'after-init-hook 'after-init-hook-hook)


(defun after-init-hook-hook ()
  (load-theme 'monokai)
  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:complete-on-dot t)
)


(toggle-frame-fullscreen)
