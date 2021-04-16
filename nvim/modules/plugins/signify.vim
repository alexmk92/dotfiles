" Change these if you want
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'

" I find the numbers disctracting
let g:signify_sign_show_count = 1                "show numbers if multiple lines are deleted
let g:signify_sign_show_text = 1                 "show signs in gutter

"Jump though hunks
nmap <leader>gj <plug>(signify-next-hunk)|       "jump to next change in file
nmap <leader>gk <plug>(signify-prev-hunk)|       "jump to previous git change in file
nmap <leader>gJ 9999<leader>gJ|                  "jump to first git change in file
nmap <leader>gK 9999<leader>gk|                  "jump to last git change in file

" Git shortcuts
nmap <leader>gcm :Git commit -m<space>|          "prepare a commit command
nmap <leader>gco :Git checkout<space>|           "prepare a checkout command 
nmap <leader>gm :Git merge<space>|               "prepare a merge command

"If you like colors instead
"highlight SignifySignAdd                  ctermbg=green guibg=#00ff00
"highlight SignifySignDelete ctermfg=black ctermbg=red    guifg=#ffffff guibg=#ff0000
"highlight SignifySignChange ctermfg=black ctermbg=yellow guifg=#000000 guibg=#ffff00"
