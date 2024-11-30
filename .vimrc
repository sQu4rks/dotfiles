" General setup
syntax on
set backspace=indent,eol,start
set tabstop=2
set splitbelow
set splitright
set colorcolumn=120

" Enable splitting navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Vundle Setup
set nocompatible
filetype off

" set runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'danilo-augusto/vim-afterglow'
Plugin 'preservim/nerdtree'
Plugin 'ycm-core/YouCompleteMe'
call vundle#end()
filetype plugin indent on

" Colorscheme
colorscheme afterglow

" YouCompleteMe Config
imap <silent> <C-l> <Plug>(YCMToggleSignatureHelp)

