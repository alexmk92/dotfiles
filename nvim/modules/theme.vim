let $NVIM_TUI_ENABLE_TRUE_COLOR=1

syntax on
set termguicolors
colorscheme gruvbox
set background=dark
set cursorline
set hidden
set cmdheight=1

let g:gruvbox8_hard=1
let g:gruvbox_italics=0
let g:gruvbox_italicize_strings=0
let g:gruvbox_plugin_hi_groups=1

set list
set listchars=tab:»·,trail:·

" TSX synax highlighting.
" hi tsxTagName guifg=#E06C75
" hi tsxComponentName guifg=#E06C75
" hi tsxCloseComponentName guifg=#E06C75
"
" " orange
" hi tsxCloseString guifg=#F99575
" hi tsxCloseTag guifg=#F99575
" hi tsxCloseTagName guifg=#F99575
" hi tsxAttributeBraces guifg=#F99575
" hi tsxEqual guifg=#F99575
"
" " yellow
" hi tsxAttrib guifg=#F88D7F cterm=italic
"
