return {
	-- Shows available keybinds in a popup window as you type to help you remember keybinds
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
	},

	-- Discord rich presence
	{
    "IogaMaster/neocord",
    event = "VeryLazy",
		opts = {
			logo = "auto",
			logo_tooltip = "The One True Text Editor",
			main_image = "language",
			show_time = true,
			global_timer = true,

			-- Rich presence text options
			editing_text        = "Editing %s",
    	file_explorer_text  = "Browsing %s",
    	git_commit_text     = "Committing Changes",
    	plugin_manager_text = "Managing Plugins",
    	reading_text        = "Reading %s",
    	workspace_text      = "Working on %s",
    	line_number_text    = "Line %s Out of %s",
    	terminal_text       = "Using The Terminal",
		},
	},

	-- A collection of quality of life plugins
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			-- Text edit operators
			require("mini.operators").setup({
				evaluate = {
					prefix = "g=",
					func = nil,
				},
				exchange = {
					prefix = "gx",
					reindent_linewise = true,
				},
				multiply = {
					prefix = 'gm',
					func = nil,
				},
				replace = {
					prefix = 'gr',
					reindent_linewise = true,
				},
				sort = {
					prefix = 'gs',
					func = nil,
				}
			})

			-- Surround
			require("mini.surround").setup({
				search_method = "cover",
				silent = false,

				-- Number of lines within which surrounding is searched
  			n_lines = 20,

				-- Mappings
				mappings = {
					add = "sa", 						-- Add surrounding in Normal and Visual modes
					delete = "sd", 					-- Delete surrounding
					find = "sf", 						-- Find surrounding (to the right)
					find_left = "sF", 			-- Find surrounding (to the left)
					highlight = "sh", 			-- Highlight surrounding
					replace = "sr", 				-- Replace surrounding
					update_n_lines = "sn",	-- Update `n_lines`
					suffix_last = "l", 			-- Suffix to search with "prev" method
					suffix_next = "n", 			-- Suffix to search with "next" method
				},
			})

			-- Autopairs
			require("mini.pairs").setup({
				-- Modes in which mappings from this config should be created
				modes = { insert = true, command = false, terminal = false },

				-- Global mappings
				mappings = {
					["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
					["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
					["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },
					["<"] = { action = "open", pair = "<>", neigh_pattern = "[^\\]." },

					[")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
					["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
					["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },
					[">"] = { action = "close", pair = "<>", neigh_pattern = "[^\\]." },

					['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^\\].", register = { cr = false } },
					["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a\\].", register = { cr = false } },
					["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\].", register = { cr = false } },
					["|"] = { action = "closeopen", pair = "||", neigh_pattern = "[^\\].", register = { cr = false } },
				},
			})

			-- Sessions
			require("mini.sessions").setup({
				autoread = true,			-- Whether to read default session if Neovim is opened without file arguments
				autowrite = true,			-- Whether to write currently read session before quitting Neovim
				directory = "",				-- Where global sessions are stored
				file = "Session.vim",	-- Filename for local sessions
				verbose = { read = true, write = true, delete = true },	-- Whether to print session path after action
				force = { read = false, write = true, delete = false },	-- Whether to force possibly harmful actions (Meaning depends on function)

				-- Hook functions for actions
				hooks = {
					-- Before/After successful action
					pre = { read = nil, write = nil, delete = nil },
					post = { read = nil, write = nil, delete = nil },
				},
			})
		end,
	},
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			-- Dashboard
			dashboard = { enabled = true },

			-- Render the file as quickly as possible before loading any plugins when doing "nvim <some_file>"
			quickfile = { enabled = true },

			-- Notifications UI
			notifier = {
				enabled = true,
				timeout = 3000,
			},

			-- Animations
			animate = { enabled = true },

			-- Pretty statuscolumn
			statuscolumn = { enabled = true },

			-- Indentation guides
			indent = { enabled = true },

			-- Smooth scrolling
			scroll = {},

			-- Beautiful TUI for Git
			lazygit = { enabled = true },
		},
		keys = {
			-- Indent
			{
				"<leader>ug",
				function()
					if Snacks.indent.enabled then
						Snacks.indent.disable()
					else
						Snacks.indent.enable()
					end
				end,
				desc = "Toggle Indent Guides",
			},

			-- LazyGit
			{
				"<leader>lg",
				function()
					Snacks.lazygit()
				end,
				desc = "LazyGit",
			},

			-- Notifier
			{
				"<leader>un",
				function()
					Snacks.notifier.hide()
				end,
				desc = "Dismiss All Notifications",
			},
		},
	},

	-- Fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{
				"<leader>ff",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Telescope find files",
			},
			{
				"<leader>fg",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "Telescope live grep",
			},
			{
				"<leader>fb",
				function()
					require("telescope.builtin").buffers()
				end,
				desc = "Telescope buffers",
			},
			{
				"<leader>fh",
				function()
					require("telescope.builtin").help_tags()
				end,
				desc = "Telescope help tags",
			},
		},
	},

	-- The fastest Neovim colorizer
	{
		"catgoose/nvim-colorizer.lua",
    event = "VeryLazy",
		opts = {
			lazy_load = true,
			filetypes = { "css", "javascript" },
		},
	},

	-- Highlight, list and search todo comments in your projects
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
}
