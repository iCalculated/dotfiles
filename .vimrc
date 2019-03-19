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

"set statusline=
"set statusline+=%#PmenuSel#
""set statusline+=%{StatuslineGit()}
"set statusline+=%#LineNr#
"set statusline+=\ %f
"set statusline+=%m\
"set statusline+=%=
"set statusline+=%#CursorColumn#
"set statusline+=\ %y
"set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
"set statusline+=\[%{&fileformat}\]
"set statusline+=\ %p%%
"set statusline+=\ %l:%c
"set statusline+=\ 
"
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
tatus bar colors
au InsertEnter *hi statusline guifg=black guibg=#d7afff ctermfg=black ctermbg=magenta
au InsertLeave *hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan
hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan

" Status line
" default: set statusline=%f\ %h%w%m%r\ %=%(%l,%c%V\ %=\ %P%)

" Status Line Custom
let g:currentmode={
\ 'n'  : 'Normal',
\ 'no' :'Normal五务屋Operator Pending',
\ 'v'  : 'Visual',
\ 'V'  : 'V五务屋Line',
\ '^V' : 'V五务屋Block',
\ 's'  : 'Select',
\ 'S'  : 'S五务屋Line',
\ '^S' : 'S五务屋Block',
\ 'i'  : 'Insert',
\ 'R'  : 'Replace',
\ 'Rv' : 'V五务屋Replace',
\ 'c'  : 'Command',
\ 'cv' : 'Vim Ex',
\ 'ce' : 'Ex',
\ 'r'  : 'Prompt',
\ 'rm' : 'More',
\ 'r?' : 'Confirm',
\ '!'  : 'Shell',
\ 't'  : 'Terminal'
\}

set laststatus=2
set noshowmode
set statusline=
set statusline+=%0*\ %n\                                 " Buffer number
set statusline+=%1*\ %<%F%m%r%h%w\                       " File path, modified, readonly, helpfile, preview
set statusline+=%3*吾矽西                                     " Separator
set statusline+=%2*\ %Y\                                 " FileType
set statusline+=%3*吾矽西                                     " Separator
set statusline+=%2*\ %{''.(&fenc!=''?&fenc:&enc).''}     " Encoding
set statusline+=\ (%{&ff})                               " FileFormat (dos/unix..)
set statusline+=%=                                       " Right Side
set statusline+=%2*\ col:\ %02v\                         " Colomn number
set statusline+=%3*吾矽西                                     " Separator
set statusline+=%1*\ ln:\ %02l/%L\ (%3p%%)\              " Line number / total lines, percentage of document
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}\  " The current mode

hi User1 ctermfg=007 ctermbg=239 guibg=#4e4e4e guifg=#adadad
hi User2 ctermfg=007 ctermbg=236 guibg=#303030 guifg=#adadad
hi User3 ctermfg=236 ctermbg=236 guibg=#303030 guifg=#303030
hi User4 ctermfg=239 ctermbg=239 guibg=#4e4e4e guifg=#4e4e4e
