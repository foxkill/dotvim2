" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker :

" my cool vimrc file
"
" Copyright (c) Stefan Martin 2015
"

"
" VUNDLE
"
" {{{
so ~/.vim/plugins.vim
" }}}

filetype plugin on


"
" IDENTIFY PLATFORM
"
" {{{
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

"
" KEY MAPPINGS
"
" {
let mapleader = ","

" abbr
abbrev namp nmap
abbrev au Stefan Martin
abbrev doucument document
iabbrev doucument document

" goto tag
nnoremap ß <C-]>
inoremap ß <C-]>

nnoremap <C-]>  :CtrlPtjump<CR>
vnoremap <C-]>  :CtrlPtjumpVisual<CR>

" goto tag in split window
nnoremap <leader>gt :CtrlPtjump<CR>

"nnoremap ö ]c
"nnoremap ä [c

if &term =~ '^screen'
    " tmux will send xterm-style keys when xterm-keys is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

" this requires iterm2 to use xterm key profiles
nnoremap <silent> <C-Up>   :move-2<CR>==
nnoremap <silent> <C-Down> :move+<CR>==
xnoremap <silent> <C-Up>   :move-2<CR>gv=gv
xnoremap <silent> <C-Down> :move'>+<CR>gv=gv

"Duplicate lines above and below
nnoremap <C-S-Down> Yp
inoremap <C-S-Down> <esc>Yp
xnoremap <C-S-Down> y`>pgv
nnoremap <C-S-Up> YP
inoremap <C-S-Up> <esc>YP
xnoremap <C-S-Up> y`<Pgv

" command line mapping like in shell
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

let g:train_musle_memory = 0

if g:train_musle_memory == 1
    nnoremap <left> :bprev<CR>
    nnoremap <right> :bnext<CR>
    nnoremap <up> :tabnext<CR>
    nnoremap <down> :tabprev <CR>
endif

" Change Working Directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" Some helpers to edit mode
" http://vimcasts.org/e/14
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" move in insert mode
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>^
inoremap <C-f> <Right>
inoremap <C-b> <Left>
" <S-Right>   next word right
" <S-Left>    next word left
" <C-w>   delete word to the left of cursor
" <C-o>D  delete everything to the right of cursor
" <C-u>   delete everything to the left of cursor
" <C-h>   backspace/delete
" <C-j>   insert newline (easier than reaching for the return key)
" <C-t>   indent current line
" <C-d>   un-indent current line

"
" format block that was just pasted
nnoremap <leader>p p=`]

" select block that was just pasted
nnoremap <leader>V V`]

" edit .vimrc quickly
nnoremap <leader>ed :tabedit $MYVIMRC<CR>

" fast saves
nnoremap <leader>w :w!<CR>

" easy mapping to normal mode
imap jj <ESC>
imap kk <ESC>

" quick switch foldmodes
nnoremap <leader>fi :set fdm=indent<CR>za<CR>
nnoremap <leader>fs :set fdm=syntax<CR>za<CR>
nnoremap <leader>fm :set fdm=manual<CR>za<CR>

" window management
nnoremap <C-H> <C-W><C-H>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-L> <C-W><C-L>
" }

"
"
" LOCAL ADJUSTMENTS
"
" {{{
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
" }}}

"
" AUTO COMMANDS
"
" {{{
if has("autocmd")
    augroup php
        autocmd!
        autocmd FileType php setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
        autocmd FileType php let g:php_folding=2
        autocmd FileType php setlocal foldenable
        autocmd FileType php setlocal foldmethod=syntax
        "autocmd FileType php setlocal foldlevelstart=3 foldnestmax=2
        autocmd FileType php setlocal includeexpr=substitute(v:fname,'\\\','/','g')
        autocmd FileType php setlocal suffixesadd+=.php
        " autocmd FileType php setlocal path=.,**
        " Fix javascript word boundaries (erratically activated for PHP files)
        autocmd FileType php setlocal iskeyword+=$
        " autocmd FileType php setlocal cindent|set cinkeys-=0#
        autocmd FileType php setlocal comments=s1:/*,mb:*,ex:*/,://,:#
        " autocmd FileType php setlocal formatoptions+=cro
        " Let the surround plugin use `-` for <?php ?>
        autocmd FileType php let b:surround_45 = "<?php \r ?>"
        " Let the surround plugin use `=` for <?php ?>
        autocmd FileType php let b:surround_61 = "<?= \r ?>"

        autocmd FileType php set omnifunc=phpcomplete#CompletePHP
        autocmd FileType php set completefunc=syntaxcomplete#Complete
        autocmd BufReadPost *.php normal zj | zv
        " PHP
        " let php_sql_query = 1
        " let php_htmlInStrings = 1
        " let php_baselib = 1
        " let php_asp_tags = 0
        " let php_parent_error_close = 1
        " let php_parent_error_open = 1
        " let php_no_shorttags = 0
        " let php_sync_method = 0
    augroup END

    " augroup netrw
    "     autocmd!
    "     autocmd FileType netrw setl bufhidden=delete
    " augroup END
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

endif
" }}}

"
" SYNTAX
"
" {{{
syntax on
filetype plugin indent on
" }}}

"
" CLIPBOARD
"
" {
if has("clipboard")
    if has("unnamedplus")
        " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else
        " On Mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif
" }

"
" BASIC SETTINGS
"
" {
set autowriteall                                  " write buffer on switch
set autoread                                      " autoread
set modeline
set modelines=5
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore                         " Allow for cursor beyond last character
set history=1000                                " Store a ton of history (default is 20)
set hidden                                      " Allow buffer switching without saving
set iskeyword-=.                                " '.' is an end of word designator
set iskeyword-=#                                " '#' is an end of word designator
set iskeyword-=-                                " '-' is an end of word designator
set backupdir=~/,~/tmp
"set spell                                      " Spell checking on
"set bufhidden=wipe
"set shortmess+=filmnrxoOtT                      " Abbrev. of messages (avoids 'hit enter')
" }

"
" UI
"
" {
highlight clear SignColumn      " SignColumn should match background
highlight clear LineNr          " Current line number row will have same background color in relative mode
"highlight clear CursorLineNr    " Remove highlight color from current line number
"highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

set cursorline
set tabpagemax=15
set backspace=indent,eol,start                       " Backspace for dummies
set number                                           " Line numbers on
set fillchars=vert:\ ,stl:\ ,stlnc:\                 " make the splitters between windows be blank
set showmatch                                        " Show matching brackets/parenthesis
set matchtime=5                                      " tenths of a second to blink matching brackets
set incsearch                                        " Find as you type search
set hlsearch                                         " Highlight search terms
set winminheight=0                                   " Windows can be 0 line high
set ignorecase                                       " Case insensitive search
set smartcase                                        " Case sensitive when uc present
set wildmenu                                         " Show list instead of just completing
set wildmode=list:longest,full                       " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]                        " Backspace and cursor keys wrap too
set scrolljump=5                                     " Lines to scroll when cursor leaves screen
set scrolloff=3                                      " Minimum lines to keep above and below cursor
set foldenable                                       " Auto fold code
set listchars=tab:>\ ,trail:.,eol:¬,extends:#,precedes:<,nbsp:. " show charaters hinting special cases
                                                     " set list
"set showmode

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
set encoding=utf8               " internal for utf8
set termencoding=utf8           " terminal encoding
set fileencoding=iso-8859-15    " set default for new files
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


" HELP SECTION
"
" {
"
" zi - unfold all
" za - unfold folded parts
" zMzv - close all folds and reopen the one the cursor is in
" :retab => tabs to spaces
"
" SEARCH & REPLACE ======================================================
" /\v   - search using 'very magic mode', to avoid having to escape common characters
" /\%V  - search in selection
"
" VIM-MULTIPLE-CURSORS ==================================================
" C-n  - in normal mode selects variable (press multiple times to continue  selection)
" C-p  - in Visual mode will remove the current virtual cursor and go back
"        to the previous virtual cursor location. This is useful if you are trigger
"        happy with C-n and accidentally went too far.
" C-x  - in Visual mode will remove the current virtual cursor and skip to the next
"        virtual cursor location. This is useful if you don't want the current selection
"        to be a candidate to operate on later.
" CtrlP useful shortcuts ================================================
" <D-p> :CtrlP<CR>
" <D-r> :CtrlPFunky<CR>
" <D-e> :CtrlPMRU<CR>
" <D-b> :CtrlPBufTag<CR>
"
" Useful commands  ======================================================
":vert sb N open an open buffer in vertical split
":sb N open an open buffer in splitbelow

" Useful Keys ============================================================
" <C-o><C-o> opens last edited file
"
" Keys in insert mode ====================================================
" <S-Right>   next word right
" <S-Left>    next word left
" <C-w>   delete word to the left of cursor
" <C-o>D  delete everything to the right of cursor
" <C-u>   delete everything to the left of cursor
" <C-h>   backspace/delete
" <C-j>   insert newline (easier than reaching for the return key)
" <C-t>   indent current line
" <C-d>   un-indent current line
" }
