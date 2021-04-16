let $NVIM_TUI_ENABLE_TRUE_COLOR=1

colorscheme gruvbox
set background=dark
set cursorline
set hidden
set cmdheight=1

" Visual marker so we can see the 80 column and 120 column 
" buffer width
let &colorcolumn="80,".join(range(120,999),",")
highlight ColorColumn ctermbg=235 guibg=#292929

" I don't like italics!
let g:gruvbox_italics=0
let g:gruvbox_italicize_strings=0
let g:gruvbox_plugin_hi_groups=1
