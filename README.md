# Neovim Lua Configuration 🚀
This is the lifeboat for my custom Neovim config. We started with kickstart, and I'm slowly tweaking and adding things as I go! 🌟 This setup is modular, lightweight, and packed with modern Neovim goodies to supercharge my coding workflow. 💻 If you like anything, feel free to clone or copy.

## Features ✨

- Modular Structure 📦: Organized Lua modules for keymaps, plugins, LSP, and more.
- Plugin Management 🔌: Powered by lazy.nvim for fast and flexible plugin loading.
- LSP Support 🛠️: Seamless autocompletion, diagnostics, and formatting with nvim-lspconfig.
- Custom Keybindings ⌨️: Intuitive shortcuts for navigation, editing, and productivity.
- UI Enhancements 🎨: Clean statusline, vibrant colorscheme, and file explorer integration.
- Performance ⚡: Optimized with lazy-loading and minimal plugin bloat.

## Prerequisites 📋

- Neovim (v0.9.0 or later recommended) 🖥️
- Git (for cloning and plugin management) 🗃️
- A Nerd Font (e.g., JetBrains Mono Nerd Font) for icon support 🆎
- Optional: Language servers for LSP (managed via Mason, see below) 🔧

## Installation 🛠️

Backup Existing Configuration 🔄:Save your current Neovim config, just in case:
```bash
mv ~/.config/nvim ~/.config/nvim.bak
```

Clone the Repository 📥:Grab this config and place it in the Neovim directory:
```bash
git clone https://github.com/yourusername/nvim-config.git ~/.config/nvim
```

Start Neovim 🚀:Fire up Neovim to install plugins via lazy.nvim:
```bash
nvim
```

## Install Language Servers 🌐:
This config uses Mason to simplify LSP server management. To install language servers:

Run `:Mason` to open the Mason UI.
Browse or search for language servers (e.g., pyright, tsserver, rust-analyzer).
Press `i` to install the desired server.
Alternatively, configure automatic installation in `lua/plugins/lsp.lua` by adding servers to Mason’s `ensure_installed` list
```lua
require("mason-lspconfig").setup({
  ensure_installed = { "pyright", "tsserver", "rust_analyzer" },
})
```

Mason will download and set up the servers, which are then configured via nvim-lspconfig.

## Usage 🖱️

Sync Plugins 🔄: Run :Lazy to manage plugins (install, update, or clean) via lazy.nvim.
Keybindings ⌨️: See lua/core/keymaps.lua for all custom shortcuts.
LSP Features 🛠️: Use <leader>ca for code actions, gd for definitions, and K for hover docs (details in lua/plugins/lsp.lua).
Customization 🎨: Tweak plugins or settings in lua/plugins/ or lua/core/.

## Customization 🛠️
Here are the details of how I've customized my config! 😎

### Custom Plugins

You can view the list of custom plugins I've added to the kickstart in the /custom/plugins folder. I've modularized and created separate lua files for each plugin.

- LazyGit (useful)
- UFO (folds are literally how i get keep my sanity looking at our test suites)
- Nvim-Dap with nvim-dap-go (still working on setting this one up)
- Vim-go (seems useful but haven't used yet since our makefile is so comprehensive)

### LSP Servers 

Currently using Mason to install, here is my list of installed goodies: 
TODO: add image of currently installed LSPs
