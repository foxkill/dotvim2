" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker :

"
" BASIC
"
" {
set visualbell                                          " disable annoying keyboard sound
" }

" 
" FONT SETTINGS
"
" {
"set guifont=Inconsolata-g\ for\ Powerline:h16
"set guifont=Source_Code_Pro:h16
set t_Co=256
set guifont=Fira_Code:h17
"set guioptions=-R
"set guioptions=-r
"set guioptions=-L
"set guioptions=-l
" }

"
" GUI SPECIFIC OPTIONS
"
" {
set linespace=10
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
