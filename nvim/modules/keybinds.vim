" PHP Cs Fixer"
let g:php_cs_fixer_level = "psr2"

" Clear search highlights.
map <Leader><Space> :let @/=''<CR>

" Close buffer "
map <S-x> :bd!<cr>

" Edit vim shortcuts "
map <Leader>so ~/.config/nvim/init.vim<cr>
map <Leader>ev :e ~/.config/nvim/init.vim<cr>

" Highlighting for large files "
autocmd BufEnter *.{js,jsx,ts,tsx,php} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx,php} :syntax sync clear

" Autoreload vimrc on save "
autocmd BufWritePost ~/.config/nvim/init.vim source ~/.config/nvim/init.vim | echom "Reloaded config" | redraw
autocmd BufWritePost ~/.config/nvim/modules/* source ~/.config/nvim/init.vim | echom "Reloaded config" | redraw

" Align GitHub-flavored Markdown tables
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

" Toggle between buffers
nmap <Leader>bn :bn<CR>
nmap <Leader>bp :bp<CR>
nnoremap <C-p> :Rg<Cr>
nnoremap <C-e> :Files<Cr>
nnoremap <C-b> :Buffers<CR>
nmap <Leader>bl :Buffers<CR>
nmap <Leader>g :GFiles<CR>
nmap <Leader>g? :GFiles?<CR>
nmap <Leader>h :History<CR>
" Remaps END

" PHP reorder "
function! IPhpInsertUse()
  call PhpInsertUse()
  call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<cr>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<cr>
vmap <Leader>si ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>

"Save with ctrl+s"
nnoremap <silent><c-s> :<c-u>update<cr>
vnoremap <silent><c-s> <c-c>:update<cr>gv
inoremap <silent><c-s> <c-o>:update<cr><esc>

" Set filetype for typescript files for syntax highlighting. 
augroup SyntaxSettings
    autocmd!
    autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
augroup END
