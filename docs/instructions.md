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
