;; Copyright 2014 Federico Casares <warptrosse@gmail.com>
;;
;; Licensed under the Apache License, Version 2.0 (the "License");
;; you may not use this file except in compliance with the License.
;; You may obtain a copy of the License at
;;
;;     http://www.apache.org/licenses/LICENSE-2.0
;;
;; Unless required by applicable law or agreed to in writing, software
;; distributed under the License is distributed on an "AS IS" BASIS,
;; WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;; See the License for the specific language governing permissions and
;; limitations under the License.

;;-----------------------------------------------------------------------------;;
;; INIT

;; Debugger is called when an error is signaled.
(setq debug-on-error t)

;; Init server if it was not initializad before.
(server-start)
;;-----------------------------------------------------------------------------;;


;;-----------------------------------------------------------------------------;;
;; GLOBAL

;; Lisp extensions folder (default = ~/.emacs.d).
(setq ext-folder user-emacs-directory)

;; Remove initial screen.
(setq-default inhibit-startup-message t)

;; Initialize in fullscreen mode.
(setq-default initial-frame-alist (quote ((fullscreen . maximized))))

;; Moving cursor down at bottom scrolls only a single line, not half page.
(setq-default scroll-step 1)

;; Will make "Ctrl-k" kills an entire line if the cursor is at the
;; beginning of line.
;;(setq-default kill-whole-line t)

;; "y or n" instead of "yes or no".
(fset 'yes-or-no-p 'y-or-n-p)

;; Enable CUA mode.
(cua-mode t)

;; Setup encoding.
(set-locale-environment "en_US.UTF-8")
(set-language-environment "UTF-8")
(setq-default file-name-coding-system 'utf-8)
(setq-default keyboard-coding-system 'utf-8)
(setq-default terminal-coding-system 'utf-8)
(setq-default buffer-file-coding-system 'utf-8)
(setq-default coding-system-for-read 'utf-8)
(setq-default coding-system-for-write 'utf-8)
(setq-default locale-coding-system 'utf-8)
(setq-default prefer-coding-system 'utf-8)
(require 'iso-transl)

;; Causes the contexts of all buffers to be saved.
(setq-default save-buffer-context t)

;; A buffer's auto-save file is deleted when you save the buffer
;; in its visited file.
(setq-default delete-auto-save-files t)

;; C-x 2 tries to avoid shifting any text on the screen by putting point in
;; whichever window happens to contain the screen line the cursor is already on.
(setq-default split-window-keep-point t)

;; The symbol sentence-end is bound to the pattern that marks the end of a
;; sentence.
(setq-default sentence-end "[.?!][]\"')}]*\\($\\|       \\| \\)[ ]*")

;; Specify the shell file name used by M-x shell.
(setq-default shell-file-name "/bin/bash")

;; Specify printing format.
(setq-default ps-paper-type 'a4)

;; Set grep command.
(setq-default grep-find-command "find . \\( -type d -name .svn -prune \\) -o \\( -type d -name .git -prune \\) -o \\( -name \"*\" -type f -print0 \\) | xargs -0 grep -nHi ")
;;-----------------------------------------------------------------------------;;


;;-----------------------------------------------------------------------------;;
;; MODES

;; Cmake mode.
(autoload 'cmake-mode (concat ext-folder "/cmake-mode/cmake-mode.el") t)

;; JavaScript mode.
(autoload 'js2-mode (concat ext-folder "/js2-mode/js2.el") t)

;; Batch mode.
(autoload 'dos-mode (concat ext-folder "/dos-mode/dos.el") t)

;; PHP mode.
(autoload 'php-mode (concat ext-folder "/php-mode/php-mode.el") t)

;; Association between file extensions and emacs modes to be loaded.
(setq-default auto-mode-alist
              (append
               '(
                 ("\\.[k]?sh$" . sh-mode)
                 ("\\.t?csh$" . sh-mode)
                 ("\\.cshrc$" . sh-mode)
                 ("\\.login$" . sh-mode)
                 ("\\.bash$" . sh-mode)
                 ("\\.kshrc$" . sh-mode)
                 ("\\.profile$" . sh-mode)
                 ("\\.mak$" . makefile-mode)
                 ("\\.lex$" . jflex-mode)
                 ("\\.[lyY]$" . c++-mode)
                 ("\\.c$" . c-mode)
                 ("\\.c\\+\\+$" . c++-mode)
                 ("\\.iC$" . c++-mode)
                 ("\\.cpp$" . c++-mode)
                 ("\\.uil$" . c++-mode)
                 ("\\.java$" . jde-mode)
                 ("\\.hxx$" . jde-mode)
                 ("\\.jpp$" . jde-mode)
                 ("\\.hpp$" . c++-mode)
                 ("\\.h$" . c++-mode)
                 ("\\.tex$" . latex-mode)
                 ("\\.exp$" . text-mode)
                 ("\\.vm$" . emacs-lisp-mode)
                 ("\\.g$" . antlr-mode)
                 ("\\.wkp$" . wikipedia-mode)
                 ("\\.[Ii][Nn][Cc]$" . fortran-mode)
                 ("\\.F$" . fortran-mode)
                 ("\\.cgi$" . perl-mode)
                 ("\\.phtml$" . php-mode)
                 ("\\.php.?$" . php-mode)
                 ("\\.css$" . css-mode)
                 ("\\.xml$" . xml-mode)
                 ("\\.xsd$" . xml-mode)
                 ("SConstruct" . python-mode)
                 ("SConscript" . python-mode)
                 ("\\.eml" . tbemail-mode)
                 ("CMakeLists\\.txt\\'" . cmake-mode)
                 ("\\.cmake\\'" . cmake-mode)
                 ("\\.bat$" . dos-mode)
                 ("\\.json$" . js2-mode)
                 ("\\.js$" . js2-mode)
                 )
               auto-mode-alist
               ))

;; Will make text-mode default.
(setq-default major-mode 'text-mode)

;; Will init with text-mode.
(setq-default initial-major-mode 'text-mode)
;;-----------------------------------------------------------------------------;;


;;-----------------------------------------------------------------------------;;
;; INTERFACE

;; Disable toolbar.
(tool-bar-mode -1)

;; Remove scroll bar.
(toggle-scroll-bar -1)

;; Display line and column number.
(cond (window-system
       (display-time)
       (setq-default line-number-mode t)
       (setq-default column-number-mode t)))

;; Will make the display of date and time persistent.
(setq-default display-time-day-and-date t) (display-time)

;; Show line numbers on buffers.
(global-linum-mode t)
;;-----------------------------------------------------------------------------;;


;;-----------------------------------------------------------------------------;;
;; STYLE

;; Highlight selected regions.
(transient-mark-mode t)

;; Spaces instead of tabs.
(setq-default indent-tabs-mode nil)

;; A matching parenthesis is highlighted based on the location of point.
(show-paren-mode t)

;; Will highlight during query.
(setq-default query-replace-highlight t)

;; Highlight incremental search.
(setq-default search-highlight t)

;; Color-theme.
(add-to-list 'load-path (concat ext-folder "/color-theme"))
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-hober)))

;; 80 Characters indicator.
(add-to-list 'load-path (concat ext-folder "/fill-column-indicator"))
(require 'fill-column-indicator)
(setq-default fci-rule-width 1)
(setq-default fci-rule-color "white")
(setq-default fci-rule-column 80)

;; Set intentation level.
(setq-default c-basic-offset 4)

;; Saving or writing a file silently puts a newline at the end if there isn't
;; already one there.
(setq-default require-final-newline t)

;; Show trailing white-spaces.
(setq-default show-trailing-whitespace t)
;;-----------------------------------------------------------------------------;;


;;-----------------------------------------------------------------------------;;
;; MAN PAGES

;; Load Man Pages Helper.
(require 'woman)
(setq-default woman-manpath '("/usr/share/man"))

;; Use colo(u)r instead of bold & underscore.
(setq-default woman-always-colour-faces t)

;; Fill up the full width of the frame when laying out the page.
(setq-default woman-fill-frame t)
;;-----------------------------------------------------------------------------;;


;;-----------------------------------------------------------------------------;;
;; RECENT STUFF

;; Minor mode that builds a list of recently opened files.
(require 'recentf)
(recentf-mode t)
(setq-default recentf-max-menu-items 25)
;;-----------------------------------------------------------------------------;;


;;-----------------------------------------------------------------------------;;
;; TEMPLATES

;; yasnippet. A template system for Emacs.
(add-to-list 'load-path (concat ext-folder "/yasnippet"))
(require 'yasnippet)
(yas/global-mode t)
;;-----------------------------------------------------------------------------;;


;;-----------------------------------------------------------------------------;;
;; CEDET

;; Load CEDET.
(load-file (concat ext-folder "/cedet/cedet-devel-load.el"))
(add-to-list 'load-path (concat ext-folder "/cedet/contrib"))

;; Enable Semantic features.
(semantic-load-enable-minimum-features)
(semantic-load-enable-all-exuberent-ctags-support)
(semantic-load-enable-code-helpers)
(semantic-load-enable-gaudy-code-helpers)
(semantic-load-enable-excessive-code-helpers)
(semantic-load-enable-semantic-debugging-helpers)

;; Enable Semanticdb.
(require 'semantic/db)

;; To use additional features for names completion, and displaying
;; of information for tags & classes.
(require 'semantic/ia)

;; To normal work with system-wide libraries, Semantic should has
;; access to system include files, that contain information about
;; functions & data types, implemented by these libraries.
(require 'semantic/bovine/gcc)

;; Enable eassist.
(require 'eassist)

;; Enable semantic-tag-folding.
(require 'semantic-tag-folding)

;; Enable EDE (Project Management) features.
(global-ede-mode t)

;; Provides a fancy folding mode.
(global-semantic-tag-folding-mode t)

;; Minor mode to highlight the first line of the current tag.
(global-semantic-highlight-func-mode t)

;; Idle breadcrumbs mode displays the tag containing point and its
;; surrounding tags. The nesting structure of the tags is transformed
;; into path much like with directories and files in a filesystem but
;; for classes and members. This path is displayed in the header-line
;; or mode-line and updated when Emacs is idle.
(global-semantic-idle-breadcrumbs-mode t)

;; Enable SRecode (Template management) minor-mode.
(global-srecode-minor-mode t)

;; Speed up parsing by disabling searches in system headers.
(setq-mode-local c-mode semanticdb-find-default-throttle
                 '(project unloaded system recursive))
(setq-mode-local c++-mode semanticdb-find-default-throttle
                 '(project unloaded system recursive))

;; This enables the display of a menu with a list of functions, variables,
;; and other tags.
(add-hook 'semantic-init-hooks (lambda() (imenu-add-to-menubar "TAGS")))

;; The name of the directory where SemanticDB cache files are saved.
(setq-default semanticdb-default-save-directory (concat ext-folder "/tmp"))

;; ECB.
(add-to-list 'load-path (concat ext-folder "/ecb"))
(require 'ecb)
(setq-default ecb-options-version "2.40")
(setq-default ecb-tip-of-the-day nil)
;;-----------------------------------------------------------------------------;;


;;-----------------------------------------------------------------------------;;
;; SPELL CHECK

;; Set spell check program.
(setq-default ispell-program-name "aspell")

;; Set spell check dictionary.
(setq-default ispell-dictionary "english")
;;-----------------------------------------------------------------------------;;


;;-----------------------------------------------------------------------------;;
;; ADDONS

;; Search google.
(defun search-google ()
  "Prompt for a query in the minibuffer, launch the web browser and query google."
  (interactive)
  (let ((search (read-from-minibuffer "Google Search: ")))
    (browse-url (concat "http://www.google.com/search?q=" search)))
  )

;; Search wikipedia.
(defun search-wikipedia ()
  "Prompt for a query in the minibuffer, launch the web browser and query Wikipedia."
  (interactive)
  (let ((search (read-from-minibuffer "Wikipedia Search: ")))
    (browse-url (concat "http://en.wikipedia.org/wiki/Special:Search?search=" search)))
  )

;; Indent all doc.
(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))
;;-----------------------------------------------------------------------------;;


;;-----------------------------------------------------------------------------;;
;; KEYS

;; Comment region.
(global-set-key [f1] 'comment-region)

;; Uncomment region.
(global-set-key [f2] 'uncomment-region)

;; Indent document.
(global-set-key [f3] 'iwb)

;; Highlight line.
(global-set-key [f4] 'hl-line-mode)

;; Complete the current symbol at point.
(global-set-key [f5] 'semantic-ia-complete-symbol)

;; Complete the current symbol via a menu based at point.
(global-set-key [f6] 'semantic-ia-complete-symbol-menu)

;; Pop up a tooltip for completion at point.
(global-set-key [f7] 'semantic-ia-complete-tip)

;; Find references to the current tag.
(global-set-key [f8] 'semantic-symref)

;; Jump to the tag referred to by the code at point.
(global-set-key [f9] 'semantic-ia-fast-jump)

;; Easily switch between body and its corresponding header file.
(global-set-key [f10] 'eassist-switch-h-cpp)

;; Show method/function list of current buffer in a newly created buffer.
(global-set-key [f11] 'eassist-list-methods)

;;
;;(global-set-key [f12] ')

;; Man Page.
(global-set-key [C-f1] (lambda() (interactive) (woman (current-word))))

;; Spellcheck the word under the cursor.
(global-set-key [C-f2] 'ispell-word)

;; Grep find.
(global-set-key [C-f3] 'grep-find)

;; List recently opened files.
(global-set-key [C-f4] 'recentf-open-files)

;; Fold all the tags in this buffer.
(global-set-key [C-f5] 'semantic-tag-folding-fold-all)

;; Unfold overlay OV, or the smallest enclosing tag at point.
(global-set-key [C-f6] 'semantic-tag-folding-show-block)

;; Fold the smallest enclosing tag at point.
(global-set-key [C-f7] 'semantic-tag-folding-fold-block)

;; Toggle speedbar.
(global-set-key [C-f9] 'speedbar)
;;-----------------------------------------------------------------------------;;

;;-----------------------------------------------------------------------------;;
;; PROJECTS

(cond (
       (file-exists-p (concat ext-folder "projects.el"))
       (load-file (concat ext-folder "projects.el"))
       ))
;;-----------------------------------------------------------------------------;;
