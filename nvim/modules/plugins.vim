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
  Plug 'alexmk92/vim-snippets'
  Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
  Plug 'justinmk/vim-sneak'
  Plug 'unblevable/quick-scope'
  Plug 'liuchengxu/vim-which-key'
  " Better syntax highlighting, yay! 
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  " Git plugins
  Plug 'mhinz/vim-signify'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'junegunn/gv.vim'
  " Vinegar (nicer project browser)
  Plug 'tpope/vim-vinegar'
  Plug 'tpope/vim-surround'
  Plug 'preservim/nerdcommenter'
  Plug 'morhetz/gruvbox'
  Plug 'joshdick/onedark.vim'
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'junegunn/rainbow_parentheses.vim'
  " File tree for Vim"
  Plug 'lambdalisue/fern.vim'
  Plug 'lambdalisue/fern-git-status.vim'
  Plug 'lambdalisue/fern-renderer-nerdfont.vim'
  Plug 'voldikss/vim-floaterm'
  " Debugger plugins "
  Plug 'puremourning/vimspector'
  Plug 'szw/vim-maximizer'
  " Language and File types "
  Plug 'sheerun/vim-polyglot'
  Plug 'ekalinin/dockerfile.vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'lambdalisue/nerdfont.vim'
call plug#end()

filetype on
syntax enable
