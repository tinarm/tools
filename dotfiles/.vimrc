execute pathogen#infect()

filetype plugin indent on

" Basic {
    set mouse=a
    set nocompatible
    set background=dark
    set title
    set nohlsearch
    set cursorline

    "hi CursorLine cterm=bold ctermbg=235
    hi CursorLine cterm=bold ctermbg=DarkGrey

    " Set to auto read when a file is changed from the outside
    set autoread

    " Height of the command bar
    set cmdheight=2

    " Ignore case when searching
    set ignorecase

" }

" Coding {
    syntax on
    set encoding=utf8
    set softtabstop=4
    set autoindent

    " Use spaces instead of tabs
    set expandtab

    " 1 tab == 4 spaces
    set tabstop=4
    set shiftwidth=4

    set nowrap
    set ruler
    set showmatch
    set number
    set numberwidth=5

    " Show matching brackets when text indicator is over them
    set showmatch

    " Makefiles
    autocmd FileType make,automake set noexpandtab

    " Associate .gradle with groovy syntax
    au BufRead,BufNewFile *.gradle setfiletype groovy
" }

" Newline without entering insert mode
nmap <CR> o<Esc>

" NERD tree
let NERDTreeShowHidden=1
map <C-b> :NERDTreeToggle<CR>

