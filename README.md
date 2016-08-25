# dotfiles
linux/unix dotfiles

## bash
The .bash_profile (for interactive bash shells) loads .profile
which then loads .bashrc (for non-interactive bash shells) and
.bash_aliases.

## mutt
The .mailcap is set up to help with using an html
viewer in mutt for viewing html-formatted e-mail.

## git
The .gitconfig provides some nice starting settings,
*but a couple of fields have template values for user information fields
that _must_ be filled in*.

## vim
The .vimrc starts by loading [vim-sensible](https://github.com/tpope/vim-sensible)
and then layers additional settings on top of that.
