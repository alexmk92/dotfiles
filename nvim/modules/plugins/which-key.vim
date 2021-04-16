" Map leader to which key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

let g:which_key_map = {}
let g:which_key_sep = '→'

" If this is turned off, it will appear at the bottom
let g:which_key_use_floating_win = 0

" Change colors
highlight default link WhichKey          Operator
highlight default link WhichKeySeparator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd FileType which_key set laststatus=0 noshowmode noruler
 \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Single mappings
let g:which_key_map['/'] = [ '<Plug>NERDCommenterToggle'  , 'comment'  ]
let g:which_key_map['e'] = [ ':CocCommand explorer'       , 'explorer'  ]
let g:which_key_map['f'] = [ ':Files'                     , 'search files']
let g:which_key_map['h'] = [ '<C-W>s'                     , 'split below' ]
let g:which_key_map['r'] = [ ':Ranger'                    , 'ranger'  ]
let g:which_key_map['S'] = [ ':Startify'                  , 'start screen'  ]
let g:which_key_map['T'] = [ ':Rg'                        , 'search text'  ]
let g:which_key_map['v'] = [ '<C-W>v'                     , 'split right' ]
let g:which_key_map['z'] = [ 'Goyo'                       , 'zen'  ]

" Git commands that we can't auto complete go here (prompt is in the signify
" keybinds)
let g:which_key_map.g = {
    \ 'name': '+git',
    \ 'b' : [':Git blame',              'blame'],
    \ 'd' : [':Gdiffsplit',             'diff'],
    \ 'lv': [':GV!',                    'log this file'],
    \ 'll': [':GV',                     'log all'],
    \ 'l1': [':Git log -1',             'log latest'],
    \ 'lr': [':GV?',                    'log current file revisions'],
    \ 'pl': [':Git pull',               'pull'],
    \ 'pu': [':Git push',               'push'],
    \ 'ss': [':Git status',             'status'],
    \ 'st': [':Git stash',              'stash'],
    \ 'sp': [':Git stash pop',          'stash pop'],
    \ 'rh': [':Git reset --hard HEAD',  'reset head'],
    \ }

" s is for search,
let g:which_key_map.i = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'     , 'history'],
      \ ';' : [':Commands'     , 'commands'],
      \ 'a' : [':Ag'           , 'text Ag'],
      \ 'b' : [':BLines'       , 'current buffer'],
      \ 'B' : [':Buffers'      , 'open buffers'],
      \ 'c' : [':Commits'      , 'commits'],
      \ 'C' : [':BCommits'     , 'buffer commits'],
      \ 'f' : [':Files'        , 'files'],
      \ 'g' : [':GFiles'       , 'git files'],
      \ 'G' : [':GFiles?'      , 'modified git files'],
      \ 'h' : [':History'      , 'file history'],
      \ 'H' : [':History:'     , 'command history'],
      \ 'l' : [':Lines'        , 'lines'] ,
      \ 'm' : [':Marks'        , 'marks'] ,
      \ 'M' : [':Maps'         , 'normal maps'] ,
      \ 'p' : [':Helptags'     , 'help tags'] ,
      \ 'P' : [':Tags'         , 'project tags'],
      \ 's' : [':Snippets'     , 'snippets'],
      \ 'S' : [':Colors'       , 'color schemes'],
      \ 't' : [':Rg'           , 'text Rg'],
      \ 'T' : [':BTags'        , 'buffer tags'],
      \ 'w' : [':Windows'      , 'search windows'],
      \ 'y' : [':Filetypes'    , 'file types'],
      \ 'z' : [':FZF'          , 'FZF'],
      \ }

" t for floatrem
let g:which_key_map.t = {
      \ 'name' : '+terminal' ,
      \ ';' : [':FloatermNew --wintype=popup --height=6'        , 'terminal'],
      \ 'f' : [':FloatermNew fzf'                               , 'fzf'],
      \ 'g' : [':FloatermNew lazygit'                           , 'git'],
      \ 'd' : [':FloatermNew lazydocker'                        , 'docker'],
      \ 'n' : [':FloatermNew node'                              , 'node'],
      \ 'N' : [':FloatermNew nnn'                               , 'nnn'],
      \ 'p' : [':FloatermNew python'                            , 'python'],
      \ 'r' : [':FloatermNew ranger'                            , 'ranger'],
      \ 't' : [':FloatermToggle'                                , 'toggle'],
      \ 'y' : [':FloatermNew ytop'                              , 'ytop'],
      \ 's' : [':FloatermNew ncdu'                              , 'ncdu'],
      \ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")

