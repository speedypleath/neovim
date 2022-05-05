-- following option will hide the buffer when it is closed instead of deleting
-- the buffer. This is important to reuse the last terminal buffer
-- IF the option is not set, plugin will open a new terminal every single time

local status_ok, nvim_terminal = pcall(require, 'nvim-terminal')
if not status_ok then
  return
end

vim.o.hidden = true
Terminal = require('nvim-terminal.terminal')

terminal = Terminal:new(window)
