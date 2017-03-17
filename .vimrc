execute pathogen#infect()

" Basic {
    set nocompatible
    set background=dark
    set title
    set hlsearch
" }

" Coding {
    syntax on
    set encoding=utf8
    set softtabstop=4
    set tabstop=4
    set shiftwidth=4
    set autoindent
    set expandtab
    set nowrap
    set ruler
    set showmatch
    set number
    set numberwidth=5

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

