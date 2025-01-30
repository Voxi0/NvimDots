return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	lazy = false,
	config = function()
		-- Sort files naturally
		local function naturalCmp(left, right)
			left = left.name:lower()
			right = right.name:lower()
			if left == right then
				return false
			end

			for i = 1, math.max(string.len(left), string.len(right)), 1 do
				local l = string.sub(left, i, -1)
				local r = string.sub(right, i, -1)

				if
					type(tonumber(string.sub(l, 1, 1))) == "number"
					and type(tonumber(string.sub(r, 1, 1))) == "number"
				then
					local l_number = tonumber(string.match(l, "^[0-9]+"))
					local r_number = tonumber(string.match(r, "^[0-9]+"))

					if l_number ~= r_number then
						return l_number < r_number
					end
				elseif string.sub(l, 1, 1) ~= string.sub(r, 1, 1) then
					return l < r
				end
			end
		end

		-- Set up NvimTree
		require("nvim-tree").setup({
			sort_by = function(nodes)
				table.sort(nodes, naturalCmp)
			end,
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
