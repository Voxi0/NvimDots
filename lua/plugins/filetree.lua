return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	lazy = false,
	config = function()
		-- Set up NvimTree
		require("nvim-tree").setup({
			filters = { dotfiles = false },
			disable_netrw = true,
			sync_root_with_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = false,
			},
			view = {
				side = "left",
				width = 35,
				preserve_window_proportions = true,
			},
			renderer = {
				-- root_folder_label = false,
				highlight_git = true,
				indent_markers = { enable = true },
				icons = {
					glyphs = {
						default = "󰈚",
						git = { unmerged = "" },
						folder = {
							default = "",
							empty = "",
							empty_open = "",
							open = "",
							symlink = "",
						},
					},
				},
			},
		})

		-- Automatically open a file upon creation
		local api = require("nvim-tree.api")
		api.events.subscribe(api.events.Event.FileCreated, function(file)
			vim.cmd("edit " .. vim.fn.fnameescape(file.fname))
		end)
	end,
	keys = {
		{ "<C-n>", "<CMD>NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
	},
}
