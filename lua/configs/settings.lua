local g = vim.g
local o = vim.o

-- Better editor UI
o.number = true
o.numberwidth = 3
o.relativenumber = true
o.cursorline = true

-- Number of screen lines to keep above and below the cursor
o.scrolloff = 8

-- Decrease update time
o.timeoutlen = 500
o.updatetime = 200

-- o.autoindent = true
o.wrap = true
o.textwidth = 300
o.tabstop = 4

-- Remember 50 items in commandline history
o.history = 50

-- Better buffer splitting
o.splitright = true
o.splitbelow = true

-- Preserve view while jumping
o.jumpoptions = 'view'

-- Stable buffer content on window open/close events.
o.splitkeep = 'screen'


