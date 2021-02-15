;;; -*- lexical-binding: t -*-

;; (use-package magit
;;   :commands (magit))
;;
;; (use-package magit-todos
;;   :after magit
;;   :config
;;   (let ((inhibit-message t))
;;     (magit-todos-mode 1))
;;   (transient-append-suffix 'magit-status-jump '(0 0 -1)
;;     '("T " "Todos" magit-todos-jump-to-todos)))
;;
;; (use-package dired-git-info
;;   :bind
;;   (:map dired-mode-map
;;         ("v" . dired-git-info-mode))
;;   :custom
;;   (dgi-auto-hide-details-p nil))

(leaf magit
  :straight t
  :commands magit)

(leaf magit-todos
  :straight t
  :after magit
  (let ((inhibit-message t))
    (magit-todos-mode 1))
  (transient-append-suffix 'magit-status-jump '(0 0 -1)
    '("T " "Todos" magit-todos-jump-to-todos)))

(leaf dired-git-info
  :straight t
  :bind ((:dired-mode-map
          ("v" . dired-git-info-mode)))
  :custom
  (dgi-auto-hide-details-p . nil))

(provide 'init-git)
