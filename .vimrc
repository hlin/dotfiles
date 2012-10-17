" .vimrc

set nocompatible

filetype plugin on
filetype indent on

set hlsearch
set incsearch
set nu
set ai
set ts=4
set sw=4
set et
set list listchars=tab:>-,trail:.
" set cursorline
" set cc=80

syntax on
colorscheme default

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

let Tlist_Ctags_Cmd='/usr/bin/ctags'
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

let g:winManagerWindowLayout='FileExplorer|TagList|BufExplorer'
nmap wm :WMToggle<CR>

" pydiction
let g:pydiction_location ='/home/hlin/.vimfiles/pydiction-1.2/complete-dict'

set helplang=cn

