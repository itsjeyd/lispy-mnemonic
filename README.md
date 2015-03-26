## lispy-mnemonic.el [![License: GPL](https://img.shields.io/badge/license-GPL-blue.svg)](http://opensource.org/licenses/GPL-3.0)

[Mnemonic](https://en.wikipedia.org/wiki/Mnemonic) key bindings for
[`lispy`](https://github.com/abo-abo/lispy)!

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
