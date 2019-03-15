;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(clojure
     racket
     javascript
     html
     markdown
     ivy
     auto-completion
     emacs-lisp
     git
     markdown
     org
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom
            shell-default-shell 'eshell)
     spell-checking
     (python :variables python-test-runner 'pytest)
     (evil-snipe :variables evil-snipe-enable-alternate-f-and-t-behaviors t)
     gtags
     pandoc
     (c-c++ :variables c-c++-enable-clang-support t)
     debug
     )))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-light)

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers t

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'changed))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."

  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  ;; Turn fill column indicator and autofill on for all programming modes.
  (spacemacs/add-to-hook 'prog-mode-hook '(turn-on-fci-mode auto-fill-mode))
  (spacemacs/add-to-hook 'markdown-mode-hook '(turn-on-fci-mode auto-fill-mode))

  ;; Set line numbers' format.
  (setq linum-format "%4d ")
  ;; Do not quit the server with SPC q q
  (evil-leader/set-key "q q" (defun prompt-frame-killer ()
                               (interactive)
                               (save-some-buffers)
                               (if (not (frame-parameter nil 'client))
                                   (setq spacemacs-really-kill-emacs t))
                               (kill-emacs)))
  ;; Forward and back buttons.
  (spacemacs/set-leader-keys "]" 'evil-jump-forward)
  (spacemacs/set-leader-keys "[" 'evil-jump-backward)

  ;; Use .dir-locals when using tramp.
  (setq enable-remote-dir-locals 't)

  ;; Fix issue with returning from evilified state (normally ESC switches back
  ;; to efilified state).
  (add-hook 'evil-evilified-state-exit-hook
            'evilified-state--restore-normal-state-keymap)

  ;; Fix for tramp.
  (defun process-lines (program &rest args)
    "Execute PROGRAM with ARGS, returning its output as a list of lines.
Signal an error if the program returns with a non-zero exit status."
    (with-temp-buffer
      (let ((status (apply 'process-file program nil (current-buffer) nil args)))
        (unless (eq status 0)
	        (error "%s exited with status %s" program status))
        (goto-char (point-min))
        (let (lines)
	        (while (not (eobp))
	          (setq lines (cons (buffer-substring-no-properties
			                         (line-beginning-position)
			                         (line-end-position))
			                        lines))
	          (forward-line 1))
	        (nreverse lines)))))
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
