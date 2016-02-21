" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker :

"
" BASIC
"
" {
set visualbell                                          " disable annoying keyboard sound
" }

"
" KEY-MAPPINGS
"
" {{{
nnoremap ß <C-]>
inoremap ß <C-]>
nnoremap ä ]m
nnoremap Ä ]M
nnoremap ö [m
nnoremap Ö [M
" }}}
" if isdirectory(expand("~/.vim/bundle/auto-pairs"))
" let g:AutoPairsShortcutFastWrap = ''
" endif

"
" FONT SETTINGS
"
" {
let g:enable_bold_font = 1
"set guifont=Inconsolata-g\ for\ Powerline:h16
"set guifont=Source_Code_Pro:h16
set t_Co=256
"set guifont=Fira_Code:h17
set guioptions=-M
"set guioptions=-R
"set guioptions=-r
"set guioptions=-L
"set guioptions=-l
" }

"
" GUI SPECIFIC OPTIONS
"
" {
set linespace=15

set guioptions-=M
set guioptions-=m

if has("gui_macvim")
    macmenu &File.Print key=<nop>
    macmenu &File.New\ Tab key=<nop>
endif
" }

"
" ABBREVATIONS
"
" {
abbrev fbm cd ~/MyVolumes/fb-martin-admin<CR>
" }

"
" HOST SPECIFIC
"
" {
let hostfile = $HOME . '/.vim/gvimrc.' . substitute(hostname(), "\\..*", "", "")
if filereadable(hostfile)
    execute 'source ' . hostfile
endif
" }

"
" HIGHLIGHTING
"
" {
hi vertsplit guifg=bg guibg=bg
hi signcolumn guifg=fg guibg=bg

" highlight DiffAdd           guifg=fg guibg=bg
" highlight DiffDelete        guifg=fg guibg=bg
" highlight DiffChange        guifg=fg guibg=bg
"
" highlight SignifySignAdd    guifg=fg guibg=bg
" highlight SignifySignDelete guifg=fg guibg=bg
" highlight SignifySignChange guifg=fg guibg=bg
" }
