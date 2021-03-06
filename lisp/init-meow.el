;;; -*- lexical-binding: t -*-

(defun meow-setup ()
  (setq meow-cheatsheet-layout meow-cheatsheet-layout-qwerty)
  (meow-motion-overwrite-define-key
   '("j" . meow-next)
   '("k" . meow-prev))
  (meow-leader-define-key
   ;; basic
   '("v" . magit)
   '("b" . switch-to-buffer)
   '("t" . tab-bar-select-tab-by-name)
   '("i" . counsel-imenu)
   '("SPC" . counsel-M-x)
   '("d" . dired)
   '("L" . display-line-numbers-mode)
   '("S" . ispell-word)
   ;; project
   '("p s" . counsel-git-grep)
   '("p p" . project-switch-project)
   '("p f" . project-find-file)
   '("p b" . project-switch-to-buffer)
   '("p K" . project-kill-buffers)
   '("p e" . project-eshell)
   ;; xref
   '("." . xref-find-definitions)
   '("z" . xref-pop-marker-stack)
   '("," . xref-pop-marker-stack)
   '("Z" . xref-find-references)
   '("?" . xref-find-references)
   ;; wrap
   '("'" . meow-wrap-string)
   '("(" . meow-wrap-round)
   '("[" . meow-wrap-square)
   '("{" . meow-wrap-curly)
   '("}" . meow-forward-barf)
   '(")" . meow-forward-slurp)
   '("e" . meow-eval-last-exp)
   '(";" . meow-comment)
   ;; window
   '("w" . ace-window)
   '("W" . ace-swap-window)
   '("o" . delete-other-windows)
   '("q" . delete-window)
   '("-" . split-window-below)
   '("\\" . split-window-right)
   ;; SPC j/k will run the original command in MOTION state.
   '("j" . meow-motion-origin-command)
   '("k" . meow-motion-origin-command)
   ;; Use SPC (0-9) for digit arguments.
   '("1" . meow-digit-argument)
   '("2" . meow-digit-argument)
   '("3" . meow-digit-argument)
   '("4" . meow-digit-argument)
   '("5" . meow-digit-argument)
   '("6" . meow-digit-argument)
   '("7" . meow-digit-argument)
   '("8" . meow-digit-argument)
   '("9" . meow-digit-argument)
   '("0" . meow-digit-argument))
  (meow-normal-define-key
   '("-" . hs-hide-block)
   '("=" . hs-show-block)
   '("_" . hs-hide-all)
   '("+" . hs-show-all)
   '("0" . meow-expand-0)
   '("9" . meow-expand-9)
   '("8" . meow-expand-8)
   '("7" . meow-expand-7)
   '("6" . meow-expand-6)
   '("5" . meow-expand-5)
   '("4" . meow-expand-4)
   '("3" . meow-expand-3)
   '("2" . meow-expand-2)
   '("1" . meow-expand-1)
   '("'" . negative-argument)
   '(";" . meow-reverse)
   '("," . meow-inner-of-thing)
   '("." . meow-bounds-of-thing)
   '("<" . meow-beginning-of-thing)
   '(">" . meow-end-of-thing)
   '("a" . meow-append)
   '("A" . meow-open-below)
   '("b" . meow-back-word)
   '("B" . meow-back-symbol)
   '("c" . meow-change)
   '("C" . meow-change-save)
   '("d" . meow-kill)
   '("x" . meow-delete)
   '("f" . meow-find)
   '("F" . meow-find-expand)
   '("g" . meow-keyboard-quit)
   '("G" . goto-line)
   '("h" . meow-head)
   '("H" . meow-head-expand)
   '("i" . meow-insert)
   '("I" . meow-open-above)
   '("m" . meow-mark-word)
   '("M" . meow-mark-symbol)
   '("s" . meow-search)
   '("S" . meow-pop-search)
   '("t" . meow-till)
   '("T" . meow-till-expand)
   '("w" . meow-next-word)
   '("W" . meow-next-symbol)
   '("j" . meow-next)
   '("J" . meow-next-expand)
   '("o" . meow-block)
   '("O" . meow-block-expand)
   '("k" . meow-prev)
   '("K" . meow-prev-expand)
   '("q" . meow-quit)
   '("r" . meow-replace)
   '("R" . meow-replace-save)
   '("l" . meow-tail)
   '("L" . meow-tail-expand)
   '("n" . scroll-up-command)
   '("N" . scroll-down-command)
   '("u" . undo)
   '("U" . undo-redo)
   '("v" . meow-line)
   '("V" . meow-visit)
   '("e" . meow-join)
   '("E" . delete-indentation)
   '("y" . meow-save)
   '("p" . meow-yank)
   '("z" . meow-pop-selection)
   '("Z" . meow-pop-all-selection)
   '("?" . meow-cheatsheet)
   '("&" . meow-query-replace)
   '("%" . meow-query-replace-regexp)
   '("<f3>" . meow-start-kmacro)
   '("<f4>" . meow-end-or-call-kmacro)
   '("<escape>" . meow-last-buffer)))

(leaf meow
  :straight
  (meow :type git :host github :repo "DogLooksGood/meow")
  :require t
  :global-minor-mode meow-global-mode
  :config
  (meow-setup-line-number)
  (meow-setup))

(provide 'init-meow)
