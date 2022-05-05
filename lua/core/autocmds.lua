--------------------------------------------------------
-- Autocommand functions
-----------------------------------------------------------

-- Define autocommands with Lua APIs
-- See: h:api-autocmd, h:augroup

local augroup = vim.api.nvim_create_augroup   -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand

-- Highlight on yank
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '1000' })
  end
})

-- Remove whitespace on save
autocmd('BufWritePre', {
  pattern = '*',
  command = ":%s/\\s\\+$//e"
})

-- Don't auto commenting new lines
autocmd('BufEnter', {
  pattern = '*',
  command = 'set fo-=c fo-=r fo-=o | if winnr("$") == 1 && exists("b:NERDTree") | quit | endif'
})

-- Settings for fyletypes:
-- Disable line lenght marker
augroup('setLineLenght', { clear = true })
autocmd('Filetype', {
  group = 'setLineLenght',
  pattern = { 'text', 'markdown', 'html', 'xhtml', 'javascript', 'typescript' },
  command = 'setlocal cc=0'
})

-- Set indentation to 2 spaces
augroup('setIndent', { clear = true })
autocmd('Filetype', {
  group = 'setIndent',
  pattern = { 'xml', 'html', 'xhtml', 'css', 'scss', 'javascript', 'typescript',
    'yaml', 'lua'
  },
  command = 'setlocal shiftwidth=2 tabstop=2'
})

-- Terminal settings:
-- Open a Terminal on the bottom tab
autocmd('StdinReadPre', {
  pattern = '*',
  command = 'let s:std_in=1'
})

local Window = require('nvim-terminal.window')
local window = Window:new({
	position = 'bo',
	split = 'vsp',
	width = 50,
	height = 15
})

autocmd('BufEnter', {
  pattern = 'term://*',
  command = 'set nonumber'
})

autocmd('VimEnter', {
  pattern = '*',
  command = 'lua NTGlobal["terminal"]:open(1)'
})

autocmd('VimEnter', {
  command = 'set nonumber | NERDTree | if argc() > 0 || exists("s:std_in") | wincmd l | endif'
})

