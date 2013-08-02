mopub's dotfiles
===================

Requirements
------------

Currently supports sh, bash and zsh shells

Install
-------

Clone this repo: 

    git clone git://github.com/mopub/dotfiles.git

Install:

    cd dotfiles
    ./install.sh

This will create symlinks for config files in your home directory.
Any existing symlinks will be replaced. Existing files can be backed up,
overwritten or skipped.

What's in it?
-------------

[vim](http://www.vim.org/) configuration:

* Use [Vundle](https://github.com/gmarik/vundle) to manage plugins.
* Set `<leader>` to comma.

Plugins
* [a.vim](https://github.com/steffanc/a.vim) to switch between header and source files.
* [ack.vim](https://github.com/steffanc/ack.vim) to search entire projects.
* [vim-airline.vim](https://github.com/bling/vim-airline.vim) for a minimal status line.
* [cscopemaps.vim](https://github.com/steffanc/cscopemaps.vim) to easily navigate ctags.
* [ctrlp.vim](https://github.com/kien/ctrlp.vim) for fuzzy file/buffer/tag finding.
* [vim-fugitive](https://github.com/tpope/vim-fugitive.vim) for git in vim.
* [neocomplcache](https://github.com/Shougo/neocomplcache) for autocompletion.
* [nerdcommenter](https://github.com/scrooloose/nerdcommenter) for easy commenting.
* [nerdtree](https://github.com/scrooloose/nerdtree) for easy file tree exploration.

Tools
* Use [Ag](https://github.com/ggreer/the_silver_searcher) instead of Grep when available.
* Use [Exuberant Ctags](http://ctags.sourceforge.net/) for looking up definitions and declarations.
* Use [Cscope](http://cscope.sourceforge.net/) to easily navigate ctags.
* Use [wombat256mod](http://www.vim.org/scripts/script.php?script_id=2465) color scheme.

[tmux](http://tmux.sourceforge.net/) configuration:

* Colored status bar
* Vim based navigation between splits

[git shortcuts](http://git-scm.com/) configuration:

* Common git commands made into functions in order to avoid polluting shell namespace
* Optionally able to make these functions into aliases

Credits
-------

Thank you to Turtle, Steffan and Haydn putting this together as a part of their
hackweek project. Thanks to all mopub engineers that have contributed their configs.

Also, thank you countless existing dotfile repos from which scripts were
modified and design was inspired.

