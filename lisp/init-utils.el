;;; -*- lexical-binding: t -*-

(defun font-installed-p (font-name)
  "Check if font with FONT-NAME is available."
  (find-font (font-spec :name font-name)))

(defface +modeline-dim-face
  '((((class color) (background dark))
     (:foreground "grey40"))
    (((class color) (background light))
     (:foreground "grey60")))
  "Dim face in mode-line")

(defvar-local +smart-file-name-with-propertize-cache nil
  "Cache for performance, is a cons of (buffer-name . cached-value).")

(defun +smart-file-name ()
  "Get current file name, if we are in project, the return relative path to the project root, otherwise return absolute file path.
This function is slow, so we have to use cache."
  (let ((vc-dir (vc-root-dir))
        (bfn (buffer-file-name (current-buffer))))
    (cond
     ((and bfn vc-dir)
      (file-relative-name bfn vc-dir))
     (bfn bfn)
     (t (buffer-name)))))

(defun +smart-file-name-cached ()
  (-when-let ((buf-name p f) +smart-file-name-with-propertize-cache)
    (when (string-equal buf-name (buffer-file-name))
      (let ((face (cond
                   ((buffer-modified-p) 'font-lock-string-face)
                   (buffer-read-only 'font-lock-comment-face)
                   (t nil))))
        (concat (propertize p 'face '+modeline-dim-face) (propertize f 'face face))))))

(defun +smart-file-name-with-propertize ()
  (if-let ((bfn (buffer-file-name)))
      (if-let ((cached (+smart-file-name-cached)))
          cached
        (let ((vc-dir (vc-root-dir)))
          (if vc-dir
              (let* ((fname (file-relative-name bfn vc-dir))
                     (p (file-name-directory fname))
                     (f (file-name-nondirectory fname)))
                (setq-local +smart-file-name-with-propertize-cache (list (buffer-file-name) p f))
                (+smart-file-name-cached))
            (let* ((p (file-name-directory bfn))
                   (f (file-name-nondirectory bfn)))
              (setq-local +smart-file-name-with-propertize-cache (list (buffer-file-name) p f))
              (+smart-file-name-cached)))))
    (buffer-name)))

(defun +file-vc-state-with-propertize ()
  (when-let ((sym (vc-state (buffer-file-name (current-buffer)))))
    (format "%s" sym)))

(defun +vc-branch ()
  (car (vc-git-branches)))

(defun +simple-mode-line-render (left right)
  "Return a string of `window-width' length.
Containing LEFT, and RIGHT aligned respectively."
  (let ((available-width
         (- (window-total-width)
            (+ (length (format-mode-line left))
               (string-width (format-mode-line right))))))
    (append left
            (list (format (format "%%%ds" available-width) ""))
            right)))

(provide 'init-utils)
