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
nmap <leader>gb :Git blame<cr>|                  "open blame window <C-x> to close
nmap <leader>gsh :Git stash<cr>|                 "push to stash
nmap <leader>gsp :Git stash pop<cr>|             "pop the last commit from stash 
nmap <leader>gst :Git status<cr>|                "show git status
nmap <leader>gcm :Git commit -m<space>|          "prepare a commit command
nmap <leader>gco :Git checkout<space>|           "prepare a checkout command 
nmap <leader>grh :Git reset --hard HEAD<cr>|     "reset to head
nmap <leader>gp :Git pull<cr>|                   "pull the current branch
nmap <leader>gm :Git merge<space>|               "prepare a merge command
nnoremap <leader>gd :Gdiffsplit<cr>|             "open up a side by side diff
nnoremap <leader>gvf :GV!<cr>|                   "only list commits effecting this file
nnoremap <leader>gvr :GV?<cr>|                   "only list commits with revisions of curr file
nnoremap <leader>gvl :GV<cr>|                    "list all recent commits in order


"If you like colors instead
"highlight SignifySignAdd                  ctermbg=green guibg=#00ff00
"highlight SignifySignDelete ctermfg=black ctermbg=red    guifg=#ffffff guibg=#ff0000
"highlight SignifySignChange ctermfg=black ctermbg=yellow guifg=#000000 guibg=#ffff00"
