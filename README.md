# dotvim2

## 1. Installation

### I. Clone dotvim2 into .vim directory

https://github.com/foxkill/dotvim2.git .vim

### II. Clone Pluginmanager Vundle into the Bundle Directory

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

### III. Start Vim (ignore error messages)

at the prompt enter the command
:PluginInstall

### IV. After installing all plugin goto into the directory .vim/bundle/vimproc.vim

a) pushd ~/.vim/bundle/vimproc.vim
b) make
c) popd

## 2. Install a plugin

[i.e. installing vim/vinegear]

a) open the file plugins.vim
> vim plugins.vim
b) a the git url into the plugin section

...
Plugin 'https://github.com/juneedahamed/vc.vim'
Plugin 'https://github.com/vim-airline/vim-airline-themes.git'
Plugin 'https://github.com/Quramy/tsuquyomi.git'
-> Plugin 'git://github.com/tpope/vim-vinegar.git'


c) open .vimrc
:e $MYVIMRC<cr>

d) source .vimrc
so %

e) call PluginInstall
:PluginInstall
