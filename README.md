Emacs configuration files
=====

# Overview:

This repository contains a custom emacs configuration, including the
**.emacs** file and the extensions.

NOTE: You can download the extensions from their respective original locations
(see [Extensions Included](https://github.com/warptrosse/emacs#extensions-included)
section). The extensions are included in this repository only to provide a
quick installation procedure.


# Features Included:

## Global
* Removed initial screen.
* Fullscreen mode.
* Scrolls only a single line.
* "y or n" instead of "yes or no".
* CUA mode.
* UTF-8 encoding.
* All buffers save.
* Delete auto-save files.
* Custom grep-command.

## Modes
* CMake
* Javascript
* Batch
* PHP
* Emacs default modes.
* ...

## Interface
* Disabled toolbar.
* Removed scroll bar.
* Display line and column number.
* Display of current date and time.
* Show line numbers on buffers.

## Style
* Highlight selected regions.
* Spaces instead of tabs.
* A matching parenthesis is highlighted based on the location of point.
* Highlight during query.
* Highlight incremental search.
* Color-theme.
* 80 Characters indicator.
* Newline at the end of file.

## Man Pages

* WOMAN

## Recent Stuff

* recentf

## Templates

* yasnippet

## CEDET

* Full semantic features included.
  * minimum-features
  * all-exuberent-ctags-support
  * code-helpers
  * gaudy-code-helpers
  * excessive-code-helpers
  * semantic-debugging-helpers
  * semantic/db
  * semantic/ia
  * semantic/bovine/gcc
  * eassist
  * semantic-tag-folding
  * semantic-tag-folding-mode
  * semantic-highlight-func-mode
  * semantic-idle-breadcrumbs-mode
* Full EDE (Project Management) features.
* SRecode mode.
* Full ECB features.
* Speedbar.

## Spellcheck

* aspell

## Addons

* Google search.
* Wikipedia serch.
* Intent all buffer.
* Custom keys.

# Extensions Included:

* CEDET 1.1                  - http://cedet.sourceforge.net/
* ECB 2.40.1                 - http://ecb.sourceforge.net/
* ctags 5.8                  - http://ctags.sourceforge.net/
* color-theme 6.6.0          - http://www.nongnu.org/color-theme/
* fill-column-indicator 1.83 - https://github.com/alpaker/Fill-Column-Indicator
* yasnippet 0.8.0            - https://github.com/capitaomorte/yasnippet
* js2-mode 20090723          - https://github.com/mooz/js2-mode
* cmake-mode                 - http://www.cmake.org/Wiki/CMake/Editors/Emacs
* dos-mode 2.17              - http://www.emacswiki.org/emacs/DosMode
* php-mode 1.13              - https://github.com/ejmr/php-mode

# Installation:

```bash
$ cd ~/
$ git clone https://github.com/warptrosse/emacs.git
$ cp -R ~/emacs/ext/* ~/.emacs.d/
$ cp ~/emacs/.emacs ~/.emacs
$ cd ~/.emacs.d/cedet && make
$ cd ~/.emacs.d/ecb && make
$ cd ~/.emacs.d/php-mode && make
```

# Additional information:
