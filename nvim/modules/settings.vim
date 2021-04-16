let mapleader = ","                                 "Set default leader key

syntax enable                                       "Enable syntax highlighting
set hidden                                          "Required to keep multiple buffer open
set nowrap                                          "Display long lines as just one line
set encoding=utf-8                                  "Default encoding 
set pumheight=10                                    "Makes popup menu smaller
set fileencoding=utf-8                              "The encoding written to file
set ruler                                           "Show cursor position all the time
set cmdheight=2                                     "More space for displaying messages 
set iskeyword+=-                                    "Treat dash separated words as a word object
set mouse=a                                         "Enable mouse
set splitbelow                                      "Hotizontal splits will be below
set splitright                                      "Vertical splits will go to the right
set t_Co=256                                        "Support 256 Colors
set conceallevel=0                                  "Show `` in markdown files
set tabstop=4                                       "Insert N spaces for a tab
set shiftwidth=4                                    "Number of spaces for an indentation
set smarttab                                        "Makes tabbing smarter (realizes you have 2 vs 4
set expandtab                                       "Converts tabs to spaces
set smartindent                                     "Makes indenting smart
set autoindent                                      "Auto indents
set laststatus=0                                    "Always display the last status line
set number                                          "Line numbers
set cursorline                                      "Enable highlighting of current line
set background=dark                                 "Opt for the dark theme
set showtabline=2                                   "Always show tabs
set nobackup                                        "Coc recommends for performance
set nowritebackup                                   "Coc recommends for performance
set completeopt=longest,menuone                     "Autocomplete options (show the longest suggest first)
set updatetime=300                                  "Faster completion
set timeoutlen=500                                  "Default is 1000ms
set formatoptions=cro                               "Stop newline cotinuation of comments
"set clipboard=unnamedplus                           "Copy/paste between vim and the machine
"set autochdir                                      "I keep this commented out to prevent fern from breaking

set list
set listchars=tab:»·,trail:·

au! BufWritePost ~/.config/nvim/init.vim source %   "Auto source when writin to init.vm
