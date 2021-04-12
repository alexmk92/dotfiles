set nocompatible
filetype off

"------------------------------------------------
" Plugins START
call plug#begin()
  Plug 'airblade/vim-gitgutter'
  Plug 'cespare/vim-toml'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'itchyny/lightline.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'mengelbrecht/lightline-bufferline'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'tpope/vim-commentary'
  " Vinegar (nicer project browser)
  Plug 'tpope/vim-vinegar'
  Plug 'tpope/vim-surround'
  " Atom One Dark / Light theme.
  Plug 'rakr/vim-one'
  " File tree for Vim"
  Plug 'scrooloose/nerdtree'
  let NERDTreeHijackNetrw = 0
  " PHP Syntax highlighting "
  Plug 'StanAngeloff/php.vim'
  Plug 'arnaud-lb/vim-php-namespace'
  " CS Fixer " 
  Plug 'aeke/vim-php-cs-fixer'
  " Rsync " 
  Plug 'KenN7/vim-arsync'
  " Language and File types "
  Plug 'cakebaker/scss-syntax.vim'
  Plug 'chr4/nginx.vim'
  Plug 'chrisbra/csv.vim'
  Plug 'ekalinin/dockerfile.vim'
  Plug 'elixir-editors/vim-elixir'
  Plug 'Glench/Vim-Jinja2-Syntax'
  Plug 'godlygeek/tabular' | Plug 'tpope/vim-markdown'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
  Plug 'jvirtanen/vim-hcl'
  Plug 'lifepillar/pgsql.vim'
  Plug 'othree/html5.vim'
  Plug 'pangloss/vim-javascript'
  Plug 'PotatoesMaster/i3-vim-syntax'
  Plug 'stephpy/vim-yaml'
  Plug 'tmux-plugins/vim-tmux'
  Plug 'tpope/vim-git'
  Plug 'tpope/vim-liquid'
  Plug 'tpope/vim-rails'
  Plug 'vim-python/python-syntax'
  Plug 'vim-ruby/vim-ruby'
  Plug 'wgwoods/vim-systemd-syntax'
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
call plug#end()
" Plugins END
"------------------------------------------------

"------------------------------------------------
" Settings START
let mapleader = ","
filetype plugin on
set completeopt=menuone
set mouse=a
set nobackup
set noswapfile
set nowritebackup
set number
set signcolumn=yes
set title
set wrap
setlocal wrap

set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4
" Settings END
"------------------------------------------------

"------------------------------------------------
" persist START
set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir

" Persist cursor
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif
" persist END
"------------------------------------------------

"------------------------------------------------
" Theme START

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

syntax on
set termguicolors
colorscheme one
set background=dark
set cursorline
set hidden
set cmdheight=1
set laststatus=2
set linespace=16

let g:airline_theme='one'
let g:one_allow_italics=1

set list
set listchars=tab:»·,trail:·

" let buffers be clickable
let g:lightline#bufferline#clickable=1
let g:lightline#bufferline#shorten_path=1
let g:lightline#bufferline#min_buffer_count=1

let g:lightline = {
\  'colorscheme': 'jellybeans',
\  'active': {
\    'left': [ [], [], [ 'relativepath' ] ],
\    'right': [ [], [], [ 'lineinfo', 'percent' ] ]
\  },
\  'inactive': {
\    'left': [ [], [], [ 'relativepath' ] ],
\    'right': [ [], [], [ 'lineinfo', 'percent' ] ]
\  },
\  'subseparator': {
\    'left': '', 'right': ''
\  },
\  'tabline': {
\    'left': [ ['buffers'] ],
\    'right': [ [] ]
\  },
\  'tabline_separator': {
\    'left': "", 'right': ""
\  },
\  'tabline_subseparator': {
\    'left': "", 'right': ""
\  },
\  'component_expand': {
\    'buffers': 'lightline#bufferline#buffers'
\  },
\  'component_raw': {
\    'buffers': 1
\  },
\  'component_type': {
\    'buffers': 'tabsel'
\  }
\}

" Theme END
"------------------------------------------------

"------------------------------------------------
" Remaps START
" Align GitHub-flavored Markdown tables
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

" Toggle between buffers
nmap <Leader>bn :bn<CR>
nmap <Leader>bp :bp<CR>
nnoremap <C-p> :Rg<Cr>
nnoremap <C-e> :Files<Cr>
nmap <Leader>bl :Buffers<CR>
nmap <Leader>g :GFiles<CR>
nmap <Leader>e :Files<CR>
nmap <Leader>p :Rg<CR>
nmap <Leader>g? :GFiles?<CR>
nmap <Leader>h :History<CR>
"Make it easier to open/close NerdTree file list"
nmap <Leader>1 :NERDTreeToggle<cr>
" Remaps END
"------------------------------------------------

"------------------------------------------------
" Coc START
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ga  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>

" PHP reorder "
function! IPhpInsertUse()
  call PhpInsertUse()
  call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<cr>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<cr>
vmap <Leader>si ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>

"PSR Shortcuts"
autocmd BufWritePost ~/code/mercury/*.php silent! call PhpCsFixerFile()
nnoremap <silent><leader>pf :call PhpCsFixerFixFile()<cr>

"Save with ctrl+s"
nnoremap <silent><c-s> :<c-u>update<cr>
vnoremap <silent><c-s> <c-c>:update<cr>gv
inoremap <silent><c-s> <c-o>:update<cr>

" Mercury shortcuts "
nmap <Leader><Leader>mt :e ~/code/mercury/tests<cr>
nmap <Leader><Leader>ms :e ~/code/mercury/services<cr>
nmap <Leader><Leader>mc :e ~/code/mercury/config<cr>
nmap <Leader><Leader>mf :e ~/code/mercury/database/factories<cr>

" PHP Cs Fixer"
let g:php_cs_fixer_level = "psr2"
