syntax on
set nu
set tabstop=4 softtabstop=4
set exrc
set guicursor=
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors background=dark
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set colorcolumn=80

set cmdheight=2
set updatetime=50
set shortmess+=cc
set completeopt-=preview
set mouse=a
set splitbelow splitright
set fillchars+=vert:\
let NERDTreeShowHidden=1
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" File browser
let g:netrw_banner=0
let g:netrw_liststyle=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_winsize=25
let g:netrw_keepdir=0
let g:netrw_localcopydircmd='cp -r'
