return {
	-- Shows available keybinds in a popup window as you type to help you remember keybinds
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
	},

	-- Mini.nvim and Snacks.nvim are collections of small quality of life plugins
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
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
		end,
	},
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			-- Render the file as quickly as possible before loading any plugins when doing "nvim <some_file>"
			quickfile = { enabled = true },

			-- Notifications UI
			notifier = {
				enabled = true,
				timeout = 3000,
			},

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

	-- Highlight, list and search todo comments in your projects
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
}
