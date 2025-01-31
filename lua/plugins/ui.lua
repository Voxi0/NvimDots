return {
	-- Colorscheme picker with live preview and persistence
	{
		"rose-pine/neovim",
		name = "rose-pine",
		opts = {
			variant = "main",
			dark_variant = "main",
			styles = {
				bold = true,
				italic = true,
				transparency = false,
			},
		},
		config = function()
			vim.cmd("colorscheme rose-pine")
		end,
	},

	-- UI improvement plugins
	-- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu
	{
		"folke/noice.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		event = "VeryLazy",
		opts = {},
	},

	-- Extensible UI for Neovim notifications and LSP progress messages
	{ "j-hui/fidget.nvim", opts = {} },

	-- Snazzy bufferline with tabpage integration written in Lua
	{
		"akinsho/bufferline.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		version = "*",
		opts = {
			options = {
				mode = "buffers",
				sort_by = "insert_after_current",
				persist_buffer_sort = true,
				numbers = "none",

				-- Style and theme
				style_preset = default,
				themable = true,
				color_icons = true,
				separator_style = "thin",
				indicator = {
					-- icon = "| ",						-- Should be omitted if "style" is not "icon"
					style = "underline",
				},
				max_name_length = 18,
				max_prefix_length = 15, -- Prefix used when a buffer is de-duplicated
				truncate_names = true, -- Whether or not tab names should be truncated
				tab_size = 18,

				-- Icons
				modified_icon = "● ",
				close_icon = " ",
				left_trunc_marker = " ",
				right_trunc_marker = " ",

				-- What to show
				show_buffer_icons = true,
				show_buffer_close_icons = false,
				show_close_icons = false,
				show_tab_indicators = true,
				always_show_bufferline = true,
				auto_toggle_bufferline = true,

				-- Commands
				close_command = "bdelete! %d",
				right_mouse_command = "bdelete! %d",
				left_mouse_command = "buffer %d",
				middle_mouse_command = nil,

				-- Diagnostics - Makes it clear which files are erroneous
				diagnostics = "nvim_lsp",
				diagnostics_update_on_event = true,
			},
		},
	},

	-- Blazingly fast and easy to configure neovim statusline plugin written in pure Lua
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				icons_enabled = true,
				theme = "auto",
				section_separators = "",
				component_separators = "",
			},
		},
	},
}
