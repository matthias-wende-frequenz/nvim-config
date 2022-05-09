local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
    -- ✅ My plugins here
    use "wbthomason/packer.nvim"        -- Have packer manage itself
    use "nvim-lua/popup.nvim"           -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim"         -- Useful lua functions used ny lots of plugins
    use "windwp/nvim-autopairs"         -- Autopairs, integrates with both cmp and treesitter
    use "lewis6991/gitsigns.nvim"       -- Git status meta information in left vertical-bar
    use 'tpope/vim-fugitive'            -- Git for vim
    -- use 'kyazdani42/nvim-web-devicons'
    -- use 'kyazdani42/nvim-tree.lua'
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
          'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    -- ✅ Colorschemes
    use "lunarvim/colorschemes"       -- A bunch of colorschemes you can try out
    use "lunarvim/darkplus.nvim"
    use "folke/tokyonight.nvim"
    use "ellisonleao/gruvbox.nvim"
    use "lifepillar/vim-gruvbox8"
    use "joshdick/onedark.vim"

    -- snippets
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
    use "SirVer/ultisnips"
    use "mlaursen/vim-react-snippets"

    -- LSP
    use "neovim/nvim-lspconfig" -- enable LSP
    use "williamboman/nvim-lsp-installer" -- simple to use language server installer

    -- Telescope
    -- use "nvim-telescope/telescope.nvim"
    -- use 'nvim-telescope/telescope-media-files.nvim'

    -- cmp completions
    -- use "hrsh7th/nvim-cmp"
    -- use "hrsh7th/cmp-buffer"

    -- Bufferline
    use "akinsho/bufferline.nvim"

    -- Prettier 
    use "prettier/vim-prettier"

    -- Github copilot
    -- use "github/copilot.vim"

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
