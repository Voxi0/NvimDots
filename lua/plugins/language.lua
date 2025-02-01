return {
	-- Syntax highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = { "lua" },
			sync_install = true,
			auto_install = true,
			indent = { enable = false },
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		},
	},

	-- LSP and autocompletion
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Allows you to interactively install language tools e.g. formatters
			{
				"williamboman/mason.nvim",
				opts = {
					ui = {
						icons = {
							package_installed = "✓",
							package_pending = "➜",
							package_uninstalled = "✗",
						},
					},
				},
			},

			-- Makes it easier to hook up Mason to Nvim-Lspconfig
			{
				"williamboman/mason-lspconfig.nvim",
				opts = {
					ensure_installed = { "lua_ls" },
					automatic_installation = true,
				},
			},

			-- Autocompletion
			{
				"saghen/blink.cmp",
				version = "*",
				dependencies = { "rafamadriz/friendly-snippets", "xzbdmw/colorful-menu.nvim" },
				opts_extend = { "sources.default" },
				opts = {
					-- "default" - Mappings similar to built-in completion
					-- "super-tab" - Mappings similar to VSCode (Tab to accept and arrow keys to navigate)
					-- "enter" - Mappings similar to "super-tab" but "enter" to accept instead of "tab"
					keymap = { preset = "super-tab" },

					-- Preset for snippets - "default", "luasnip" or "mini_snippets"
					snippets = { preset = "default" },

					-- Experimental signature help support
					signature = { enabled = true },

					-- Appearence
					appearance = {
						-- "normal" or "mono" - Adjusts spacing to ensure that icons are aligned
						nerd_font_variant = "mono",
					},

					-- Default list of enabled providers
					sources = {
						-- Add "buffer" if you want text completions
						default = { "lsp", "path", "snippets" },
					},

					-- Completion
					completion = {
						ghost_text = { enabled = true },
						documentation = {
							auto_show = true,
							auto_show_delay_ms = 500,
						},
						menu = {
							auto_show = true,
							draw = {
								-- "colorful-menu.nvim" combines "label" and "label_description" together so they aren't required
								columns = { { "kind_icon" }, { "label", gap = 1 } },
								components = {
									label = {
										text = function(ctx)
											return require("colorful-menu").blink_components_text(ctx)
										end,
										highlight = function(ctx)
											return require("colorful-menu").blink_components_highlight(ctx)
										end,
									},
								},
							},
						},
					},
				},
			},
		},
		config = function()
			-- Function to be called when a LSP attaches to a buffer
			local onAttach = function(_, bufnr)
				-- LSP Keybinds
				local map = vim.keymap.set
				map("n", "K", vim.lsp.buf.hover, { desc = "Show Information" })
				map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Show Code Actions" })
				map("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
				map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
				map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename All References to The Symbol Under The Cursor" })
			end

			-- Automatically configure LSP handlers
			local lspconfig = require("lspconfig")
			require("mason-lspconfig").setup_handlers({
				function(server)
					lspconfig[server].setup({
						on_attach = onAttach,
						capabilities = require("blink.cmp").get_lsp_capabilities(),
					})
				end,
			})
		end,
	},

	-- Formatting
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
		keys = {
			-- Format entire file
			{
				"<leader>fm",
				function()
					require("conform").format({
						lsp_fallback = true,
						async = false,
						timeout_ms = 500,
					})
				end,
				desc = "Format File",
			},
		},
	},
}
