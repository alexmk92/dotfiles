set nocompatible
filetype off

call plug#begin()
  Plug 'junegunn/vim-easy-align'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'kshenoy/vim-signature'
  Plug 'sumpygump/php-documentor-vim'
  Plug 'KenN7/vim-arsync'
  " Vinegar (nicer project browser)
  Plug 'tpope/vim-vinegar'
  Plug 'tpope/vim-surround'
  Plug 'preservim/nerdcommenter'
  Plug 'morhetz/gruvbox'
  " File tree for Vim"
  Plug 'lambdalisue/fern.vim'
  Plug 'lambdalisue/fern-git-status.vim'
  Plug 'lambdalisue/fern-renderer-nerdfont.vim'
  Plug 'voldikss/vim-floaterm'
  " Language and File types "
  Plug 'sheerun/vim-polyglot'
  Plug 'ekalinin/dockerfile.vim'
call plug#end()

filetype on
syntax on
