"settings
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
colorscheme neonwave 

"key sets
let mapleader = ","

"speedrunning
nnoremap <leader>w :w!<cr>
nnoremap <space> zz 
nnoremap n nzzzv
nnoremap N Nzzzv
inoremap jk <ESC>l
inoremap jj <ESC>l
inoremap kk <ESC>l
inoremap kj <ESC>l

"obscene .vimrc binds
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>v :tabe $MYVIMRC<cr> 
autocmd bufwritepost .vimrc source $MYVIMRC

"status line
set laststatus=2 
"set statusline='%<%f%{&mod?"[+]":""}%r%{&fenc !~ "^$\\|utf-8" || &bomb ? "[".&fenc.(&bomb?"-bom":"")."]" : ""}%=%15.(%l,%c%V %P%)'
"set statusline=%<%f%m%r%{Fenc()}%=%15.(%l,%c%V\ %P%)

set statusline=
set statusline+=%#PmenuSel#
"set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 

function! Fenc()
	if &fenc !~ "^$\|utf=8" || &bomb
		return "[" . &fenc . (&bomb ? "-bom" : "" ) . "]"
	else
		return ""
	endif
endfunction
"set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
"set statusline="I am Sasha, thou shall bow down to me. (Cause y'all are peasants.)"
"rtbinds
"iabbrev pt [Periodic Trends]
"iabbrev ab [Acids and Based]	
"iabbrev f [Formulas]
"iabbrev c [Compounds]
"iabbrev h [History]
"iabbrev r [Reactions]
"iabbrev p [Precipitates and Aqueous Reactions]
"iabbrev i [Ionic Equations]

" FRC binds 
"iabbrev dp Destination Deep Space
"iabbrev p panel
"iabbrev c cargo ball
"iabbrev s cargo ship
"iabbrev r rocket 
"iabbrev h habitat
"iabbrev hp habitat platform
"iabbrev i inch 
"iabbrev d depot 
"iabbrev ls loading station

