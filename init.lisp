;; configs
;; (use-package :split-sequence)
;; (ql-dist:install-dist "http://dist.ultralisp.org/" :prompt nil)




(in-package :lem-user)
(load-theme "emacs-dark")
(lem-vi-mode:vi-mode)

(setf *scroll-recenter-p* nil)

(setf line-numbers-mode t)

;; (setf (variable-name 'leader-key :global) "Space")


;; setup paredit
(lem:add-hook lem:*find-file-hook*
              (lambda (buffer)
                (when (eq (buffer-major-mode buffer) 'lem-lisp-mode:lisp-mode)
                  (change-buffer-mode buffer 'lem-paredit-mode:paredit-mode t))))

(define-key lem-vi-mode:*motion-keymap* "c-w c" 'delete-active-window)
(define-key lem-vi-mode:*motion-keymap* "c-w v" 'split-active-window-vertically)
(define-key lem-vi-mode:*motion-keymap* "c-w s" 'split-active-window-horizontally)
(define-key lem-lisp-mode:*lisp-mode-keymap* "c-c l s" 'lem-lisp-mode:start-lisp-repl)
(define-key *global-keymap* "C-x t r" 'toggle-read-only)
(define-key lem-vi-mode:*motion-keymap* "m-c-l" 'lem-paredit-mode:paredit-slurp)
(define-key lem-vi-mode:*motion-keymap* "m-c-h" 'lem-paredit-mode:paredit-barf)


;; vi mode stuff

;; (define-key lem-vi-mode:*insert-keymap* "spc enter" ')

;; (leml:add-hook lem:*find-file-hook*
              ;; (lambda (buffer)
                ;; (when (eq (buffer-major-mode buffer) 'lisp-mode)
                  ;; (change-buffer-mode buffer 'vi-sexp t))))

;; For REPL mode, change the vi-mode to INSERT on startup.
;; (lem:add-hook lem-lisp-mode:*lisp-repl-mode-hook*
              ;; (lambda ()
                ;; (change-state 'insert)))

;; For SLDB mode, change the vi-mode to NORMAL.
;; (lem:add-hook lem-lisp-mode:*lisp-sldb-mode-hook*
              ;; (lambda ()
                ;; (change-state 'normal)))

;; Delete the next element with 'D' instead of deleting to the end-of-line
;; to keep the parenthesis balanced.
;; (define-command delete-next-sexp-on-paredit-mode (&optional (n 1)) ("p")
  ;; (if (find 'vi-sexp (buffer-minor-modes (current-buffer)))
      ;; (dotimes (i n)
        ;; (kill-sexp))
      ;; (call-command 'vi-delete-line n)))
;; (define-key lem-vi-mode:*normal-keymap* "D" 'delete-next-sexp-on-paredit-mode)

;; Delete the next element with 'C' instead of deleting to the end-of-line
;; to keep the parenthesis balanced.
;; (define-command change-next-sexp-on-paredit-mode (&optional (n 1)) ("p")
  ;; (if (find 'vi-sexp (buffer-minor-modes (current-buffer)))
      ;; (progn
        ;; (dotimes (i n)
          ;; (kill-sexp))
        ;; (change-state 'insert))
      ;; (call-command 'vi-change-line n)))
;; (define-key lem-vi-mode:*normal-keymap*  "C" 'change-next-sexp-on-paredit-mode)

;; M-x slime-qlot-exec
;; Establish a new SWANK connection in a project-local dist.
;; See https://github.com/fukamachi/qlot for the details.
;;
;; It also requires micros in the ./.qlot/local-projects directory.
;;   $ git clone https://github.com/lem-project/micros .qlot/local-projects


;; For REPL mode, change the vi-mode to INSERT on startup.
;; (lem:add-hook lem-lisp-mode:*lisp-repl-mode-hook*
              ;; (lambda ()
                ;; (change-state 'insert)))

;; For SLDB mode, change the vi-mode to NORMAL.
;; (lem:add-hook lem-lisp-mode:*lisp-sldb-mode-hook*
              ;; (lambda ()
                ;; (change-state 'normal)))

;; Delete the next element with 'D' instead of deleting to the end-of-line
;; to keep the parenthesis balanced.
;; (define-command delete-next-sexp-on-paredit-mode (&optional (n 1)) ("p")
  ;; (if (find 'vi-sexp (buffer-minor-modes (current-buffer)))
      ;; (dotimes (i n)
        ;; (kill-sexp))
      ;; (call-command 'vi-delete-line n)))
;; (define-key *normal-keymap* "D" 'delete-next-sexp-on-paredit-mode)

;; Delete the next element with 'C' instead of deleting to the end-of-line
;; to keep the parenthesis balanced.
;; (define-command change-next-sexp-on-paredit-mode (&optional (n 1)) ("p")
  ;; (if (find 'vi-sexp (buffer-minor-modes (current-buffer)))
      ;; (progn
        ;; (dotimes (i n)
          ;; (kill-sexp))
        ;; (change-state 'insert))
      ;; (call-command 'vi-change-line n)))
;; (define-key *normal-keymap* "C" 'change-next-sexp-on-paredit-mode)

;; M-x slime-qlot-exec
;; Establish a new SWANK connection in a project-local dist.
;; See https://github.com/fukamachi/qlot for the details.
;;
;; It also requires micros in the ./.qlot/local-projects directory.
;;   $ git clone https://github.com/lem-project/micros .qlot/local-projects
;; (define-command slime-qlot-exec (directory) ((prompt-for-directory (format nil "Project directory (~A): " (buffer-directory))))
  ;; (let ((command (first (lem-lisp-mode/implementation::list-roswell-with-qlot-commands))))
    ;; (when command
      ;; (lem-lisp-mode:run-slime command :directory directory))))
 
;; (asdf:clear-source-registry)



;; (let ((asdf:*central-registry* (cons #P"~/.lem/" asdf:*central-registry*)))
    ;; (ql:quickload :lem-my-init))

;; Disable frame-multiplexer, which shows a switcher at the top of the window.
;; I can't find a good way to utilize it.
;; (remove-hook *after-init-hook* 'lem/frame-multiplexer::enable-frame-multiplexer)