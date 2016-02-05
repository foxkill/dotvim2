" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker :

" my cool vimrc file
"
" Copyright (c) Stefan Martin 2015
"
set nocompatible

so ~/.vim/plugins.vim

" Identify platform {{{
silent function! OSX()
    return has('macunix')
endfunction
silent function! LINUX()
    return has('unix') && !has('macunix') && !has('win32unix')
endfunction
silent function! WINDOWS()
    return  (has('win16') || has('win32') || has('win64'))
endfunction
" }}}

syntax on

if has("autocmd")
   filetype plugin indent on
endif

"
" CLIPBOARD
"
" {
if has("clipboard")
    if has("unnamedplus")  " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else         " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif
" }

"
" BASIC SETTINGS
" 
" {
set bufhidden=wipe
set modeline
set modelines=5
set shortmess+=filmnrxoOtT                      " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore                         " Allow for cursor beyond last character
set history=1000                                " Store a ton of history (default is 20)
set hidden                                      " Allow buffer switching without saving
set iskeyword-=.                                " '.' is an end of word designator
set iskeyword-=#                                " '#' is an end of word designator
set iskeyword-=-                                " '-' is an end of word designator
"set spell                                      " Spell checking on
" }

"
" UI
"
" {


highlight clear SignColumn      " SignColumn should match background
highlight clear LineNr          " Current line number row will have same background color in relative mode

set cursorline
set tabpagemax=15
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set number                      " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set foldenable                  " Auto fold code
set listchars=tab:>\ ,trail:.,eol:¬,extends:#,nbsp:.

"set list
"set showmode
"highlight clear CursorLineNr    " Remove highlight color from current line number
"highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

if has("statusline")
    set laststatus=2
    "set statusline=%<%f\                     " Filename
    "set statusline+=%w%h%m%r                 " Options
    "set statusline+=\ [%{&ff}/%Y]            " Filetype
    "set statusline+=\ [%{getcwd()}]          " Current dir
    "set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif
" }

"
" LOCAL ADJUSTMENTS
"
" {
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
" }

"
" OMNICOMPLETE
"
" {
set omnifunc=syntaxcomplete#Complete
"au FileType php set omnifunc=phpcomplete#CompletePHP
set complete=.,w,b,u,t
" set completeopt=longest,menuone,preview
set completeopt=longest,menuone
" }

"
" PERFORMANCE STUFF
"
" {
set ttyfast                             " faster redrawing
set lazyredraw
set synmaxcol=512
set scrolljump=5
" }

"
" BASIC SETTINGS
"
" {
set nowrap                      " Do not wrap long lines
set autoindent                  " Indent at the same level of the previous line
set copyindent                  " copy the previous indendation on autoindent
set smartindent
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
set encoding=iso-8859-15        " iso
set encoding=utf8               " utf8
set hidden                      " enable multiple modified buffers
set history=1000                " extended history
"set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
"set matchpairs+=<:>            " Match, to be used with %
" }

"
" FILES AND DIRECTORIES
"
" {
set noswapfile
"set binary
"set noeol

set tags=./tags;/
" set cscopetag

set wildignore+=*/tmp/*,*.swp
set wildignore+=*.so,*.zip
set wildignore+=*/vendor/*,*/node_modules/*
set wildignore+=*/\.svn/*,*/\.git/*
" }

"
" KEY MAPPINGS
"
" {

" edit .vimrc quickly
nnoremap <leader>ed :tabedit $MYVIMRC<CR>

" fast saves
nnoremap <leader>w :w!<CR>

"easy mapping to normal mode
imap jj <ESC>
imap kk <ESC>
" }

"
" SEARCH AND REPLACE
"
" {

" highlight search cterm=underline
" remove search results
command! H let @/=""

" hlsearch stuff
autocmd cursorhold * set nohlsearch
autocmd cursormoved * set hlsearch
" }

"
" AUTO COMMANDS
" 
" {
" reload vimrc
augroup reload_vimrc
    autocmd!
    autocmd bufwritepost .vimrc source $HOME/.vimrc
    autocmd bufwritepost .vimrc.local source $HOME/.vimrc.local
augroup END


" Remove trailing whitespaces and ^M chars
augroup trim_whitespace
    autocmd!
    autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl,sql autocmd BufWritePre <buffer> call StripTrailingWhitespace()
augroup END

" Strip whitespace
function! StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " do the business:
    %s/\s\+$//e
    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
 
" remove trailing spaces when writing php files
" autocmd! bufwritepre *.php :%s/\s\+$//e
" }
