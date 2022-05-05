--[[

Neovim init file
Version: 0.59.5 - 2022/05/03
Maintainer: brainf+ck
Website: https://github.com/brainfucksec/neovim-lua

--]]

require('packer_init')
require('core/options')
require('core/autocmds')
require('core/keymaps')
require('core/colors')
require('core/statusline')
require('plugins/indent-blankline')
require('plugins/nvim-cmp')
require('plugins/nvim-lspconfig')
require('plugins/alpha-nvim')
require('plugins/nvim-terminal')
