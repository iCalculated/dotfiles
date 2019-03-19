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

""status bar colors
"au InsertEnter *hi statusline guifg=black guibg=#d7afff ctermfg=black ctermbg=magenta
"au InsertLeave *hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan
"hi statusline guifg=black guibg=#8fbfdc ctermfg=gray ctermbg=DarkCyan
"
"" Status line
"" default: set statusline=%f\ %h%w%m%r\ %=%(%l,%c%V\ %=\ %P%)
"
"" Status Line Custom
"let g:currentmode={
"\ 'n'  : 'Normal',
"\ 'no' : 'Normal Mode Operator Pending',
"\ 'v'  : 'Visual',
"\ 'V'  : 'Visual Line',
"\ '^V' : 'Visual Block',
"\ 's'  : 'Select',
"\ 'S'  : 'Select Line',
"\ '^S' : 'Select Block',
"\ 'i'  : 'Insert',
"\ 'R'  : 'Replace',
"\ 'Rv' : 'Visual Replace',
"\ 'c'  : 'Command',
"\ 'cv' : 'Vim Ex',
"\ 'ce' : 'Ex',
"\ 'r'  : 'Prompt',
"\ 'rm' : 'More',
"\ 'r?' : 'Confirm',
"\ '!'  : 'Shell',
"\ 't'  : 'Terminal'
"\}
"
"set laststatus=2
"set noshowmode
"set statusline=
"set statusline+=%0*\ %n\                                 " Buffer number
"set statusline+=%1*\ %<%F%m%r%h%w\                       " File path, modified, readonly, helpfile, preview
"set statusline+=%3*/                                     " Separator
"set statusline+=%2*\ %Y\                                 " FileType
"set statusline+=%3*/                                     " Separator
"set statusline+=%2*\ %{''.(&fenc!=''?&fenc:&enc).''}     " Encoding
"set statusline+=\ (%{&ff})                               " FileFormat (dos/unix..)
"set statusline+=%=                                       " Right Side
"set statusline+=%2*\ col:\ %02v\                         " Colomn number
"set statusline+=%3*/                                     " Separator
"set statusline+=%1*\ ln:\ %02l/%L\ (%3p%%)\              " Line number / total lines, percentage of document
"set statusline+=%0*\ %{toupper(g:currentmode[mode()])}\  " The current mode
"
"hi User1 ctermfg=007 ctermbg=239 guibg=#4e4e4e guifg=#adadad
"hi User2 ctermfg=007 ctermbg=236 guibg=#303030 guifg=#adadad
"hi User3 ctermfg=236 ctermbg=236 guibg=#303030 guifg=#303030
"hi User4 ctermfg=239 ctermbg=239 guibg=#4e4e4e guifg=#4e4e4e

" Status line
" default: set statusline=%f\ %h%w%m%r\ %=%(%l,%c%V\ %=\ %P%)

" Warning for trailing spaces
function! StatuslineTrailingSpaceWarning()
    if !exists("b:statusline_trailing_space_warning")
        if search('\s\+$', 'nw') != 0
            let b:statusline_trailing_space_warning = 'ð '
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction

" Status Line Custom Mode
let g:mode_hl = {
    \ 'n'        : ['Normal', 'Normal'],     'no'     : ['Normal', 'NúOperator Pending'],
    \ 'v'        : ['Visual', 'Visual'],     'V'      : ['Visual', 'VúLine'],
    \ "\<c-v>"   : ['Visual', 'VúBlock'],    's'      : ['Visual', 'Select'],
    \ 'S'        : ['Visual', 'SúLine'],     "\<c-s>" : ['Visual', 'SúBlock'],
    \ 'i'        : ['Insert', 'Insert'],     'ic'     : ['Insert', 'IúCompl'],
    \ 'ix'       : ['Insert', 'IúX Compl'],  'R'      : ['Replace', 'Replace'],
    \ 'Rc'       : ['Replace', 'RúCompl'],   'Rv'     : ['Replace', 'RúVirtual'],
    \ 'Rx'       : ['Replace', 'RúX Compl'], 'c'      : ['Command','Command'],
    \ 'cv'       : ['Term','Vim Ex'],        'ce'     : ['Term','Ex'],
    \ 'r'        : ['Prompt','Prompt'],      'rm'     : ['Prompt','More'],
    \ 'r?'       : ['Prompt','Confirm'],     '!'      : ['Term','Shell'],
    \ 't'        : ['Term','Terminal']}

let s:ins = {'i':'i', 'r':'R','v':'Rv'}

" Colors are [gui , cterm]
let s:pallet = {
  \ 'Normal'  : ['#94D0FF', '39'],  'Insert'  : ['#FF6AD5', '207'],
  \ 'Visual'  : ['#d8ad4c', '3'],  'Replace' : ['#d75f5f', '1'],
  \ 'Command' : ['#8fbfdc', '14'], 'Prompt'  : ['#d7afff', '5'],
  \ 'Term'    : ['#adadad', '7']}
 
let s:modecache = ''
function! ChangeColor()
    let s:hlmode = g:mode_hl[mode()][0]
    if s:modecache == s:hlmode
        return ''
    endif
    let s:modecache = s:hlmode
    let [s:color1, s:color2] = s:pallet[s:hlmode]
    let s:mode_color = printf(' guifg=#1c1c1c guibg=%s ctermfg=234 ctermbg=%s', s:color1, s:color2)
    let s:accent_color = printf(' guifg=%s guibg=#1c1c1c ctermfg=%s ctermbg=234', s:color1, s:color2)
    execute 'highlight StlMode'.s:mode_color
    execute 'highlight StlText'.s:accent_color
    return ''
endfunction

augroup Statusline
    autocmd!
    autocmd CursorHold,InsertLeave,BufWritePost * unlet! b:statusline_trailing_space_warning
    autocmd VimEnter * call ChangeColor()
augroup end

hi statusline gui=bold ctermfg=234 ctermbg=7 guibg=#adadad guifg=#1c1c1c
hi StlText guifg=#adadad guibg=#1c1c1c ctermfg=7 ctermbg=234
hi statuslinenc gui=bold guifg=#adadad guibg=#1c1c1c ctermfg=007 ctermbg=234

hi User1 ctermfg=007 ctermbg=237 guibg=#4a4a4a guifg=#adadad
hi User2 ctermfg=001 ctermbg=234 guibg=#1c1c1c guifg=#d75f5f
hi User3 ctermfg=011 ctermbg=234 guibg=#1c1c1c guifg=#fad07a

set laststatus=2
set noshowmode
set statusline=
set statusline+=%*%{ChangeColor()}
set statusline+=%#StlMode#\ %{g:mode_hl[mode()][1]}\       " The current mode
set statusline+=%1*\ %Y\                                    " FileType
set statusline+=%#StlText#\ %<%F\                           " File path
set statusline+=%2*%M\                                      " Modified
set statusline+=%2*%{&readonly?'\ RO\ ':''}                 " Readonly
set statusline+=%3*%{StatuslineTrailingSpaceWarning()}      " Space warning
set statusline+=%3*%{&paste?'\ Paste\ ':''}                 " Paste mode
set statusline+=%2*%{&spell?'\ Spell\ ':''}                 " Spell check
set statusline+=%=                                          " Right Side
set statusline+=%3*%w\                                      " Preview
set statusline+=%#StlText#\ %{''.(&fenc!=''?&fenc:&enc).''} " Encoding
set statusline+=\ [%{&ff}]\                                 " FileFormat
set statusline+=%1*\ col:\ %-02v\                           " Column number
set statusline+=%#StlMode#\ ð\ %-03l/%L\ %3p%%\             " See next line
" Line number / total lines, percentage of document
	

