" General:
set encoding=utf-8                 " The encoding displayed
set fileencoding=utf-8             " The encoding written to file
syntax on                          " Enable syntax highlight
set ttyfast                        " Faster redrawing
set lazyredraw                     " Only redraw when necessary
set cursorline                     " Find the current line quickly.
set relativenumber                 " Show relative line numbers
set number                         " Show line numbers
set hlsearch                       " Highlight when searching
set title                          " Show title at top of the terminal
filetype plugin indent on          " Enable loading the plugin files for specific file types
set clipboard=unnamed              " Access system clipboard

" Custom Functions:
" source ~/.config/nvim/my-configs/functions.vim

" Plugins:
source ~/.config/nvim/my-configs/vim-plug.vim

" Custom Mappings:
source ~/.config/nvim/keys.vim

" Plugins Configurations:
source ~/.config/nvim/my-configs/emmet-vim.vim
source ~/.config/nvim/my-configs/git.vim
source ~/.config/nvim/my-configs/fzf.vim
source ~/.config/nvim/my-configs/nerdcommenter.vim
source ~/.config/nvim/my-configs/ultisnips.vim
source ~/.config/nvim/my-configs/coc.vim

" Visual:

" 256 colors
set t_Co=256

" set colorscheme
colorscheme nord

" scroll screen after 8 lines
set scrolloff=8

" show the status line all the time
set laststatus=2

" follow terminal background
hi Normal ctermbg=none

" Folding
set foldmethod=syntax       " syntax highlighting items specify folds
set foldcolumn=1            " defines 1 col at window left, to indicate folding
set foldlevelstart=99       " start file with all folds opened

" Indentation:
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set smartindent


" CoC Configuration:

"  Syntax:
" When enter a JavaScript or TypeScript buffer, and disable when leave
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" Jenkins
autocmd BufNewFile,BufRead Jenkinsfile setf groovy

"  Enable Highlight JSDocs
let g:javascript_plugin_jsdoc = 1
