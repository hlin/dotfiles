" hlin's .vimrc

" Automatic install vim-plug https://github.com/junegunn/vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.vim/bundle')
" My Bundles :
"
" original repos on github
Plug 'digitaltoad/vim-jade'
Plug 'myhere/vim-nodejs-complete'
Plug 'scrooloose/nerdcommenter'
Plug 'Valloric/YouCompleteMe'
Plug 'cespare/vim-toml'
Plug 'dracula/vim'

Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
" https://powerline.readthedocs.org/en/latest/installation/linux.html#fontconfig
set term=xterm-256color
set laststatus=2
set noshowmode

Plug 'scrooloose/nerdtree'
nmap <leader>t :NERDTreeToggle<CR>
""close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

Plug 'jtratner/vim-flavored-markdown'
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

Plug 'yko/mojo.vim'
let mojo_highlight_data = 1

" All of your Plugins must be added before the following line
call plug#end()            " required

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
set backspace=2

autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype jade setlocal ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype htmldjango setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype eruby setlocal ts=2 sts=2 sw=2
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2

colorscheme dracula
