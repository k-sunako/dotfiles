;; シンボリックリンクの読み込みを許可
(setq vc-follow-symlinks t)
;; シンボリックリンク先のVCS内で更新が入った場合にバッファを自動更新
(setq auto-revert-check-vc-info t)

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

(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))

(defun ora-test-emacs ()
  (interactive)
  (require 'async)
  (async-start
   (lambda () (shell-command-to-string
          "emacs --batch --eval \"
(condition-case e
    (progn
      (load \\\"~/.emacs.d/init.el\\\")
      (message \\\"-OK-\\\"))
  (error
   (message \\\"ERROR!\\\")
   (signal (car e) (cdr e))))\""))
   `(lambda (output)
      (if (string-match "-OK-" output)
          (when ,(called-interactively-p 'any)
            (message "All is well"))
        (switch-to-buffer-other-window "*startup error*")
        (delete-region (point-min) (point-max))
        (insert output)
        (search-backward "ERROR!")))))

(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(irony-additional-clang-options (quote ("-std=c++11")))
 '(package-selected-packages
   (quote
    (zenburn-theme yasnippet-snippets wrap-region which-key wanderlust use-package undo-tree super-save spacemacs-theme solarized-theme smartparens slime shackle sequential-command rtags restart-emacs realgud racer pyenv-mode projectile prodigy powerline persp-mode pelican-mode paredit org2blog org-ref org-plus-contrib org-gcal org-download org-bullets open-junk-file ob-rust ng2-mode multiple-cursors monokai-theme migemo magit lispxmp jedi irony interleave iedit helm-swoop helm-google helm-dash google-translate google-this gnuplot-mode gnuplot flycheck-rust expand-region exec-path-from-shell emmet-mode elpy elfeed editorconfig diminish ddskk csharp-mode company-ghc cmake-mode cargo avy auto-save-buffers-enhanced auctex atomic-chrome aggressive-indent))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
