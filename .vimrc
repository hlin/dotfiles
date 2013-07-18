" hlin's .vimrc

" install vundle first:
" $ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

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
Bundle 'ervandew/supertab'
Bundle 'digitaltoad/vim-jade'
Bundle 'myhere/vim-nodejs-complete'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'Shougo/neocomplcache.vim'
Bundle 'jtratner/vim-flavored-markdown'

filetype plugin indent on     " required!

" vim-powerline settings
" download font Inconsolata-dz-Powerline.otf to ~/fonts
" from https://gist.github.com/qrush/1595572
set laststatus=2
let g:Powerline_symbols = 'fancy'

" nerdtree settings
nmap <leader>t :NERDTreeToggle<CR>
""close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" neocomplcache.vim
let g:neocomplcache_enable_at_startup = 1
"" disable autocomplete by default
let g:neocomplcache_disable_auto_complete = 1
"" enable autocomplete by press <Tab> key
let g:SuperTabDefaultCompletionType = '<C-X><C-U>'

" vim-flavored-markdown settings
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" common settings
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
autocmd Filetype jade setlocal ts=2 sts=2 sw=2

syntax on
colorscheme default

set helplang=cn

