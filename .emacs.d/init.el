;; (setq gc-cons-threshold most-positive-fixnum)
;; (run-with-idle-timer
;;  10 nil
;;  (lambda ()
;;    (setq gc-cons-threshold (car (get 'gc-cons-threshold 'standard-value)))
;;    (message "gc-cons-threshold restored to %S" gc-cons-threshold)))

;;; Begin initialization
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

(setq native-comp-deferred-compilation-deny-list nil)

;; シンボリックリンクの読み込みを許可
(setq vc-follow-symlinks t)
;; シンボリックリンク先のVCS内で更新が入った場合にバッファを自動更新
(setq auto-revert-check-vc-info t)

(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
  (package-install 'diminish)
  (package-install 'bind-key))

(eval-when-compile
  (require 'use-package))

(require 'diminish)
(require 'bind-key)

(setq straight-vc-git-default-clone-depth 1)
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(setq package-enable-at-startup nil)
(setq straight-disable-native-compile t)

(add-to-list 'load-path "~/.emacs.d/straight/build/org/")
(require 'org-loaddefs)

(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))



;;(defun ora-test-emacs ()
;;  (interactive)
;;  (require 'async)
;;  (async-start
;;   (lambda () (shell-command-to-string
;;          "emacs --batch --eval \"
;;(condition-case e
;;    (progn
;;      (load \\\"~/.emacs.d/init.el\\\")
;;      (message \\\"-OK-\\\"))
;;  (error
;;   (message \\\"ERROR!\\\")
;;   (signal (car e) (cdr e))))\""))
;;   `(lambda (output)
;;      (if (string-match "-OK-" output)
;;          (when ,(called-interactively-p 'any)
;;            (message "All is well"))
;;        (switch-to-buffer-other-window "*startup error*")
;;        (delete-region (point-min) (point-max))
;;        (insert output)
;;        (search-backward "ERROR!")))))
