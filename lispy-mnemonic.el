;;; lispy-mnemonic.el --- Mnemonic key bindings for Lispy.

;; Copyright (C) 2015 Tim Krones

;; Author: Tim Krones <t.krones@gmx.net>
;; Version: 0.1
;; Package-Requires: ((lispy "0.23.0") (hydra "0.12.0"))
;; URL: https://github.com/itsjeyd/lispy-mnemonic
;; Keywords: lisp

;;; This file is not part of GNU Emacs

;;; License

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; This package provides a set of mnemonic[1] key bindings for
;; Lispy[2]. It also makes extensive use of hydras[3] for grouping
;; related commands and improving discoverability.
;;
;; Background
;;
;; lispy-mnemonic started out as an attempt to make it easier for
;; myself to learn Lispy. I'm familiar with the concept of modal
;; editing, but I'm not a Vim user (which means that it doesn't come
;; naturally to me to use, e.g., hjkl for movement). Also, I find it
;; harder to commit a key sequence to memory if it is completely
;; unrelated to the command it is bound to.
;;
;; Philosophy
;;
;; There are probably some exceptions but in general, key binding
;; choices are based on the following principles:
;;
;; 1. *Make key bindings match command names.* Alternatively, base key
;;    binding choices on default bindings for related functionality
;;    that ships with Emacs.
;;
;; 2. *Group related commands* under a common prefix. Separate
;;    commands that share a common prefix in Lispy if they don't seem
;;    to be strongly related in terms of functionality.
;;
;; 3. *Improve discoverability*, but don't be overly obtrusive.
;;
;; 4. *Do not override default key bindings* (especially if the
;;    functionality they provide is completely unrelated to the
;;    command you are trying to bind).
;;
;; Target Audience
;;
;; If you:
;;
;; - would like to start learning Lispy
;; - have played around with Lispy but not mastered it
;; - haven't burned Vim-style key bindings into your muscle memory
;; - find that mnemonics make it easier to learn and remember new
;;   commands and key bindings
;;
;; ... there is a good chance you'll benefit from using lispy-mnemonic.
;;
;; If you have already memorized most or all of Lispy's commands and
;; key bindings (kudos!), you probably don't need this package. But
;; before you leave, *do* have a look at the hydras that
;; lispy-mnemonic ships with[4]. Who knows, maybe you'll find a couple
;; that you like :)
;;
;; Installation
;;
;; lispy-mnemonic is not on MELPA[5] (yet). To start using it, follow
;; these steps:
;;
;; 1. If you haven't already, install Lispy:
;;
;;    M-x package-install RET lispy RET
;;
;; 2. Clone this repo:
;;
;;    $ git clone https://github.com/itsjeyd/lispy-mnemonic.git
;;
;; 3. Add the following code to your init-file:
;;
;;    (add-to-list 'load-path "~/path/to/lispy-mnemonic/")
;;    (require 'lispy-mnemonic)
;;
;; Usage
;;
;; See [6] for a full list of bindings.
;;
;; Links
;;
;; [1] https://en.wikipedia.org/wiki/Mnemonic
;; [2] https://github.com/abo-abo/lispy
;; [3] https://github.com/abo-abo/hydra
;; [4] https://github.com/itsjeyd/lispy-mnemonic/blob/master/bindings.org#hydras
;; [5] http://melpa.org/
;; [6] https://github.com/itsjeyd/lispy-mnemonic/blob/master/bindings.org

;;; Code:

(require 'lispy)
(require 'hydra)

;;;;;;;;;;;;;
;;; Hydra ;;;
;;;;;;;;;;;;;

(defhydra hydra-lispy-ace (:color blue)
  "Lispy ace"
  ("c" lispy-ace-char "char")
  ("p" lispy-ace-paren "paren")
  ("r" lispy-ace-symbol-replace "replace")
  ("s" lispy-ace-symbol "symbol")
  ("w" lispy-ace-subword "word")
  ("d" lispy-goto-def-ace "definition")
  ("t" lispy-teleport "teleport"))

(defhydra hydra-lispy-debug ()
  "Lispy debug"
  ("e" lispy-edebug "edebug")
  ("s" lispy-debug-step-in "step in")
  ("S" lispy-edebug-stop "stop")
  ("d" lispy-describe "describe"))

(defhydra hydra-lispy-eval (:color blue)
  "Lispy eval"
  ("e" lispy-eval "eval")
  ("r" lispy-eval-and-replace "replace" :color red)
  ("o" lispy-eval-other-window "other window")
  ("i" lispy-eval-and-insert "insert")
  ("c" lispy-eval-and-comment "comment"))

(defhydra hydra-lispy-goto (:color blue)
  "Lispy goto"
  ("a" lispy-goto-def-ace "ace")
  ("d" lispy-goto-def-down "down")
  ("f" lispy-follow "follow")
  ("g" lispy-goto "goto")
  ("l" lispy-goto-local "local")
  ("p" lispy-goto-projectile "projectile")
  ("r" lispy-goto-recursive "recursive")
  ("s" lispy-goto-symbol "symbol")
  ("." lispy-goto-symbol "symbol")
  ("*" pop-tag-mark "pop tag mark"))

(defhydra hydra-lispy-mark ()
  "Lispy mark"
  ("m" lispy-mark "mark (or expand)")
  ("c" lispy-mark-car "car")
  ("l" lispy-mark-list "list")
  ("s" lispy-mark-symbol "symbol")
  ("L" lispy-mark-left "left")
  ("R" lispy-mark-right "right"))

(defhydra hydra-lispy-move ()
  "Lispy move"
  ("d" lispy-move-down "down")
  ("l" lispy-move-left "left")
  ("r" lispy-move-right "right")
  ("u" lispy-move-up "up"))

(defhydra hydra-lispy-raise ()
  "Lispy raise"
  ("r" lispy-raise "raise")
  ("s" lispy-raise-some "some"))

(defhydra hydra-lispy-slurp ()
  "Lispy slurp"
  (">" lispy-slurp "slurp")
  ("s" lispy-slurp "slurp")
  ("d" lispy-down-slurp "down")
  ("u" lispy-up-slurp "up")
  ("<" lispy-barf "barf")
  ("b" lispy-barf "barf"))

(defhydra hydra-lispy-x ()
  "Lispy x"
  ("f" lispy-flatten "flatten")
  ("c" lispy-to-cond "to cond")
  ("d" lispy-to-defun "to defun")
  ("i" lispy-to-ifs "to ifs")
  ("l" lispy-to-lambda "to lambda")
  ("r" lispy-eval-and-replace "replace")
  ("b" lispy-bind-variable "bind variable")
  ("u" lispy-unbind-variable "unbind variable"))

;;;;;;;;;;;;;;;;;;;;
;;; Key Bindings ;;;
;;;;;;;;;;;;;;;;;;;;

;; Global bindings (work in any context)

(define-key lispy-mode-map (kbd "[") 'lispy-brackets)
(define-key lispy-mode-map (kbd "s-d") 'hydra-lispy-debug/body)
(define-key lispy-mode-map (kbd "s-m") 'hydra-lispy-mark/body)
(define-key lispy-mode-map (kbd "s-x") 'hydra-lispy-x/body)
(define-key lispy-mode-map (kbd "C-(") 'lispy-arglist-inline)
(define-key lispy-mode-map (kbd "C-)") 'lispy-arglist-inline)
(define-key lispy-mode-map (kbd "C-;") 'lispy-describe-inline)
(define-key lispy-mode-map (kbd "C-.") 'lispy-kill-at-point)
(define-key lispy-mode-map (kbd "C-1") 'lispy-string-oneline)
(define-key lispy-mode-map (kbd "M-n") 'lispy-forward)
(define-key lispy-mode-map (kbd "M-p") 'lispy-backward)
(define-key lispy-mode-map (kbd "M-o") 'lispy-parens-down)
(define-key lispy-mode-map (kbd "s-l") 'lispy-left)
(define-key lispy-mode-map (kbd "s-o") 'lispy-out-forward-newline)
(define-key lispy-mode-map (kbd "s-r") 'lispy-right)

;; Local bindings (work in "special" only)

;; a-z

(lispy-define-key lispy-mode-map (kbd "a") 'hydra-lispy-ace/body)
(lispy-define-key lispy-mode-map (kbd "e") 'hydra-lispy-eval/body)
(lispy-define-key lispy-mode-map (kbd "g") 'hydra-lispy-goto/body)
(lispy-define-key lispy-mode-map (kbd "m") 'hydra-lispy-move/body)
(lispy-define-key lispy-mode-map (kbd "x") 'hydra-lispy-x/body)
(lispy-define-key lispy-mode-map (kbd ">") 'hydra-lispy-slurp/body)
(lispy-define-key lispy-mode-map (kbd "d") 'lispy-down)
(lispy-define-key lispy-mode-map (kbd "l") 'lispy-left)
(lispy-define-key lispy-mode-map (kbd "n") 'lispy-forward)
(lispy-define-key lispy-mode-map (kbd "o") 'lispy-occur)
(lispy-define-key lispy-mode-map (kbd "p") 'lispy-backward)
(lispy-define-key lispy-mode-map (kbd "r") 'lispy-right)
(lispy-define-key lispy-mode-map (kbd "s") 'lispy-different)
(lispy-define-key lispy-mode-map (kbd "u") 'lispy-up)
(lispy-define-key lispy-mode-map (kbd "w") 'lispy-new-copy)
(lispy-define-key lispy-mode-map (kbd "z") 'lispy-repeat)
(lispy-define-key lispy-mode-map (kbd "*") 'pop-tag-mark)
(lispy-define-key lispy-mode-map (kbd "/") 'lispy-undo)

;; A-Z

(lispy-define-key lispy-mode-map (kbd "D") 'hydra-lispy-debug/body)
(lispy-define-key lispy-mode-map (kbd "R") 'hydra-lispy-raise/body)
(lispy-define-key lispy-mode-map (kbd "E") 'lispy-ediff-regions)
(lispy-define-key lispy-mode-map (kbd "U") 'lispy-unstringify)

(provide 'lispy-mnemonic)
