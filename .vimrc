set shiftwidth=4
set expandtab 
set noerrorbells
set showmode
set showcmd
set splitright
set splitbelow
set nu 
set noswapfile
set nobackup
set nowritebackup
set autowrite
set autoread
set ruler 
set ttyfast
set nocursorcolumn
set nocursorline
set wrap
set conceallevel=0
set lazyredraw

"programming rules
set autoindent
set smarttab
set showmatch

"experimental
set completeopt=longest,menuone

"search rules
set hlsearch
set ignorecase
set smartcase

syntax on
colo C64

"key sets
let mapleader = ","

"speedrunning
nnoremap <leader>w :w!<cr>
nnoremap <space> zz 
nnoremap ; :
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <C-o> :NERDTreeToggle<CR>
"obscene .vimrc binds
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>v :tabe $MYVIMRC<cr> 
autocmd bufwritepost .vimrc source $MYVIMRC


execute pathogen#infect()
call pathogen#helptags()

if executable('ocamlmerlin') && has('python')
    let s:ocamlmerlin = substitute(system('opam config var share'), '\n$', '', '''') . "/merlin"
    execute "set rtp+=".s:ocamlmerlin."/vim"
    execute "set rtp+=".s:ocamlmerlin."/vimbufsync"
endif
autocmd FileType ocaml execute "set rtp+=" . substitute(system('opam config var share'), '\n$', '', '''') . "/ocp-indent/vim/indent/ocaml.vim"
