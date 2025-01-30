return {
	-- Beautiful UI framework to create interactive UI in Neovim, clickable and hoverable
	{ "nvchad/volt" },

	-- Icons
	{ "nvim-tree/nvim-web-devicons" },

	-- NVChad UI
	{
   	"nvchad/ui",
	 	dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require "nvchad"
    end
 	},

	-- NVChad themes
 	{
    "nvchad/base46",
    lazy = true,
    build = function()
      require("base46").load_all_highlights()
    end,
		keys = {
			{ "<leader>th", function() require("nvchad.themes").open { style = "flat", border = true } end, desc = "Choose Colorscheme" },
		},
 	},
}
