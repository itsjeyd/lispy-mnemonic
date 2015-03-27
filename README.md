## lispy-mnemonic.el [![License: GPL](https://img.shields.io/badge/license-GPL-blue.svg)](http://opensource.org/licenses/GPL-3.0)

[Mnemonic](https://en.wikipedia.org/wiki/Mnemonic) key bindings for
[`lispy`](https://github.com/abo-abo/lispy)!

### Background

This package started out as an attempt to make it easier for myself to
learn Lispy. I'm familiar with the concept of modal editing, but I'm
not a Vim user (which means that it doesn't come naturally to me to
use, e.g., <kbd>hjkl</kbd> for movement). Also, I find it harder to
commit a key sequence to memory if it is completely unrelated to the
command it is bound to (as evidenced by the fact that I rely heavily
on mnemonics in my
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

### Usage

See [here](https://github.com/itsjeyd/lispy-mnemonic/blob/master/bindings.org) for a full list of bindings.
