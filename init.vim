set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

"settings
set shiftwidth=4
set expandtab 
set noerrorbells
set belloff=all
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


"execute "set t_8f=\e[38;2;%lu;%lu;%lum"
"execute "set t_8b=\e[48;2;%lu;%lu;%lum"
"set t_ut=""
syntax on
set bg=dark
colorscheme PaperColor

"key sets
let mapleader = ","

"todo
nnoremap <leader>a :g:\[[xX]\]:m$<CR>``:noh<CR>
nnoremap <leader>d ma:g:\[[xX]\]:m$<CR>ggnk"=strftime('%F')<CR>PVG:w! >> archive.md<CR>VGd`a:noh<CR>
nnoremap <leader>s V:w! >> archive.md<CR>dd
nnoremap <leader>n gg/- <CR>:noh<CR>O- [ ] 
nnoremap <leader>t V:s:\[ \]:[X]<CR>:noh<CR>
nnoremap <leader>l k"=strftime('%F')<CR>P

"speedrunning
nnoremap <leader>w :w!<cr>
nnoremap <leader>r V:s:[a-z0-9]*[,.()!?' ]:redacted :g<CR>:noh<CR>
nnoremap <space> zz 
nnoremap ; :
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <C-o> :NERDTreeToggle<CR>

"obscene .vimrc binds
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>z [sz=1<cr>A
nnoremap <leader>u  /####<cr>Nj<C-v>GU
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>v :tabe $MYVIMRC<cr> 
autocmd bufwritepost .vimrc source $MYVIMRC
nnoremap <leader>a :g:\[[xX]\]:m$<CR>``:noh<CR>
nnoremap <leader>d ma:g:\[[xX]\]:m$<CR>ggnk"=strftime('%F')<CR>PVG:w! >> archive.md<CR>VGd`a:noh<CR>
nnoremap <leader>s V:w! >> archive.md<CR>dd
nnoremap <leader>n gg/- <CR>:noh<CR>O- [ ] 
nnoremap <leader>t V:s:\[ \]:[X]<CR>:noh<CR>
nnoremap <leader>l k"=strftime('%F')<CR>P

iabbrev crn Caroline

"md folds
au BufWrite,VimLeave *.md mkview
au BufRead           *.md silent loadview
