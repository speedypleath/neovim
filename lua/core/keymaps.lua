-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function toogle()
  vim.api.nvim_command('wincmd l')
  NTGlobal["terminal"]:toggle()
  vim.api.nvim_command('NERDTreeToggle')
end

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Disable arrow keys
-- map('', '<up>', '<nop>')
-- map('', '<down>', '<nop>')
-- map('', '<left>', '<nop>')
-- map('', '<right>', '<nop>')

-- Map Esc to kk
map('i', 'kk', '<Esc>')

-- Clear search highlighting with <leader> and c
map('n', '<leader>c', ':nohl<CR>')

-- Change split orientation
map('n', '<leader>tk', '<C-w>t<C-w>K') -- change vertical to horizontal
map('n', '<leader>th', '<C-w>t<C-w>H') -- change horizontal to vertical

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>')

-- Fast saving with <leader> and s
map('n', '<C-s>', ':w<CR>')
map('i', '<C-s>', '<C-c>:w<CR>')

-- Close all windows and exit from Neovim with <leader> and q
map('n', '<leader>q', ':qa!<CR>')

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Terminal mappings
map('t', '<Esc>', '<c-\\><c-n>')
vim.keymap.set('n', '<C-q>', toogle)
map('n', '<leader>1', ':lua NTGlobal["terminal"]:open(1)<cr>')                              -- terminal 1
map('n', '<leader>2', ':lua NTGlobal["terminal"]:open(2)<cr>')                              -- terminal 2
map('n', '<leader>3', ':lua NTGlobal["terminal"]:open(3)<cr>')                              -- terminal 3
map('n', '<leader>4', ':lua NTGlobal["terminal"]:open(4)<cr>')                              -- terminal 4
map('n', '<leader>5', ':lua NTGlobal["terminal"]:open(5)<cr>')                              -- terminal 5

map('n', '<C-t>', ':lua NTGlobal["terminal"].window:focus()<CR>')                                   -- focus terminal
-- NvimTree
map('n', '<C-f>', ':NERDTreeFocus<CR>')                                                     -- focus tree
map('t', '<C-f>', '<c-\\><c-n>:NERDTreeFocus<CR>')

-- Tagbar
map('n', '<C-z', ':TagbarToggle<CR>')          -- open/close




