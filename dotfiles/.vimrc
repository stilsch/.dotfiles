set background=dark
syntax enable
set ignorecase          " Do case insensitive matching
set smartcase           " Do smart case matching
set incsearch           " Incremental search
set hidden              " Hide buffers when they are abandoned
set hlsearch                  " highlight the search
set showmatch                 " show matching bracket
set showcmd
set foldmethod=marker
set wildmenu
set wildmode=list:longest,full
set mouse-=a
" Put these lines at the very end of your vimrc file.

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL