-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Leader keys (must be set before lazy)
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Options
vim.opt.mouse = "a"
vim.opt.termguicolors = true
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.errorbells = false
vim.opt.showmode = true
vim.opt.showcmd = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.number = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.autowrite = true
vim.opt.autoread = true
vim.opt.ruler = true
vim.opt.ttyfast = true
vim.opt.cursorcolumn = false
vim.opt.cursorline = false
vim.opt.wrap = true
vim.opt.conceallevel = 2
vim.opt.lazyredraw = true
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.showmatch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.switchbuf = { "usetab", "newtab" }
vim.opt.signcolumn = "yes"

-- Folding (native treesitter)
vim.opt.foldcolumn = "0"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- Provider paths (speeds up startup)
vim.g.node_host_prog = "/Users/shy/.nvm/versions/node/v16.18.1/bin/node"
vim.g.python3_host_prog = "/Users/shy/.pyenv/versions/3.12.2/bin/python3"

-- Basic keymaps
vim.keymap.set("n", "<leader>v", "<cmd>e ~/.config/nvim/init.lua<cr>", { desc = "[v]im config" })
vim.keymap.set("n", "<leader>V", function()
	vim.cmd("source $MYVIMRC")
	vim.notify("Config reloaded (restart nvim for full effect)")
end, { desc = "[V]im config reload" })
vim.keymap.set("n", ";", ":", { desc = "Command mode" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next match (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Prev match (centered)" })
vim.keymap.set("n", "<leader>r", "<cmd>vsplit | terminal ipython --no-banner -i %<cr>", { desc = "[r]un in IPython" })

-- Plugins
require("lazy").setup({
	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		branch = "master",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-telescope/telescope-symbols.nvim",
		},
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				defaults = {
					layout_strategy = "horizontal",
					layout_config = { height = 0.8, width = 0.8 },
					prompt_prefix = " ",
					selection_caret = "> ",
					entry_prefix = "  ",
					file_ignore_patterns = {},
					path_display = { "truncate" },
				},
				pickers = {
					find_files = {},
					git_files = {},
					live_grep = {},
					buffers = {
						show_all_buffers = true,
						sort_lastused = true,
						theme = "dropdown",
						previewer = false,
						mappings = {
							i = { ["<c-d>"] = "delete_buffer" },
						},
					},
				},
				extensions = {
					file_browser = {
						theme = "dropdown",
						hijack_netrw = true,
						dir_icon = "",
						dir_icon_hl = "Directory",
					},
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})
			telescope.load_extension("fzf")
			telescope.load_extension("file_browser")
			telescope.load_extension("ui-select")

			-- Telescope keymaps
			vim.keymap.set("n", "<leader><leader>", "<cmd>Telescope<cr>", { desc = "Telescope" })
			vim.keymap.set("n", "<leader>fc", "<cmd>Telescope commands<cr>", { desc = "[f]ind [c]ommands" })
			vim.keymap.set("n", "<leader>fq", "<cmd>Telescope quickfix<cr>", { desc = "[f]ind [q]uickfix" })
			vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "[f]ind [f]iles" })
			vim.keymap.set("n", "<leader>fg", "<cmd>Telescope git_files<cr>", { desc = "[f]ind [g]it files" })
			vim.keymap.set("n", "<leader>fm", "<cmd>Telescope marks<cr>", { desc = "[f]ind [m]arks" })
			vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "[f]ind [b]uffers" })
			vim.keymap.set("n", "<leader>fB", "<cmd>Telescope file_browser<cr>", { desc = "[f]ind [B]rowser" })
			vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "[f]ind [h]elp" })
			vim.keymap.set("n", "<leader>fM", "<cmd>Telescope man_pages<cr>", { desc = "[f]ind [M]an pages" })
			vim.keymap.set("n", "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "[/] search buffer" })
			vim.keymap.set("n", "<leader>?", "<cmd>Telescope live_grep<cr>", { desc = "[?] live grep" })
			vim.keymap.set("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "[f]ind [s]ymbols" })
			vim.keymap.set("n", "<leader>fS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", { desc = "[f]ind [S]ymbols (workspace)" })
			vim.keymap.set("n", "<leader>ze", "<cmd>Telescope spell_suggest<cr>", { desc = "spelling" })
			vim.keymap.set("n", "<leader>fe", "<cmd>Telescope symbols<cr>", { desc = "[f]ind [e]moji" })
		end,
	},

	-- Mini.nvim
	{
		"echasnovski/mini.nvim",
		config = function()
			-- Icons (replaces nvim-web-devicons)
			require("mini.icons").setup()
			MiniIcons.mock_nvim_web_devicons()

			require("mini.cursorword").setup({ delay = 100 })
			require("mini.pairs").setup()
			require("mini.surround").setup({
				mappings = {
					add = "sa",
					delete = "sd",
					find = "sf",
					find_left = "sF",
					highlight = "sh",
					replace = "sr",
					update_n_lines = "sn",
				},
			})

			-- Sessions
			local sessions = require("mini.sessions")
			sessions.setup({
				directory = "~/sessions",
				file = "",
			})
			vim.keymap.set("n", "<Leader>ss", function()
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
			end, { desc = "[s]ession [s]ave" })

			-- Git diff in gutter (replaces gitsigns)
			require("mini.diff").setup({
				view = {
					style = "sign",
					signs = { add = "▎", change = "▎", delete = "▁" },
				},
				mappings = {
					apply = "gh",
					reset = "gH",
					textobject = "gh",
					goto_first = "[H",
					goto_prev = "[h",
					goto_next = "]h",
					goto_last = "]H",
				},
			})

			-- Keybinding hints (replaces which-key)
			local miniclue = require("mini.clue")
			miniclue.setup({
				triggers = {
					{ mode = "n", keys = "<Leader>" },
					{ mode = "x", keys = "<Leader>" },
					{ mode = "n", keys = "g" },
					{ mode = "x", keys = "g" },
					{ mode = "n", keys = "'" },
					{ mode = "n", keys = "`" },
					{ mode = "x", keys = "'" },
					{ mode = "x", keys = "`" },
					{ mode = "n", keys = '"' },
					{ mode = "x", keys = '"' },
					{ mode = "i", keys = "<C-r>" },
					{ mode = "c", keys = "<C-r>" },
					{ mode = "n", keys = "<C-w>" },
					{ mode = "n", keys = "z" },
					{ mode = "x", keys = "z" },
					{ mode = "n", keys = "[" },
					{ mode = "n", keys = "]" },
					{ mode = "n", keys = "s" },
					{ mode = "x", keys = "s" },
				},
				clues = {
					miniclue.gen_clues.builtin_completion(),
					miniclue.gen_clues.g(),
					miniclue.gen_clues.marks(),
					miniclue.gen_clues.registers(),
					miniclue.gen_clues.windows(),
					miniclue.gen_clues.z(),
					-- Custom group descriptions
					{ mode = "n", keys = "<Leader>f", desc = "+[f]ind" },
					{ mode = "n", keys = "<Leader>d", desc = "+[d]iagnostics" },
					{ mode = "n", keys = "<Leader>s", desc = "+[s]ession" },
					{ mode = "n", keys = "<Leader>z", desc = "+spell" },
				},
				window = {
					delay = 0,
					config = function(bufnr)
						local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
						local max_width = 0
						for _, line in ipairs(lines) do
							max_width = math.max(max_width, vim.fn.strdisplaywidth(line))
						end
						max_width = math.min(80, max_width + 2)
						local height = #lines
						return {
							border = "rounded",
							anchor = "NW",
							width = max_width,
							height = height,
							row = math.floor((vim.o.lines - height) / 2),
							col = math.floor((vim.o.columns - max_width) / 2),
						}
					end,
				},
			})
		end,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		config = function()
			require("nvim-treesitter.configs").setup({
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},


	-- Completion (blink.cmp)
	{
		"saghen/blink.cmp",
		version = "1.*",
		dependencies = { "rafamadriz/friendly-snippets" },
		opts = {
			keymap = {
				preset = "default",
				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-e>"] = { "hide" },
				["<CR>"] = { "accept", "fallback" },
				["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
				["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },
			},
			appearance = { nerd_font_variant = "mono" },
			completion = { documentation = { auto_show = true } },
			sources = { default = { "lsp", "path", "snippets", "buffer" } },
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
	},

	-- Formatting (replaces null-ls)
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff_format" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				java = { "google-java-format" },
				json = { "jaq" },
			},
			formatters = {
				jaq = {
					command = "jaq",
					args = { "." },
					stdin = true,
				},
			},
			format_on_save = {
				timeout_ms = 2000,
				lsp_format = "fallback",
			},
		},
	},

	-- Linting (replaces null-ls diagnostics)
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				javascript = { "eslint" },
				typescript = { "eslint" },
				python = { "ruff" },
			}
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},

	-- LSP configurations (provides server configs for vim.lsp.config)
	{ "neovim/nvim-lspconfig" },

	-- Themes
	{ "ellisonleao/gruvbox.nvim", opts = { contrast = "soft" } },
	{ "nyoom-engineering/oxocarbon.nvim" },
})

-- LSP configuration (Neovim 0.11+)
local capabilities = require("blink.cmp").get_lsp_capabilities()
vim.lsp.config("*", { capabilities = capabilities })

-- pylsp config: disable features that pyright handles better
vim.lsp.config("pylsp", {
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = { enabled = false },
				pyflakes = { enabled = false },
				pylint = { enabled = false },
				mccabe = { enabled = false },
				autopep8 = { enabled = false },
				yapf = { enabled = false },
			},
		},
	},
})

vim.lsp.enable({ "pyright", "pylsp", "rust_analyzer", "jdtls" })

-- LSP keymaps on attach
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local function opts(desc)
			return { buffer = args.buf, desc = desc }
		end
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts("Hover"))
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("[g]o to [d]efinition"))
		vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts("[g]o to [t]ype"))
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts("[g]o to [i]mplementation"))
		vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", opts("[g]o to [r]eferences"))
		vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, opts("code [a]ction"))
		vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, opts("[d]iagnostic next [j]"))
		vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, opts("[d]iagnostic prev [k]"))
		vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", opts("[d]iagnostic [l]ist"))
		vim.keymap.set("n", "<leader>dr", function()
			vim.diagnostic.reset()
			vim.lsp.stop_client(vim.lsp.get_clients({ bufnr = 0 }))
			vim.cmd("edit")
		end, opts("[d]iagnostic [r]efresh"))
	end,
})

-- Diagnostics config (virtual text only, no gutter signs)
vim.diagnostic.config({
	signs = false,
	virtual_text = {
		prefix = "●",
		spacing = 2,
		format = function(diagnostic)
			-- Only show first diagnostic per line (most severe due to severity_sort)
			local line_diagnostics = vim.diagnostic.get(0, { lnum = diagnostic.lnum })
			if line_diagnostics[1] and line_diagnostics[1].message == diagnostic.message then
				return diagnostic.message
			end
			return nil
		end,
	},
	float = {
		border = "rounded",
		source = true,
		header = "",
		prefix = "",
		focusable = true,
	},
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

-- Colorscheme
vim.opt.background = "dark"
vim.cmd.colorscheme("oxocarbon")

vim.cmd([[
hi Conceal guifg=None
hi Normal guibg=NONE
hi NormalNC guibg=NONE
hi WhichKeyFloat guibg=NONE
hi WhichKeyBorder guibg=NONE
hi LineNr guibg=NONE
hi FoldColumn guibg=NONE
hi SignColumn guibg=NONE
hi VertSplit guibg=NONE
]])

vim.cmd([[
augroup hide_symbols
  autocmd!
  autocmd VimEnter * call matchadd('Conceal', 'TODO', 10, 100, {'conceal': 'λ'})
  autocmd VimEnter * hi! link Conceal TODO
augroup end
]])
