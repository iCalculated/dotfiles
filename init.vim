"gnvim magic
set runtimepath^=~/.vim runtimepath+=~/.vim/after
set rtp+=<SHARE_DIR>/merlin/vim

let &packpath = &runtimepath

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
let g:palenight_terminal_italics=1


"vimplug
call plug#begin('~/.vim/plugged')
  "Plug 'Shirk/vim-gas'
  "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'  }
  "Plug 'TaDaa/vimade'
  "Plug 'airblade/vim-gitgutter'
  "Plug 'airblade/vim-rooter'
  "Plug 'codota/tabnine-vim'
  "Plug 'daeyun/vim-matlab', { 'do': function('DoRemote') }
  "Plug 'dense-analysis/ale'
  "Plug 'easymotion/vim-easymotion'
  "Plug 'fszymanski/deoplete-emoji'
  "Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install()  }  }
  "Plug 'itchyny/lightline.vim'
  "Plug 'joshdick/onedark.vim'
  "Plug 'jpalardy/vim-slime', { 'branch':'main' }
  "Plug 'kevinhwang91/rnvimr'
  "Plug 'lervag/vimtex'
  "Plug 'luochen1990/rainbow'
  "Plug 'mg979/vim-visual-multi'
  "Plug 'mhinz/vim-signify'
  "Plug 'neoclide/coc.nvim', {'branch': 'release'}
  "Plug 'neovim/nvim-lsp'
  "Plug 'sheerun/vim-polyglot'
  "Plug 'sunaku/vim-shortcut'
  "Plug 'tpope/vim-endwise'
  "Plug 'tpope/vim-obsession'
  "Plug 'universal-ctags/ctags'
  "Plug 'vim-airline/vim-airline'
  "Plug 'vim-airline/vim-airline-themes'
  "Plug 'vim-pandoc/vim-pandoc'
  "Plug 'vim-pandoc/vim-pandoc-syntax'
  "Plug 'vim-syntastic/syntastic'
  "Plug 'vim-utils/vim-man'
  "Plug 'vlime/vlime'
  "Plug 'voldikss/vim-floaterm'
  "Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex'  }
  Plug 'camspiers/lens.vim'
  Plug 'drewtempelmeyer/palenight.vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/goyo.vim'
  Plug 'morhetz/gruvbox'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'p00f/nvim-ts-rainbow'
  Plug 'preservim/tagbar'
  Plug 'reedes/vim-pencil'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tommcdo/vim-lion'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
call plug#end()

lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  -- ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    -- disable = { "c", "rust" },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
}

require'nvim-treesitter.configs'.setup {
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}
EOF
"leader
let mapleader = ","

" AIRLINE
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#wordcount#filetypes = '\vasciidoc|help|mail|markdown|pandoc|org|rst|tex|text'
"let g:airline#extensions#tabline#enabled = 0
"let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
"let g:airline_theme='gruvbox'
"let g:airline#extensions#tmuxline#enabled = 0


" VIM-JSBEAUTIFY
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" GRUVBOX
let g:gruvbox_termcolors=256
let g:gruvbox_contrast_dark = 'medium'
colorscheme gruvbox
set background=dark

" TABULAR & VIM-MARKDOWN
let g:vim_markdown_folding_level = 1

" VIM-PANDOC
let g:pandoc#filetypes#handled = ['pandoc', 'markdown']
let g:pandoc#modules#disabled = ['folding']
let g:pandoc#folding#fold_fenced_codeblocks = 1
let g:pandoc#folding#fold_yaml = 1
let g:pandoc#biblio#bibs = ['/home/src/Knowledgebase/Zettelkasten/zettel.bib']
let g:pandoc#toc#close_after_navigating = 0
let g:pandoc#toc#position = 'bottom'
let g:pandoc#folding#fdc = 0

" RANGER
"let g:rnvimr_ex_enable = 1
"let g:rnvimr_enable_picker = 1
"let g:rnvimr_layout = {
"            \ 'relative': 'editor',
"            \ 'width': float2nr(round(0.7 * &columns)),
"            \ 'height': float2nr(round(0.7 * &lines)),
"            \ 'col': float2nr(round(0.15 * &columns)),
"            \ 'row': float2nr(round(0.15 * &lines)),
"            \ 'style': 'minimal'
"            \ }
"nnoremap <silent> <leader>t :RnvimrToggle<CR>
imap <c-c> <esc>
vmap <c-c> <esc>

" VIM-FLOATERM
let g:floaterm_open_command = 'tabe'

"" EASYMOTION
"" <Leader>f{char} to move to {char}
"map  <Leader>f <Plug>(easymotion-bd-f)
"nmap <Leader>f <Plug>(easymotion-overwin-f)
"
"" s{char}{char} to move to {char}{char}
"nmap s <Plug>(easymotion-overwin-f2)
"
"" Move to line
"map <Leader>L <Plug>(easymotion-bd-jk)
"nmap <Leader>L <Plug>(easymotion-overwin-line)
"
"" Move to word
"map  <Leader>w <Plug>(easymotion-bd-w)
"nmap <Leader>w <Plug>(easymotion-overwin-w)" "

"settings
set termguicolors
set updatetime=100  " swap file write time
set mouse=a
set shiftwidth=2    " tab = 2 spaces
set splitright      " split sanity
set splitbelow
set sessionoptions+=tabpages,globals
set expandtab       " expand tabs into spaces
set number          " line numbers
set noswapfile      " disable backups
set nobackup
set nowritebackup
set autowrite       " write when time-traveling
set autoread        " check if open file changed
set noruler         " cursor position
set nocursorline    " mark cursor line
set lazyredraw      " faster macros
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

function! ProseMode()
  call goyo#execute(0, [])
  set spell noci nosi noai nolist noshowmode noshowcmd
  set complete+=s
  set bg=light
  "colo PaperColor
endfunction
command! ProseMode call ProseMode()

" toggle transparency
let t:is_transparent = 0
"hi Normal guibg=NONE ctermbg=NONE
"hi TabLine guibg=NONE ctermbg=NONE cterm=NONE
"hi TabLineSel guibg=NONE ctermbg=NONE cterm=underline
"hi TabLineFill guibg=NONE ctermbg=NONE
"hi StatusLine guibg=NONE ctermbg=NONE cterm=NONE
function! Toggle_transparent()
    if t:is_transparent == 0
        hi Normal guibg=NONE ctermbg=NONE
        hi TabLine guibg=NONE ctermbg=NONE cterm=NONE
        hi TabLineSel guibg=NONE ctermbg=NONE cterm=underline
        hi TabLineFill guibg=NONE ctermbg=NONE
        hi StatusLine guibg=NONE ctermbg=NONE cterm=NONE
        let t:is_transparent = 1
    else
        set background=dark
        let t:is_transparent = 0
    endif
endfunction
command! Transparent call Toggle_transparent()

"todo
nnoremap <leader>a :g:\[[xX]\]:m$<CR>``:noh<CR>
"nnoremap <leader>d ma:g:\[[xX]\]:m$<CR>ggnk"=strftime('%F')<CR>PVG:w! >> archive.md<CR>VGd`a:noh<CR>
"nnoremap <leader>s V:w! >> archive.md<CR>dd
nnoremap <leader>n gg/- <CR>:noh<CR>O- [ ]
nnoremap <leader>x V:s:\[ \]:[X]<CR>:noh<CR>

"speedrunning
nnoremap <space> zz
nnoremap ; :
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <silent><C-t> :tabnew<CR>

"obscene .vimrc binds
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>z [sz=1<cr>A
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>v :tabe $MYVIMRC<cr>
autocmd bufwritepost .vimrc source $MYVIMRC
autocmd bufwritepost .init.vim source $MYVIMRC

au Filetype markdown let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`','$':'$','$$':'$$','```':'```','*':'*','**':'**'}

" Caroline
iabbrev crn Caroline

"md folds
au BufWrite,VimLeave *.md mkview
au BufRead           *.md silent loadview

"FZF gitfiles
nnoremap <silent><leader>q :GFiles<CR>
nnoremap <silent><C-p> :GFiles<CR>
nnoremap <silent><leader>l :Windows<CR>
nnoremap <silent><leader>r :Rg<CR>
nnoremap <silent><C-s> :Rg<CR>

  " Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

let g:matlab_auto_mappings = 1
let g:matlab_server_launcher = 'tmux'

let g:slime_target = "neovim"
let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}

" "coc
" set shortmess+=c
"
"
" if has("patch-8.1.1564")
"   " Recently vim can merge signcolumn and number column into one
"   set signcolumn=number
" else
"   set signcolumn=yes
" endif
"
" " Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
"
" " Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()
"
" " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" " position. Coc only does snippet and additional edit on confirm.
" " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
" if exists('*complete_info')
"   inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
"   inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif
"
" " Use `[g` and `]g` to navigate diagnostics
" " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)
"
" " GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
"
" " Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>
"
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction
"
" " Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')
"
" " Symbol renaming.
" nmap <leader>rn <Plug>(coc-rename)
"
" " Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)
"
" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder.
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end
"
" " Applying codeAction to the selected region.
" " Example: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)
"
" " Remap keys for applying codeAction to the current buffer.
" nmap <leader>ac  <Plug>(coc-codeaction)
" " Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)
"
" " Map function and class text objects
" " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
" xmap if <Plug>(coc-funcobj-i)
" omap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap af <Plug>(coc-funcobj-a)
" xmap ic <Plug>(coc-classobj-i)
" omap ic <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)
"
" " Use CTRL-S for selections ranges.
" " Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)
"
" " Add `:Format` command to format current buffer.
" command! -nargs=0 Format :call CocAction('format')
"
" " Add `:Fold` command to fold current buffer.
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"
" " Add `:OR` command for organize imports of the current buffer.
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
"
" " Add (Neo)Vim's native statusline support.
" " NOTE: Please see `:h coc-status` for integrations with external plugins that
" " provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"
" " Mappings for CoCList
" " Show all diagnostics.
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
"

