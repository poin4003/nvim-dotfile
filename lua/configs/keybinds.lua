-- Variable to check windows 
terminal_open = false
nerdtree_open = false
tagbar_open = false

-- Keybinding function for Terminal <F8>
--vim.api.nvim_set_keymap('n', '<F8>', ':split<CR>:resize 15<CR>:term<CR>', {noremap = true})
function toggle_terminal()
    if terminal_open then
        vim.cmd('bd!') 
        terminal_open = false
    else
        vim.cmd(':split | resize 15 | term') 
        terminal_open = true
    end
end

-- Keybinding function for NerdTree <F7>
--vim.api.nvim_set_keymap('n', '<F7>', ':NERDTree<CR>:vertical resize 20<CR>', { noremap = true, silent = true })
function toggle_nerdtree()
  if nerdtree_open then
    vim.cmd(':NERDTree')
    vim.cmd(':vertical resize 20')
    nerdtree_open = true
  else
    vim.cmd(':NERDTreeClose')
    nerdtree_open = false
  end
end

-- Keybinding function for Windows <F9>
function toggle_windows()
    if terminal_open or nerdtree_open or tagbar_open then
        if terminal_open then
            vim.cmd('bd!')
            terminal_open = false
        end
        if nerdtree_open then
            vim.cmd('NERDTreeClose')
            nerdtree_open = false
        end
        if tagbar_open then
            vim.cmd('TagbarClose')
            tagbar_open = false
        end
    else
        vim.cmd(':split | resize 15 | term')
        terminal_open = true
        vim.cmd('NERDTree | vertical resize 20')
        nerdtree_open = true
        vim.cmd('Tagbar | vertical resize -15')
        tagbar_open = true
    end
end

-- Keybinding function for exitting
function exit_nvim()
    vim.cmd(':qall!')
end

-- Keymaps
vim.api.nvim_set_keymap('n', '<C-q>', ':q<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-q>', ':q<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-s>', ':w<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F2>', ':lua exit_nvim()<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<F2>', '<Esc>:lua exit_nvim()<CR>', { noremap = true })
vim.api.nvim_set_keymap('v', '<F2>', '<Esc>:lua exit_nvim()<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<F6>', ':Tagbar<CR>:vertical resize -15<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F7>', ':lua toggle_nerdtree()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F8>', ':lua toggle_terminal()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F9>', ':lua toggle_windows()<CR>', { noremap = true })

-- Refresh NERDTree
vim.api.nvim_set_keymap('n', '<C-r>', ':NERDTreeRefreshRoot<CR>', { noremap = true, silent = true })

-- Managing nvim splits
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize -3<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize +3<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Up>', ':resize +3<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize -3<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-m>', ':split<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-,>', ':vsplit<CR>', { noremap = true, silent = true })

-- Keybinding for jj to switch from insert mode to normal mode
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })

-- use <Tab> and <S-Tab> to navigate through popup menu
vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true, noremap = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', {expr = true, noremap = true})

-- use <Tab> and <S-Tab> to select completion items
vim.api.nvim_set_keymap('i', '<cr>', 'pumvisible() ? "\\<C-y>" : "\\<C-g>u\\<CR>"', {expr = true, noremap = true})
vim.api.nvim_set_keymap('i', '<C-Space>', 'complete(col("."))', {expr = true, noremap = true})

-- show signature help automatically
vim.api.nvim_command('autocmd CursorHoldI * silent! call CocActionAsync("showSignatureHelp")')

-- format on save
vim.api.nvim_command('autocmd BufWritePre *.js,*.ts,*.jsx,*.tsx,*.css,*.scss,*.json,*.md,*.markdown call CocActionAsync("format")')


