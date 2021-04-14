"--------------------------------------------------------------
" Plugins
"--------------------------------------------------------------
so ~/.config/nvim/modules/plugins.vim

"--------------------------------------------------------------
" General Settings
"--------------------------------------------------------------
so ~/.config/nvim/modules/settings.vim

"--------------------------------------------------------------
" Airline (buffer display)
"--------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_statusline_ontop=1
let g:airline_theme='wombat'

"--------------------------------------------------------------
" Sessions
"--------------------------------------------------------------
set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir

" Persist cursor
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif

"--------------------------------------------------------------
" Theme
"--------------------------------------------------------------
so ~/.config/nvim/modules/theme.vim

"--------------------------------------------------------------
" Keybinds
"--------------------------------------------------------------
so ~/.config/nvim/modules/keybinds.vim

"--------------------------------------------------------------
" Navigation shortcuts
"--------------------------------------------------------------
" Mercury shortcuts "
nmap <Leader><Leader>mt :e ~/code/mercury72/tests<cr>
nmap <Leader><Leader>ms :e ~/code/mercury72/services<cr>
nmap <Leader><Leader>mc :e ~/code/mercury72/config<cr>
nmap <Leader><Leader>mf :e ~/code/mercury72/database/factories<cr>

"--------------------------------------------------------------
" fzf (fuzzy finder)
"--------------------------------------------------------------
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
let $FZF_DEFAULT_COMMAND = 'rg --files --ignore-case --hidden -g "!{.git,node_modules,vendor}/*"'
command! -bang -nargs=? -complete=dir Files
     \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9  }  }

"--------------------------------------------------------------
" Floatrem (floating window)
"--------------------------------------------------------------
let g:floaterm_keymap_toggle = '<F12>'

"--------------------------------------------------------------
" Fern (file tree)
"--------------------------------------------------------------
so ~/.config/nvim/modules/fern.vim

"--------------------------------------------------------------
" PHP documenter (auto docblock)
"--------------------------------------------------------------
autocmd FileType php inoremap <C-d> <ESC>:call PhpDoc()<CR>i
autocmd FileType php nnoremap <C-d> :call PhpDoc()<CR>
autocmd FileType php vnoremap <C-d> :call PhpDocRange()<CR>

"--------------------------------------------------------------
" NERD Commenter "
"--------------------------------------------------------------
so ~/.config/nvim/modules/nerd-commenter.vim

"--------------------------------------------------------------
" COC - Nvim (default config) "
"--------------------------------------------------------------
so ~/.config/nvim/modules/coc.vim
