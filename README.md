# NvimDots
This is my personal configuration for Neovim using the <a href="https://github.com/folke/lazy.nvim">lazy.nvim</a> plugin manager.

I took some things from [NVChad](https://nvchad.com/) and [LazyVim](https://www.lazyvim.org/). Thanks to these amazing distributions, I discovered some cool
new plugins like <a href="https://github.com/Saghen/blink.cmp">blink.cmp</a> for autocompletion which is far easier and performant compared to
[nvim.cmp](https://github.com/hrsh7th/nvim-cmp) and useful keybinds that just makes life easier e.g. pressing `Control + S` keys saves the file which many
people are used to because this keybind is used in literally every text editing software out there like Notepad and Word.

## Install
```bash
# Linux / MacOS (Unix)
git clone https://github.com/Voxi0/NvimDots ~/.config/nvim && nvim

# Windows CMD
git clone https://github.com/NvChad/starter %USERPROFILE%\AppData\Local\nvim && nvim

# Windows Powershell
git clone https://github.com/NvChad/starter $ENV:USERPROFILE\AppData\Local\nvim && nvim
```

## Post-Install
- Run `:Lazy sync` command in Neovim to update all plugins.
- Run `:MasonInstallAll` command after `lazy.nvim` finishes downloading all the plugins.
- Delete the `.git` folder and `.gitignore` file from where NvimDots was installed (Depends on your system).

## Uninstall
```bash
# Linux / MacOS (Unix)
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim

# Windows CMD
rd -r ~\AppData\Local\nvim
rd -r ~\AppData\Local\nvim-data

# Windows PowerShell
rm -Force ~\AppData\Local\nvim
rm -Force ~\AppData\Local\nvim-data
```

## Showcase
More screenshots [here](./assets/showcase.md)
![Dashboard](./assets/images/dashboard.png "Snacks.Dashboard")
![Main](./assets/images/main.png "Main")

## Plugins
- Dashboard: [snacks.dashboard](https://github.com/folke/snacks.nvim/blob/main/docs/dashboard.md)
- Colorscheme: [rose-pine](https://github.com/rose-pine/neovim)
- File Explorer: [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
- LSP: 
    - [mason.nvim](https://github.com/williamboman/mason.nvim)
    - [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
    - [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- Autocompletion: [blink.cmp](https://github.com/Saghen/blink.cmp)
- Bufferline: [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
- Statusline: [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- Formatter: [conform.nvim](https://github.com/stevearc/conform.nvim)
- Fuzzy Finder: [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- Quality of Life: 
    - [snacks.nvim](https://github.com/folke/snacks.nvim)
    - [mini.nvim](https://github.com/echasnovski/mini.nvim)
- Utilities:
    - [nvim-colorizer.lua](https://github.com/catgoose/nvim-colorizer.lua)
    - [todo-comments](https://github.com/folke/todo-comments.nvim)
    - [which-key.nvim](https://github.com/folke/which-key.nvim)

## Contributing
Please do add new Github issues if you have any problems, I will look into them as soon as I can although I cannot make any guarantees. Pull requests are
welcome but for any major changes, please open an issue first to discuss what changes you desire.
