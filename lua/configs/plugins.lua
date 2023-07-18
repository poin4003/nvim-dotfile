
require('packer').startup(function()
  use 'wbthomason/packer.nvim'    -- Plugin for managing plugins.
  use 'olimorris/onedarkpro.nvim' -- Plugin for colorscheme.
  use 'itchyny/lightline.vim'     -- Plugin for lightbar.
  use 'preservim/nerdtree'        -- Plugin for nerdtree.
  use 'sheerun/vim-polyglot'      -- Plugin for managing code.
  use 'preservim/tagbar'          -- Plugin for tagbar.
  use 'ryanoasis/vim-devicons'    -- Plugin for dev icons.
  use 'neoclide/coc.nvim'         -- Plugin for managing lsp.
end)

-- Colorscheme setup.
require("onedarkpro").setup({
  colors = {
    onedark = {
      bg = "#1e222a"
    }
  }
})

-- Colorscheme.
vim.cmd("colorscheme onedark")
-- NERDTree setup.
vim.api.nvim_set_var('NERDTreeMinimalUI', 1)
vim.api.nvim_set_var('NERDTreeShowParentNode', 0)
-- Tagbar setup.
vim.g.tagbar_autofocus = 1
vim.g.tagbar_autoshowtag = 1
vim.g.tagbar_compact = 1
vim.g.tagbar_show_help = 0




