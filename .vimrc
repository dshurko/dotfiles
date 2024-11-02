" General configuration options
set nocompatible                    " Use Vim settings, rather than Vi settings
set backspace=indent,eol,start      " Allow backspacing over indention, line breaks and insertion start
set hidden                          " Enable the hidden buffer feature, allowing for easy switching between multiple open files without saving them

" User Interface options
set laststatus=2                    " Always show status line
set mouse=a                         " Enable mouse support
set noerrorbells visualbell t_vb=   " Disable error bells and set the visual bell to do nothing
set number                          " Show line numbers
set relativenumber                  " Show relative line numbers
set shortmess+=I                    " Don't give the intro message when starting Vim
set wildmenu                        " Show command line completions

" Indentation options
set autoindent                      " Automatically indent new lines
set expandtab                       " Use the appropriate number of spaces to insert a tab
set shiftwidth=4                    " Set the number of spaces to use for each step of (auto)indent
set softtabstop=4                   " Set the number of spaces that a tab counts for while performing editing operations, like inserting a tab or using backspace
set tabstop=4                       " Set the number of spaces that a tab in the file counts for

" Search options
set incsearch                       " Enable incremental search, which starts searching as soon as you type in the search command
set ignorecase                      " Ignore case in search patterns
set smartcase                       " Override the 'ignorecase' option if the search pattern contains upper case characters

" Text rendering options
syntax on                           " Enable syntax highlighting

" Miscellaneous options
nmap Q <Nop>                        " Unbind the 'Q' key to do nothing in normal mode ('Q' in normal mode enters Ex mode)

" netrw options
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_liststyle = 3
let g:netrw_winsize = 20
nmap \ :Lexplore<CR>
