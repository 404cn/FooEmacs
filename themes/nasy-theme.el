;;; nasy-modeline.el --- Nasy's Emacs Configuration theme file.  -*- lexical-binding: t; -*-

;; Copyright (C) 2020  Nasy

;; Author: Nasy <nasyxx@gmail.com>

;;; Commentary:

;; Nasy's Emacs UI theme.

;;; Code:

(defgroup nasy-theme nil
  "Options of Nasy's theme."
  :group 'faces)

(defcustom nasy-theme-light/dark 'light
  "Nasy theme uses light theme or dark theme?"
  :group 'nasy-theme
  :type 'symbol)

(defcustom nasy-theme-org-scale t
  "Nasy theme uses scale up org or not?"
  :group 'nasy-theme
  :type 'boolean)

(defun nasy-theme-light?dark (light dark)
  "Determin using the light or the dark color of nasy-theme."
  (if (eq nasy-theme-light/dark 'light)
      light
    dark))
(defalias 'l?d #'nasy-theme-light?dark)

(defun nasy-theme-scale?not (scale)
  "Determin using org-mode scale or not."
  (if nasy-theme-org-scale
      scale
    1))
(defalias 's?n #'nasy-theme-scale?not)

(deftheme nasy)

(let* ((class '((class color) (min-colors 89)))
       (n-品红      "#F00056")
       (n-火红      "#FF2D51")
       (n-丁香      "#CCA4E3")
       (n-墨        "#50616D")
       (n-墨灰      "#758A99")
       (n-松绿      "#057748")
       (n-松花      "#BCE672")
       (n-湖蓝      "#30DFF3")
       (n-漆        "#161823")
       (n-牙        "#EEDEB0")
       (n-素        "#E0F0E9")
       (n-缟        "#F2ECDE")
       (n-茶        "#B35C44")
       (n-荼        "#F3F9F1")
       (n-霜        "#E9F1F6")
       (n-青莲      "#801DAE")
       (n-靛青      "#177CB0")
       (n-鱼肚      "#FCEFE8")
       (n-鸭黄      "#FAFF72")
       (n-鹅黄      "#FFF143")
       (n-黛        "#4A4266")
       (n/丁香青莲  (l?d n-青莲 n-青莲))
       (n/墨墨灰    (l?d n-墨 n-墨灰))
       (n/墨灰墨    (l?d n-墨灰 n-墨))
       (n/墨灰素    (l?d n-墨灰 n-素))
       (n/墨缟      (l?d n-墨 n-缟))
       (n/湖蓝靛青  (l?d n-湖蓝 n-靛青))
       (n/漆缟      (l?d n-漆 n-缟))
       (n/牙墨      (l?d n-牙 n-墨))
       (n/牙黛      (l?d n-牙 n-黛))
       (n/素墨      (l?d n-素 n-墨))
       (n/素墨灰    (l?d n-素 n-墨灰))
       (n/缟墨      (l?d n-缟 n-墨))
       (n/缟漆      (l?d n-缟 n-漆))
       (n/缟黛      (l?d n-缟 n-黛))
       (n/霜黛      (l?d n-霜 n-黛))
       (n/青莲丁香  (l?d n-青莲 n-丁香))
       (n/青莲牙    (l?d n-青莲 n-牙))
       (n/靛青湖蓝  (l?d n-靛青 n-湖蓝))
       (n/黛缟      (l?d n-黛 n-缟))
       (n/黛霜      (l?d n-黛 n-霜)))
  (custom-theme-set-faces
   'nasy
     ;;; essential styles
   `(default ((,class (:foreground ,n/墨缟 :background ,n/缟漆))))

     ;;; Basic
   `(bold ((,class (:weight bold))))
   ;; bold-italic
   ;; border
   `(button       ((,class (:box (:line-width 1) :underline t :weight bold))))
   `(cursor       ((,class (:background ,n/黛霜 :foreground ,n/霜黛))))
   `(error        ((,class (:background ,n-鱼肚 :foreground ,n-品红 :weight bold))))
   `(escape-glyph ((,class (:foreground ,n-茶))))
   `(fringe       ((,class (:background ,n/缟漆))))
   `(vertical-border ((t (:inherit default))))
   `(header-line  ((,class (:background ,n-荼
                                        :box (:line-width 2 :style released-button)
                                        :extend t
                                        :foreground ,n/靛青湖蓝))))
   `(highlight    ((,class (:background ,n/墨缟
                                        :distant-foreground ,n/霜黛))))
   `(link         ((,class (:foreground ,n-靛青  :underline t))))
   `(link-visited ((,class (:foreground ,n-青莲 :underline t))))
   `(secondary-selection
     ((,class (:background ,n-鱼肚))))
   `(success      ((,class (:background ,n-鱼肚 :foreground ,n-靛青 :weight bold))))
   `(warning      ((,class (:background ,n-鱼肚 :foreground ,n-茶 :weight bold))))

   ;; company
   `(company-box-scrollbar
     ((,class (:background ,n/黛缟
                           :box (:line-width 2 :style released-button)
                           :extend t
                           :foreground ,n/缟黛))))
   `(company-box-selection
     ((,class (:inherit company-box-scrollbar))))
   `(company-echo-common
     ((,class (:background ,n-茶 :foreground ,n-缟))))
   `(company-preview-common
     ((,class (:background ,n-荼 :foreground ,n-墨 :slant italic :weight bold))))
   `(company-scrollbar-bg
     ((,class (:background ,n-牙))))
   `(company-scrollbar-fg
     ((,class (:background ,n-茶 :foreground ,n-缟))))
   `(company-tooltip
     ((,class (:background ,n/霜黛 :foreground ,n/黛霜))))
   `(company-tooltip-common
     ((,class (:background ,n-素 :foreground ,n-松绿 :weight bold))))
   `(company-tooltip-common-selection
     ((,class (:background ,n/黛缟 :foreground ,n-松花 :inherit company-tooltip-common))))
   `(company-tooltip-selection
     ((,class (:background ,n/黛缟
                           :box (:style released-button)
                           ;; :extend t
                           :foreground ,n/缟黛))))

   ;; counsel & ivy
   `(all-the-icons-ivy-rich-icon-face
     ((t (:box (:line-width 2 :style released-button)
               :inherit default))))
   `(ivy-current-match
     ((,class (:background ,n/黛缟
                           :extend t
                           :foreground ,n/缟墨
                           :weight bold))))
   `(ivy-highlight-face
     ((,class (:inherit counsel-active-mode))))
   `(ivy-minibuffer-match-face-1
     ((,class (:background ,n-松花
                           :foreground ,n-墨
                           :weight bold))))
   `(ivy-minibuffer-match-face-2
     ((,class (:background ,n-鹅黄
                           :foreground ,n-墨
                           :weight bold))))
   `(ivy-minibuffer-match-face-3
     ((,class (:background ,n-丁香
                           :foreground ,n-墨
                           :weight bold))))
   `(ivy-minibuffer-match-face-4
     ((,class (:background ,n-火红
                           :foreground ,n-墨
                           :weight bold))))

   ;; custom faces
   `(custom-button
     ((,class (:box (:line-width 2 :style released-button)
                    :foreground ,n/霜黛
                    :background ,n/黛霜))))
   `(custom-button-mouse
     ((,class (:box (:line-width 2 :style released-button)
                    :background ,n/霜黛
                    :foreground ,n/黛霜))))
   `(custom-button-pressed
     ((,class (:box (:line-width 2 :style pressed-button)
                    :inherit custom-button))))
   `(custom-button-pressed-unraised
     ((,class (:foreground ,n-青莲 :inherit custom-button-unraised))))
   `(custom-button-unraised
     ((,class (:underline t))))
   `(custom-comment
     ((,class (:background ,n/霜黛 :foreground ,n/黛霜))))
   `(custom-group-tag
     ((,class (:foreground ,n-靛青
                           :height 1.4
                           :slant normal
                           :weight bold
                           :inherit variable-pitch))))
   `(custom-group-subtitle
     ((,class (:foreground ,n/墨缟
                           :height 1.2
                           :underline t
                           :weight bold))))
   `(custom-variable-obsolete
     ((,class (:foreground ,n/黛霜
                           :strike-through t))))
   `(custom-variable-tag
     ((,class (:foreground ,n-靛青
                           :slant normal
                           :weight bold))))

   ;; dashboard
   `(widget-button
     ((,class (:weight unspecified))))

   ;; display-fill-column-indicator-mode
   `(fill-column-indicator ((,class (:background ,n-湖蓝 :foreground ,n-靛青))))

   ;; font-lock faces
   `(font-lock-builtin-face
     ((,class (:background ,n/霜黛 :foreground ,n-松绿 :slant italic))))
   `(font-lock-comment-delimiter-face
     ((,class (:inherit font-lock-comment-face :weight bold))))
   `(font-lock-comment-face
     ((,class (:foreground ,n/墨灰素 :slant italic :underline t))))
   `(font-lock-constant-face
     ((,class (:inherit font-lock-variable-name-face :weight bold))))
   `(font-lock-doc-face
     ((,class (:background ,n/素墨 :foreground ,n/靛青湖蓝 :extend t))))
   `(font-lock-function-name-face
     ((,class (:foreground ,n-松绿 :underline t))))
   `(font-lock-keyword-face
     ((,class (:foreground ,n/墨缟 :weight bold))))
   `(font-lock-negation-char-face
     ((,class (:background ,n/牙黛 :foreground ,n/青莲牙))))
   `(font-lock-string-face
     ((,class (:foreground ,n/靛青湖蓝))))
   `(font-lock-type-face
     ((,class (:foreground ,n-松绿 :slant italic :weight bold))))
   `(font-lock-variable-name-face
     ((,class (:foreground ,n-茶))))
   `(font-lock-warning-face
     ((,class (:background ,n-鸭黄 :foreground ,n-墨 :weight bold))))

   ;; highlight line (hl-line)
   `(hl-line ((,class (:distant-foreground ,n/墨缟 :extend t :underline t :weight bold))))

   ;; mode line
   `(doom-modeline-buffer-minor-mode
     ((,class (:inherit mode-line))))
   `(doom-modeline-buffer-modified
     ((,class (:foreground ,n-火红
                           :inherit mode-line
                           :weight bold))))
   `(doom-modeline-info
     ((,class (:foreground ,n-靛青
                           :inherit mode-line
                           :weight bold))))
   `(doom-modeline-lsp-error
     ((,class (:inherit doom-modeline-urgent))))
   `(doom-modeline-lsp-running
     ((,class (:inherit doom-modeline-warning))))
   `(doom-modeline-lsp-warning
     ((,class (:inherit doom-modeline-warning))))
   `(doom-modeline-urgent
     ((,class (:foreground ,n-品红
                           :inherit mode-line
                           :weight bold))))
   `(doom-modeline-warning
     ((,class (:foreground ,n-松花
                           :inherit mode-line
                           :weight bold))))
   `(mode-line          ((,class (:background ,n-荼))))
   `(mode-line-inactive ((,class (:background ,n-素))))

   ;; org mode
   `(org-block
     ((,class (:background ,n-荼 :foreground ,n/墨缟 :extend t))))
   `(org-block-begin-line
     ((,class (:background ,n/素墨
                           :box (:line-width 1 :style released-button)
                           :extend t
                           :foreground ,n/墨缟
                           :weight bold
                           :slant italic))))
   `(org-document-title
     ((,class (:background ,n/素墨
                           :extend t
                           :foreground ,n/墨缟
                           :height ,(s?n 1.4)
                           :weight bold))))
   `(org-document-info
     ((,class (:background ,n/素墨
                           :extend t
                           :foreground ,n/墨缟
                           :height ,(s?n 1.2)
                           :slant italic))))
   `(org-document-info-keyword
     ((,class (:background ,n/素墨
                           :extend t
                           :foreground ,n/墨缟
                           :height ,(s?n 1.2)
                           :slant italic))))
   `(org-done
     ((,class (:box (:line-width 2 :style released-button)
                    :foreground ,n/墨缟))))
   `(org-headline-done
     ((,class (:underline (:color ,n-松花)))))
   `(org-level-1
     ((,class (:background ,n/素墨
                           :extend t
                           :foreground ,n-靛青
                           :height ,(s?n 1.4)
                           :underline t
                           :weight bold))))
   `(org-level-2
     ((,class (:background ,n/素墨
                           :extend t
                           :foreground ,n-茶
                           :height ,(s?n 1.2)
                           :weight bold))))
   `(org-level-3
     ((,class (:background ,n/素墨
                           :extend t
                           :foreground ,n-松绿
                           :height ,(s?n 1.1)
                           :weight bold))))
   `(org-level-4
     ((,class (:background ,n/素墨
                           :extend t
                           :foreground ,n/青莲丁香
                           :height ,(s?n 1.1)
                           :weight bold))))
   `(org-level-5
     ((,class (:extend t
                       :foreground ,n-靛青
                       :height ,(s?n 1.1)
                       :slant italic
                       :weight normal))))
   `(org-level-6
     ((,class (:extend t
                       :foreground ,n-茶
                       :height ,(s?n 1.1)
                       :slant italic
                       :weight normal))))
   `(org-level-7
     ((,class (:extend t
                       :foreground ,n-松绿
                       :height ,(s?n 1.1)
                       :slant italic
                       :weight normal))))
   `(org-level-8
     ((,class (:extend t
                       :foreground ,n/青莲丁香
                       :height ,(s?n 1.1)
                       :slant italic
                       :weight normal))))
   `(org-meta-line
     ((,class (:inherit font-lock-comment-face
                        :underline nil))))
   `(org-tag
     ((,class (:background ,n/牙黛
                           :box t
                           :foreground ,n/墨缟
                           :slant normal
                           :weight bold))))

   ;; meow
   `(meow-keypad-indicator          ((t (:foreground ,n-漆 :background ,n-品红))))
   `(meow-insert-indicator          ((t (:foreground ,n-松绿 :background ,n-松花))))
   `(meow-normal-indicator          ((t (:foreground ,n-墨 :background ,n-鹅黄))))
   `(meow-motion-indicator          ((t (:foreground ,n-墨灰 :background ,n-霜))))

   ;; tree sitter
   `(tree-sitter-hl-face:operator
     ((,class (:inherit font-lock-negation-char-face))))))

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'nasy)

(provide 'nasy-theme)
;;; nasy-theme.el ends here
