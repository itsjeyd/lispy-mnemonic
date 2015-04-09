## lispy-mnemonic.el [![License: GPL](https://img.shields.io/badge/license-GPL-blue.svg)](http://opensource.org/licenses/GPL-3.0)

This package provides a minor mode that sets up
[mnemonic](https://en.wikipedia.org/wiki/Mnemonic) key bindings for
[Lispy](https://github.com/abo-abo/lispy). `lispy-mnemonic` also makes
extensive use of [hydras](https://github.com/abo-abo/hydra) for
grouping related commands and improving discoverability.

### Background

`lispy-mnemonic` started out as an attempt to make it easier for
myself to learn Lispy. I'm familiar with the concept of modal editing,
but I'm not a Vim user (which means that it doesn't come naturally to
me to use, e.g., <kbd>hjkl</kbd> for movement). Also, I find it harder
to commit a key sequence to memory if it is completely unrelated to
the command it is bound to (as evidenced by the fact that I rely
heavily on mnemonics in my
[personal Emacs configuration](https://github.com/itsjeyd/.emacs.d)).

### Philosophy

There are probably some exceptions but in general, key binding
choices are based on the following principles:

1. **Make key bindings match command names.** Alternatively, base key
   binding choices on default bindings for related functionality that
   ships with Emacs.

2. **Group related commands** under a common prefix. Separate commands
   that share a common prefix in Lispy if they don't seem to be
   strongly related in terms of functionality.

3. **Improve discoverability**, but don't be overly obtrusive.

4. **Do not override default key bindings** (especially if the
   functionality they provide is completely unrelated to the command
   you are trying to bind).

### Target Audience

If you:

- would like to start learning Lispy
- have played around with Lispy but not mastered it
- haven't burned Vim-style key bindings into your muscle memory
- find that mnemonics make it easier to learn and remember new
  commands and key bindings

... there is a good chance you'll benefit from using `lispy-mnemonic`.

If you have already memorized most or all of Lispy's commands and key
bindings (kudos!), you probably don't need this package. But before
you leave, *do* have a look at the
[hydras](https://github.com/itsjeyd/lispy-mnemonic/blob/master/bindings.org#hydras)
that `lispy-mnemonic` ships with. Who knows, maybe you'll find a
couple that you like :)

### Installation

`lispy-mnemonic` is not on [MELPA](http://melpa.org/) (yet). To start using
it, follow these steps:

1. If you haven't already, install [`lispy`](https://github.com/abo-abo/lispy):

   <kbd>M-x</kbd> `package-install` <kbd>RET</kbd> `lispy` <kbd>RET</kbd>

2. Clone this repo:

        git clone https://github.com/itsjeyd/lispy-mnemonic.git

3. Add the following to your init-file:

        (add-to-list 'load-path "~/path/to/lispy-mnemonic/")
        (require 'lispy-mnemonic)

4. **Optional**: To turn `lispy-mnemonic-mode` on automatically for,
   e.g., buffers that are in `emacs-lisp-mode`, add the following code
   to your init-file:

        (add-hook 'emacs-lisp-mode-hook 'lispy-mnemonic-mode)

### Usage

Do <kbd>M-x</kbd> `lispy-mnemonic-mode` <kbd>RET</kbd> to turn
`lispy-mnemonic-mode` on or off.

See [here](https://github.com/itsjeyd/lispy-mnemonic/blob/master/bindings.org) for a full list of bindings.

### Customization

By default, `lispy-mnemonic` does not alter Lispy bindings that
conflict with default bindings for built-in commands. If you would
like to restore the original behavior of any bindings that Lispy
overrides, add the following to your init-file:

    (setq lispy-mnemonic-restore-bindings t)

Here is a list of bindings that will be restored:

| Keys | Command                 |
|------|-------------------------|
| C-2  | digit-argument          |
| C-3  | digit-argument          |
| C-4  | digit-argument          |
| C-7  | digit-argument          |
| C-8  | digit-argument          |
| C-9  | digit-argument          |
| M-,  | tags-loop-continue      |
| M-m  | back-to-indentation     |
| M-i  | tab-to-tab-stop         |
| M-j  | indent-new-comment-line |
| M-J  | indent-new-comment-line |
