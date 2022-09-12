set mouse=a
set termguicolors
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
set conceallevel=2
set lazyredraw

"programming rules
set autoindent
set smarttab
set showmatch

"search rules
set hlsearch
set ignorecase
set smartcase
set swb=usetab,newtab "uselast?

"key sets
let mapleader = " "
nnoremap <space> <nop>

"speedrunning
nnoremap ; :
nnoremap n nzzzv
nnoremap N Nzzzv

nnoremap <leader>v :e $MYVIMRC<cr>

nnoremap <Leader><Leader> :Telescope<cr>
nnoremap <Leader>fc :Telescope commands<cr>
nnoremap <Leader>ff :Telescope find_files<cr>
nnoremap <Leader>fg :Telescope git_files<cr>
nnoremap <Leader>fm :Telescope marks<cr>
nnoremap <Leader>fb :Telescope buffers<cr>
nnoremap <Leader>fB :Telescope file_browser<cr>
nnoremap <Leader>fh :Telescope help_tags<cr>
nnoremap <Leader>fM :Telescope man_pages<cr>
nnoremap <Leader>/ :Telescope current_buffer_fuzzy_find<cr>
nnoremap <Leader>? :Telescope live_grep<cr>
nnoremap <Leader>ze :Telescope spell_suggest<cr>
nnoremap <Leader>w <C-w>

tnoremap <Esc> <C-\><C-n>
lua << EOF
require('plugins')

local mason = require('mason').setup()
local masonlsp = require("mason-lspconfig").setup()

local telescope = require('telescope')
local trouble = require('trouble').setup()
telescope.setup {
    defaults = {
        theme = "ivy",
        layout_config = { height=0.8, width=0.8 },
    },
    extensions = {
        file_browser = {
            theme = "dropdown",
            hijack_netrw = true
        },
    },
    pickers = {
        buffers = {
            show_all_buffers = true,
            sort_lastused = true,
            theme = "dropdown",
            previewer = false,
            mappings = {
                i = {
                  ["<c-d>"] = "delete_buffer",
                }
            }
        }
    }
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')

require("gruvbox").setup({
  contrast = "soft", -- can be "hard", "soft" or empty string
})

require('mini.comment').setup()

require('mini.cursorword').setup({
  -- Delay (in ms) between when cursor moved and when highlighting appeared
  delay = 100,
})

require('mini.indentscope').setup({
  draw = { delay = 0, animation = require('mini.indentscope').gen_animation('none') },
  options = { try_as_border = true, },
  symbol = '|',
})

require('mini.pairs').setup()
require('mini.sessions').setup({
  directory = '~/sessions', --<"session" subdir of user data directory from |stdpath()|>,
  file = "",
  pre = { read = close_bad_buffers, write = close_bad_buffers, },
})
require('mini.starter').setup()
require('mini.statusline').setup()
require('mini.surround').setup({
  mappings = {
    add = 'sa', -- Add surrounding in Normal and Visual modes
    delete = 'sd', -- Delete surrounding
    find = 'sf', -- Find surrounding (to the right)
    find_left = 'sF', -- Find surrounding (to the left)
    highlight = 'sh', -- Highlight surrounding
    replace = 'sr', -- Replace surrounding
    update_n_lines = 'sn', -- Update `n_lines`
  },
})

require('mini.tabline').setup()

-- Close buffers that don't restore from a session
local close_bad_buffers = function()
    vim.notify.dismiss({ silent = true, pending = true })
    local buffer_numbers = vapi.nvim_list_bufs()
    for _, buffer_number in pairs(buffer_numbers) do
        -- local buffer_name = vapi.nvim_buf_get_name(buffer_number)
        local buffer_type = vapi.nvim_buf_get_option(buffer_number, "buftype")
        local is_modifiable = vapi.nvim_buf_get_option(buffer_number, "modifiable")
        if buffer_type ~= "terminal" and (buffer_type == "nofile" or not is_modifiable) then
            vapi.nvim_buf_delete(buffer_number, { force = true })
        end
    end
end

vim.keymap.set("n", "<Leader>ss",
        function()
            if vim.v.this_session and vim.v.this_session ~= "" then
                sessions.write()
            else
                vim.ui.input({ prompt = "Session Name to Save: " }, function(input)
                    if input and input ~= "" then
                        sessions.write(vim.fn.trim(input))
                    else
                        vim.notify("Please Give a Name!")
                    end
                end)
            end
        end
)

local null_ls = require('null-ls')

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

-- TODO: async formatting
null_ls.setup({
    sources = {
        formatting.stylua,
        formatting.black,
        formatting.prettierd,
        formatting.google_java_format,
        diagnostics.eslint,
        diagnostics.flake8
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({bufnr = bufnr})
                end,
            })
        end
    end,
})

local cmp = require'cmp'

cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
    }, {
      { name = 'buffer' },
    })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['pylsp'].setup {
    capabilities = capabilities,
    on_attach = function()
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})  
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})  
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0})  
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})  
    vim.keymap.set("n", "<leader>lf", vim.lsp.buf.formatting, {buffer=0})  
    vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, {buffer=0})  
    vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, {buffer=0})
    vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", {buffer=0})  
    end
}

require('lspconfig')['jdtls'].setup {
    capabilities = capabilities,
    on_attach = function()
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})  
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})  
    --vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0})  
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})  
    vim.keymap.set("n", "<leader>lf", vim.lsp.buf.formatting, {buffer=0})  
    vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, {buffer=0})  
    vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, {buffer=0})
    vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", {buffer=0})  
    end
}


--[[
whichkey.register({
    ["<Leader>ss"] = {
        "(s)ession (s)ave <Session Name>",
    },
    ["<Leader>sS"] = {
        function()
            vim.ui.input({ prompt = "Session Name to Save: " }, function(input)
                if input and input ~= "" then
                    sessions.write(vim.fn.trim(input))
                else
                    vim.notify("Please Give a Name!")
                end
            end)
        end,
        "(s)ession (S)ave"
    },
    ["<Leader>sl"] = {
        function()
            sessions.select()
        end,
        "(s)ession (l)oad <Session Name>",
    },
    ["<Leader>sq"] = {
        function()
            vim.api.nvim_set_vvar("this_session", "")
            vim.notfiy("You have eft the session")
        end,
        "(s)ession (q)uit",
    },
}, { silent = false })
]]


require('meliora').setup()

EOF

colorscheme meliora
hi Conceal guifg=None
hi Normal guibg=NONE
hi NormalNC guibg=NONE
hi NormalFloat guibg=NONE
hi LineNr guibg=NONE
hi VertSplit guibg=NONE
hi TelescopeSelection guifg=#cccccc
hi TelescopeCaret guifg=#cccccc

augroup hide_symbols
  autocmd!
  autocmd VimEnter * call matchadd('Conceal', 'TODO', 10, 100, {'conceal': 'λ'})
  autocmd VimEnter * hi! link Conceal TODO
augroup end

augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

augroup source_vimrc
  autocmd!
  autocmd bufwritepost init.vim source $MYVIMRC
augroup end

augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END
