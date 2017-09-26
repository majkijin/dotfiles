call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'maralla/completor.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
Plug 'mileszs/ack.vim'
Plug 'derekwyatt/vim-scala'
Plug 'easymotion/vim-easymotion'
Plug 'yssl/QFEnter'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'jimmay5469/vim-spacemacs'
call plug#end()

" Completor config
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
"let g:completor_auto_trigger = 0
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>"
let g:completor_python_binary = "/usr/bin/python3"

" YCM config
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_extra_conf_globlist = ['~/.ycm_extra_conf.py']

" vim-easymotion config
let g:EasyMotion_do_shade = 0

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
"nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Cscope config for GNU global (gtags)
"if has("cscope")
"        set csprg=/usr/local/bin/gtags-cscope
"        set csto=0
"        set cst
"        set nocsverb
"        " add any database in current directory
"        if filereadable("GTAGS")
"            cs add GTAGS
"        " else add database pointed to by environment
"        elseif $CSCOPE_DB != ""
"            cs add $CSCOPE_DB
"        endif
"        set csverb
"endif

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
set textwidth=79
set breakindent
set number
set spell

" Read project specific .vimrc files
set exrc
set secure

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

" Ack customizations
:nnoremap <Leader>* :Ack! -kw <cword> <CR>
:nnoremap <Leader>/ :Ack! -k <cword>
"if executable('ag')
"  let g:ackprg = 'ag --vimgrep'
"endif

" Spacemacs keybindings
let g:spacemacs#leader = '<SPACE>'
