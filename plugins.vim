filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'https://github.com/kien/ctrlp.vim.git'
Plugin 'https://github.com/slindberg/vim-colors-smyck.git'
Plugin 'https://github.com/bling/vim-airline.git'
Plugin 'https://github.com/majutsushi/tagbar.git'
Plugin 'https://github.com/godlygeek/tabular.git'
Plugin 'git://github.com/tpope/vim-surround.git'
Plugin 'https://github.com/rking/ag.vim.git'
Plugin 'https://github.com/scrooloose/syntastic.git'
Plugin 'https://github.com/vim-scripts/tComment.git'
Plugin 'https://github.com/vim-php/tagbar-phpctags.vim.git'
Plugin 'https://github.com/Lokaltog/vim-easymotion.git'
Plugin 'https://github.com/Raimondi/delimitMate.git'
Plugin 'https://github.com/Shougo/neocomplete.vim.git'
Plugin 'https://github.com/dericofilho/vim-phpfmt.git'
Plugin 'https://github.com/stephpy/vim-php-cs-fixer.git'
Plugin 'https://github.com/SirVer/ultisnips.git'
Plugin 'https://github.com/honza/vim-snippets.git'
Plugin 'git://github.com/tommcdo/vim-exchange.git'
Plugin 'https://github.com/tacahiroy/ctrlp-funky.git'
Plugin 'https://github.com/terryma/vim-multiple-cursors.git'
Plugin 'https://github.com/mhinz/vim-signify.git'
Plugin 'https://github.com/Yggdroot/indentLine.git'
Plugin 'https://github.com/FooSoft/vim-argwrap.git'
Plugin 'https://github.com/Shougo/vimproc.vim.git'
Plugin 'https://github.com/leafgarland/typescript-vim.git'
Plugin 'https://github.com/juneedahamed/vc.vim'
Plugin 'https://github.com/vim-airline/vim-airline-themes.git'
Plugin 'https://github.com/Quramy/tsuquyomi.git'
Plugin 'git://github.com/tpope/vim-vinegar.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
