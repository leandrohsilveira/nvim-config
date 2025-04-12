local builtin = require('telescope.builtin')
local telescope = require("telescope")

telescope.load_extension("ui-select")
telescope.load_extension('fzf')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = 'Telescope previously opened files' })
vim.keymap.set('n', '<leader>fc', builtin.colorscheme, { desc = 'Telescope search colorschemes' })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Telescope search keymaps' })

vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files' })

vim.keymap.set('n', '<leader>ls', builtin.lsp_document_symbols, { desc = 'Telescope search colorschemes' })

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function()
        vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = 'Go to LSP definitions using telescope' })
        vim.keymap.set('n', 'gi', builtin.lsp_implementations, { desc = 'Go to LSP implementations using telescope' })
    end,
})
