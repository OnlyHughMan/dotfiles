" Enable line numbers
set number

" Enable syntax highlighting
syntax on


" Set default tab width to 4 spaces
set tabstop=2
set shiftwidth=2
set expandtab


" Enable auto-indentation
set autoindent
set smartindent

" Enable search highlighting and incremental search
set hlsearch
set incsearch

" Ignore case in search patterns
set ignorecase
set smartcase


" Show matching brackets
set showmatch

" Enable line wrapping
set wrap

" Display line and column number in the status line
set ruler

" Set a reasonable timeout for mapped sequences
set timeoutlen=500

" Set file encoding to UTF-8
set encoding=utf-8

" Enable persistent undo so you can undo after closing Vim
set undofile
" allows vim to use system clipboard
set clipboard=unnamedplus,unnamed


" Set up backups and swap files (optional)
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/swaps

" Set a leader key (for custom mappings)
let mapleader=","

" Custom mappings (examples)
" Map leader+w to save
nnoremap <leader>w :w<CR>

" Map leader+q to quit
nnoremap <leader>q :q<CR>
" Map leader+x to save and quit
nnoremap <leader>x :wq<CR>
set laststatus=2
set statusline=%f\ %h%m%r\ %=%-14.(%l,%c%V%)\ %P

if has('persistent_undo')         "check if your vim version supports
  set undodir=~/.vim/undo     "directory where the undo files will be stored
  set undofile                    "turn on the feature
endif
"this is for ideavim tests
map <leader>r :action Run<CR>
map <leader>d :action Debug<CR>
map <leader>s :action Stop<CR>
set wildmode=longest,list,full
set wildmenu
cnoremap <C-j> <C-n>
