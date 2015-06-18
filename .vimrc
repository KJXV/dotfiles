set nocompatible

" Keymap for Dvorak -------------------
nnoremap h h
nnoremap t gj
nnoremap n gk
nnoremap s l

vnoremap h h
vnoremap t gj
vnoremap n gk
vnoremap s l

" Plugins -----------------------------
execute pathogen#infect()
  " NERDTree toggles with CTRL-N
map <C-n> :NERDTreeToggle<CR>
  " NERDTree opens if no file is specifide
"autocmd vimenter * if !argc() | NERDTree | endif

" Theme -------------------------------
set background=dark
colorscheme solarized

" Globals -----------------------------
if v:progname =~? "evim"
  finish
endif
if has("vms")
  set nobackup
else
  set backup
endif
set autoindent
set autoread
set backspace=indent,eol,start
set backupdir=~/.vim_backup
set complete-=i
set copyindent
set display+=lastline
set encoding=utf-8
set go=c
set history=1000
set ignorecase
set incsearch
set laststatus=2
set mouse=
set noswapfile
set nowrap
set number
set ruler
set shiftround
set showcmd
set smartcase
set smarttab
set softtab=2 tabstop=2 shiftwidth=2
set title
set ttimeout
set ttimeoutlen=50
set undolevels=1000
set wildmenu
set wildmode=longest,list

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
      \ | wincmd p | diffthis
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux'
  set t_Co=16
endif

" Keybindings -------------------------

" Don't use Ex mode, use Q for formatting
map Q gq

" C-L clears highlighting of :set hlsearch
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>
