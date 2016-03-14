set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'slindberg/vim-colors-smyck.git'
Plugin 'ivalkeen/vim-ctrlp-tjump.git'
Plugin 'tacahiroy/ctrlp-funky.git'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'godlygeek/tabular.git'
Plugin 'git://github.com/tpope/vim-surround.git'
" Plugin 'ag.vim.git'
Plugin 'scrooloose/syntastic.git'
Plugin 'vim-scripts/tComment.git'
Plugin 'Lokaltog/vim-easymotion.git'
" Plugin 'https://github.com/Shougo/neocomplete.vim.git'
Plugin 'ervandew/supertab.git'
Plugin 'vim-phpfmt.git'
Plugin 'vim-php-cs-fixer.git'
Plugin 'SirVer/ultisnips.git'
Plugin 'honza/vim-snippets.git'
Plugin 'tommcdo/vim-exchange.git'
Plugin 'terryma/vim-multiple-cursors.git'
Plugin 'mhinz/vim-signify.git'
Plugin 'Yggdroot/indentLine.git'
Plugin 'FooSoft/vim-argwrap.git'
Plugin 'Shougo/vimproc.vim.git'
Plugin 'leafgarland/typescript-vim.git'
Plugin 'juneedahamed/vc.vim'
Plugin 'Quramy/tsuquyomi.git'
Plugin 'pangloss/vim-javascript.git'
Plugin 'Chiel92/vim-autoformat.git'
Plugin 'ryanoasis/vim-devicons'
Plugin 'skwp/greplace.vim'
Plugin 'reedes/vim-colors-pencil.git'
Plugin 'ludovicchabant/vim-gutentags.git'
Plugin 'jeetsukumaran/vim-filebeagle.git'
Plugin 'FelikZ/ctrlp-py-matcher.git'
Bundle 'tyru/current-func-info.vim'
Plugin 'jiangmiao/auto-pairs.git'
Bundle 'tobyS/pdv'
Bundle 'tobyS/vmustache.git'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'StanAngeloff/php.vim.git'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'AndrewRadev/splitjoin.vim.git'
Plugin 'tpope/vim-dispatch.git'
Plugin 'wincent/ferret.git'
" Plugin 'troydm/asyncfinder.vim.git'

" Plugin 'tpope/vim-rsi.git'
" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on
