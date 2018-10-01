source ~/.vim/minpac.vim

set relativenumber                          " Show line numbers relative to each other
set number                                  " Show the current lines number w/ relative numbers around it
set noswapfile                              " Don't create *.swp files
set wildmode=list:longest                   " Tab complete to longest common string, like bash
set showcmd                                 " Display an incomplete command in the lower right corner
set iskeyword+=\-                           " Auto complete words with dashes

autocmd FileType gitcommit set spell                 " Turn on spell check in Git commits.
autocmd Filetype css,scss,sass setlocal iskeyword+=- " Treat dashed words as whole words in stylesheets

" Searching
set hlsearch      " Highlight searches
set ignorecase    " Ignore case
set smartcase     " Override 'ignorecase' option if the search contains upper case characters.

" Indentation
set shiftwidth=2  " Number of spaces to use in each autoindent step
set tabstop=2     " Two tab spaces
set softtabstop=2 " Number of spaces to skip or insert when <BS>ing or <Tab>ing
set expandtab     " Spaces instead of tabs for better cross-editor compatibility

" Undo
if !isdirectory(expand("~/.vim/.undo/"))
  silent !mkdir -p ~/.vim/.undo/
endif
set undodir=$HOME/.vim/.undo
set undofile
set undolevels=1000
set undoreload=10000

" Colorscheme
syntax on

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
