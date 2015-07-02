call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
Plug 'mileszs/ack.vim'
call plug#end()

" YCM config
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" Always show the status line
set laststatus=2

set wildmode=longest,list,full
set wildmenu

" Set to auto read when a file is changed from the outside
set autoread

" Ignore case in searches
set ignorecase
set smartcase

" Highlight search results
set hlsearch

" Don't redraw while executing macros (good for performance)
set lazyredraw

" Show matching brackets
set showmatch

syntax enable
set background=light
colorscheme solarized
"colorscheme desert

set grepprg=grep\ -nIs\ --exclude-dir=.svn\ --exclude-dir=.git\ --exclude=tags

if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
  " ...
endif

set shiftwidth=4
set softtabstop=4
set expandtab
set cursorline
set incsearch
set cc=80

" Highlight trailing spaces
:highlight ExtraWhitespace term=reverse ctermfg=15 ctermbg=1 gui=reverse guifg=#dc322f
:match ExtraWhitespace /\s\+$/

" Emacs style cmdline
:cnoremap <C-A> <Home>
:cnoremap <C-F> <Right>
:cnoremap <C-B> <Left>
:cnoremap <Esc>b <S-Left>
:cnoremap <Esc>f <S-Right>

set omnifunc=syntaxcomplete#Complete
