;; configs
;; (use-package :split-sequence)
(ql-dist:install-dist "http://dist.ultralisp.org/" :prompt nil)

(in-package :lem-user)
(load-theme "emacs-dark")
(lem-vi-mode:vi-mode)

;; setup paredit
(lem:add-hook lem:*find-file-hook*
              (lambda (buffer)
                (when (eq (buffer-major-mode buffer) 'lem-lisp-mode:lisp-mode)
                  (change-buffer-mode buffer 'lem-paredit-mode:paredit-mode t))))

;; (ql:quickload :lem-sdl2)
;; Keybinding
(define-key lem-vi-mode:*command-keymap* "g g" 'previous-page)
(define-key lem-vi-mode:*command-keymap* "c-w c" 'delete-active-window)
(define-key lem-vi-mode:*command-keymap* "c-w v" 'split-active-window-vertically)
(define-key lem-vi-mode:*command-keymap* "c-w s" 'split-active-window-horizontally)
(define-key lem-lisp-mode:*lisp-mode-keymap* "c-c l s" 'lem-lisp-mode:start-lisp-repl)
(define-key *global-keymap* "C-x t r" 'toggle-read-only)
