let g:sneak#label = 1
let g:sneak#use_ic_scs = 1                            " Case insenstivie search
let g:sneak#s_next = 1                                " Move to next instance of search

map gS <Plug>Sneak_,|                                 " Remap 
map gs <Plug>Sneak_;|                                 " Remap

let g:sneak#prompt = '🔎'                             " Custom search icon :)

highlight Sneak guifg=black guibg=#00C7DF ctermfg=black ctermbg=cyan
highlight SneakScope guifg=red guibg=yellow ctermfg=red ctermbg=yellow
