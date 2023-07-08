# Archived - no longer used

# vim-config

## Assumptions

The following are assumed by the configuration, but you should be easily able
to work around these with a minimum of effort, I just had no reason to.

* MacOS
* iTerm2

I have not tested this configuration on any version of Linux, but should work
with only minor tweaks if any.

## Prerequisites

This particular `vim` configuration has a few dependencies that require manual
installation or configuration if you are going to use the configuration exactly
as is.

* `vundle` - a plugin manager for vim
* Monaco font patched for Powerline/Nerd Fonts
* Solarized Dark color scheme for iTerm2
* markdown.pl if you want markdown preview

## Installation

### Install Fonts

Download the Monaco for Powerline Nerd Font Complete font file from
[toahexxx's github](https://raw.githubusercontent.com/taohexxx/fonts/master/no_ligatures/Monaco%20for%20Powerline%20Nerd%20Font%20Complete.otf)

Open the downloaded file with Font Book (on MacOS) and following instructions to install.

### Configure Color Scheme and Fonts for iTerm2

> If you use only the gui version of `vim` you can skip this section.

Download [solarized.zip](http://ethanschoonover.com/solarized/files/solarized.zip)
and extract the archive. Within the archive you will find a directory named
`iterm2-colors-solarized`. Import either or both of the Dark and Light schemes
into the iTerm2 profile of your choice.

Also set the `Font` and `Non-ASCII Font` selection in your iTerm2 profile
to use the `12pt Monaco for Powerline Nerd Font Complete` (or whatever font
size you prefer).

### Install Daring Fireball's markdown.pl

If using MacOS just do a `brew install markdown` otherwise you can find
instructions on the [Daring Fireball Markdown project page](https://daringfireball.net/projects/markdown/)

### Clone the vim-config project

Change directories to a location where you want to store the project, then
clone the git repo:

    git clone git@github.com:sebling/vim-config.git

This will create a directory named `vim-config` in your current directory.

### Clone the `vundle` project

Change directories to the newly cloned project `vim-config` and create
a directory named `bundle`. Then clone the `vundle` project using the following
command:

    git clone https://github.com/VundleVim/Vundle.vim.git bundle/Vundle.vim

### Set .vim and .vimrc links

> If you already have a `~/.vim` directory or a `~/.vimrc` file, please copy
them off to a safe backup location, because the following instructions will
overwrite them.

Create a symbolic link in your home directory for the `~/.vim` directory,
pointing to the git project:

    ln -s /path/to/git/project/vim-config ~/.vim

Next, create a symbolic link in your home directory for the `~/.vimrc` file,
pointing to the `vimrc` file in the git project directory:

    ln -s /path/to/git/project/vim-config/vimrc ~/.vimrc

Alternatively, the link for `~/.vimrc` can point to the `vimrc` in the
previously linked `~/.vim` directory:

    ln -s ~/.vim/vimrc ~/.vimrc

### Plugin Install

At this point, you should be able to start `vim` and install the plugins.
Once you have `vim` started, issue the following command in `vim`:

    :PluginInstall

This is a command provided by the `vundle` plugin (which we manually installed
earlier). 

> At a future date, you can pull updates to the plugins using the :PluginUpdate
command.
