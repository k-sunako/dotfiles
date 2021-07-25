(setq gc-cons-threshold most-positive-fixnum)
(run-with-idle-timer
 10 nil
 (lambda ()
   (setq gc-cons-threshold (car (get 'gc-cons-threshold 'standard-value)))
   (message "gc-cons-threshold restored to %S" gc-cons-threshold)))

;;; Begin initialization
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

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

(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-page 'disabled nil)
;; '(emms-volume-amixer-card 4)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(create-lockfiles nil)
 '(display-line-numbers-width-start t)
 '(doom-themes-enable-bold t)
 '(doom-themes-enable-italic t)
 '(emms-volume-change-amount 10)
 '(emms-volume-change-function 'emms-volume-pulse-change)
 '(emms-volume-pulse-max-volume 200)
 '(irony-additional-clang-options '("-std=c++11"))
 '(lsp-inhibit-message t t)
 '(lsp-message-project-root-warning t t)
 '(org-agenda-files
   '("~/myspace/org-roam/daily/2021-07-11.org" "~/repos/learning-DAISY-feat-desc/reports/001.org" "/home/snowfox/myspace/Org/projects/prj-uml.org" "/home/snowfox/myspace/Org/projects/prj-topological-space.org" "/home/snowfox/myspace/Org/projects/prj-sage.org" "/home/snowfox/myspace/Org/projects/prj-project.org" "/home/snowfox/myspace/Org/projects/prj-probability.org" "/home/snowfox/myspace/Org/projects/prj-oss.org" "/home/snowfox/myspace/Org/projects/prj-lecture-ih-20210313.org" "/home/snowfox/myspace/Org/projects/prj-lecture-id-20201107.org" "/home/snowfox/myspace/Org/projects/prj-lecture-ed-20210314.org" "/home/snowfox/myspace/Org/projects/prj-lecture-ea-20210307.org" "/home/snowfox/myspace/Org/projects/prj-lecture-dl2.org" "/home/snowfox/myspace/Org/projects/prj-hacks.org" "/home/snowfox/myspace/Org/projects/prj-elisp.org" "/home/snowfox/myspace/Org/projects/prj-designpattern.org" "/home/snowfox/myspace/Org/projects/prj-cxx.org" "/home/snowfox/myspace/Org/core/math.org" "/home/snowfox/myspace/Org/core/linux.org" "/home/snowfox/myspace/Org/core/general.org" "/home/snowfox/myspace/Org/core/emacs.org" "~/myspace/Org/inbox.org"))
 '(org-agenda-time-grid
   '((daily today require-timed remove-match)
     (800 1000 1200 1400 1600 1800 2000)
     "......" "----------------"))
 '(org-download-backend "curl \"%s\" -o \"%s\"")
 '(org-download-method 'attach)
 '(org-download-screenshot-file "/tmp/screenshot_.png")
 '(org-download-screenshot-method "scrot -s %s")
 '(org-journal-date-format "%A, %d %B %Y")
 '(org-journal-dir "~/Dropbox/Org/journal")

 '(org2blog/wp-image-thumbnails t)
 '(org2blog/wp-image-upload t)
 '(package-selected-packages
   '(elisp-benchmarks browse-at-remote gh esup nntwitter dynamic-ruler graphviz-dot-mode dynamic-graphs dash lsp-pyright lsp-ui emms typescript-mode treemacs-magit treemacs-projectile burly magic-latex-buffer math-preview org-latex-impatient lispy beacon gcmh org-roam-bibtex org-ref ddskk-posframe elisp-format modus-vivendi-theme org-roam helm org-roam-server flatland-theme super-save auto-save-buffers-enhanced org-sidebar helm-org-rifle org-helm-rifle org-alert org-timeline emacsql-sqlite dap-ui vterm vterm-toggle company-quickhelp company-math openwith metaweblog ob-ipython deadgrep bibtex-utils deft helm-bibtex dired-single diredfl dired-subtree peep-dired dired-launch flycheck-mypy golden-ratio xelb ox-pandoc pdf-tools helm-tramp helm-org shell-pop realgud-ipdb cider ripgrep rg lsp-mode jedi-core pipenv with-venv org-drill google-translate iy-go-to-char atom-one-dark-theme engine-mode org-cliplink poly-R poly-markdown ess jupyter processing-mode sml-mode dap-mode yasnippet-snippets yasnipet-snippes yasnipeet-snippes dashboard doom-modeline doom-themes org2blog company-ein helm-projectile undo-tree realgud atomic-chrome gnuplot gnuplot-mode auctex powerline lispxmp restart-emacs elfeed avy open-junk-file multiple-cursors wrap-region shackle google-this magit migemo habitica wanderlust company-racer cargo pyenv-mode csharp-mode company-ghc haskell-mode cuda-mode rtags editorconfig cmake-mode helm-dash company aggressive-indent smartparens flycheck iedit expand-region org-journal org-download org-bullets ob-rust interleave helm-swoop projectile hydra sequential-command which-key ztree use-package poet-theme exec-path-from-shell diminish ddskk))
 '(processing-location "/usr/bin/processing-java")
 '(ripgrep-arguments '("-M 100"))
 '(warning-suppress-types
   '((org-roam)
     (comp)
     (yasnippet backquote-change)
     (:warning))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(doom-modeline-bar ((t (:background "#6272a4")))))
