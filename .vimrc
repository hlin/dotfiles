"hypo's .vimrc

set nocompatible

" configuration for vundle
set term=xterm-256color
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles :
"
" original repos on github
Bundle 'Lokaltog/vim-powerline'
Bundle 'suan/vim-instant-markdown'
Bundle 'davidhalter/jedi-vim'
Bundle 'ervandew/supertab'
Bundle 'digitaltoad/vim-jade'

filetype plugin indent on     " required!

" vim-powerline settings
set laststatus=2
let g:Powerline_symbols = 'fancy'

set hlsearch
set incsearch
set nu
set ai
set ts=4
set sw=4
set sts=4
set et
set list
set listchars=tab:>-,trail:.
"set cursorline

autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

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

set helplang=cn

