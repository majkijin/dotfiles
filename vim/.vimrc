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
