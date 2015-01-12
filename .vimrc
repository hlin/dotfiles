" hlin's .vimrc

" install vundle first:
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

" configuration for vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required!
Plugin 'gmarik/Vundle.vim'

" My Bundles :
"
" original repos on github
Plugin 'digitaltoad/vim-jade'
Plugin 'myhere/vim-nodejs-complete'
Plugin 'scrooloose/nerdcommenter'

Plugin 'Lokaltog/vim-powerline'
" download font Inconsolata-dz-Powerline.otf to ~/fonts
" from https://gist.github.com/qrush/1595572
set term=xterm-256color
set laststatus=2
let g:Powerline_symbols = 'fancy'

Plugin 'scrooloose/nerdtree'
nmap <leader>t :NERDTreeToggle<CR>
""close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

Plugin 'Shougo/neocomplcache.vim'
" use neocpmolcache
let g:neocomplcache_enable_at_startup = 1
" disable autopopup by default
let g:neocomplcache_disable_auto_complete = 1
" use smart case
let g:neocomplcache_enable_smart_case = 1
" cancel completion by <Backspace> or <C-h>
inoremap <expr><BS> pumvisible() ? neocomplcache#cancel_popup() : "\<C-h>"
inoremap <expr><C-h> pumvisible() ? neocomplcache#cancel_popup() : "\<C-h>"

Plugin 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = '<C-X><C-U>'

Plugin 'jtratner/vim-flavored-markdown'
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

Plugin 'yko/mojo.vim'
let mojo_highlight_data = 1

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

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
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype htmldjango setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype eruby setlocal ts=2 sts=2 sw=2

syntax on
colorscheme default

set helplang=cn
