" nvim magic
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath


"vimplug
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'zxqfl/tabnine-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

"settings
set shiftwidth=2    " tab = 2 spaces
set splitright      " split sanity
set splitbelow      
set expandtab       " expand tabs into spaces
set number          " line numbers
set noswapfile      " disable backups
set nobackup
set nowritebackup
set autowrite       " write when time-traveling
set autoread        " check if open file changed
set ruler           " cursor position
set cursorline      " mark cursor line
set lazyredraw      " faster macros
set updatetime=300  " swap file write time
set hidden          " hidden buffers

"programming rules
set autoindent
set smarttab
set showmatch
set completeopt=longest,menuone

"search rules
set hlsearch
set ignorecase
set smartcase

"colorscheme
colorscheme onedark
" toggle transparency
let t:is_transparent = 0
function! Toggle_transparent()
    if t:is_transparent == 0
        hi Normal guibg=NONE ctermbg=NONE
        let t:is_transparent = 1
    else
        set background=dark
        let t:is_tranparent = 0
    endif
endfunction
nnoremap <C-t> : call Toggle_transparent()<CR>

"leader
let mapleader = ","

"todo
nnoremap <leader>a :g:\[[xX]\]:m$<CR>``:noh<CR>
nnoremap <leader>d ma:g:\[[xX]\]:m$<CR>ggnk"=strftime('%F')<CR>PVG:w! >> archive.md<CR>VGd`a:noh<CR>
nnoremap <leader>s V:w! >> archive.md<CR>dd
nnoremap <leader>n gg/- <CR>:noh<CR>O- [ ] 
nnoremap <leader>x V:s:\[ \]:[X]<CR>:noh<CR>
nnoremap <leader>l k"=strftime('%F')<CR>P

"speedrunning
nnoremap <leader>w :w!<cr>
nnoremap <leader>r V:s:[a-z0-9]*[,.()!?' ]:redacted :g<CR>:noh<CR>
nnoremap <space> zz 
nnoremap ; :
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <C-o> :NERDTreeToggle<CR>
nnoremap <silent><leader>t :tabnew<CR>

"obscene .vimrc binds
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>z [sz=1<cr>A
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>v :tabe $MYVIMRC<cr> 
autocmd bufwritepost .vimrc source $MYVIMRC

" Caroline
iabbrev crn Caroline

"md folds
au BufWrite,VimLeave *.md mkview
au BufRead           *.md silent loadview

"FZF gitfiles
nnoremap <silent><C-p> :GFiles<CR>
