" Enable line numbers
set number

" Enable syntax highlighting
syntax on

set nocompatible
" allow unsaved background buffers and remember marks/undo for them
set hidden
" remember more commands and search history
set history=10000
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set laststatus=2

" highlight current line
set cmdheight=1

" Completion options.
"   menu: use a popup menu
"   preview: show more info in menu
:set completeopt=menu,preview
:set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

" switch to open buffer if exists
set switchbuf=useopen
" always have 3 lines above and below cursor where possible
set scrolloff=3

" If a file is changed outside of vim, automatically reload it without asking
set autoread

set signcolumn=no

" True color support
if has('termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  let &t_Cs = ""
  let &t_Ce = ""
  set termguicolors
endif

" Colorscheme (must come after termguicolors)
set background=dark
if !has('nvim')
  colorscheme catppuccin_mocha
endif

" Diffs are shown side-by-side not above/below
set diffopt=vertical


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

" Move around splits with <c-hjkl> (only outside tmux - vim-tmux-navigator handles it inside)
if !exists('$TMUX')
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l
endif
vnoremap <leader>ib :!align<cr>

" Custom mappings (examples)
" Map leader+w to save
nnoremap <leader>w :w<CR>

" Map leader+q to quit
nnoremap <leader>q :q<CR>
" Map leader+x to save and quit
nnoremap <leader>x :wq<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
