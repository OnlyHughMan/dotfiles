local keymap = vim.keymap

-- Reload config
keymap.set("n", "<leader>rc", ":source ~/.config/nvim/init.lua<CR>", { desc = "Reload config" })

-- Diff keymaps
keymap.set("n", "<leader>cc", ":diffput<CR>", { desc = "Put diff from current to other" })
keymap.set("n", "<leader>cj", ":diffget 1<CR>", { desc = "Get diff from left (local)" })
keymap.set("n", "<leader>cn", "]c", { desc = "Next diff hunk" })
keymap.set("n", "<leader>cp", "[c", { desc = "Previous diff hunk" })

-- Quickfix keymaps
keymap.set("n", "<leader>qo", ":copen<CR>", { desc = "Open quickfix list" })
keymap.set("n", "<leader>qf", ":cfirst<CR>", { desc = "First quickfix item" })
keymap.set("n", "<leader>qn", ":cnext<CR>", { desc = "Next quickfix item" })
keymap.set("n", "<leader>qp", ":cprev<CR>", { desc = "Previous quickfix item" })
keymap.set("n", "<leader>ql", ":clast<CR>", { desc = "Last quickfix item" })
keymap.set("n", "<leader>qc", ":cclose<CR>", { desc = "Close quickfix list" })

-- Vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", { desc = "Toggle maximize tab" })

-- Nvim-tree
keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
keymap.set("n", "<leader>er", ":NvimTreeFocus<CR>", { desc = "Focus file explorer" })
keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>", { desc = "Find file in explorer" })

-- Telescope
keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = "Find files" })
keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = "Grep project" })
keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = "Find buffers" })
keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = "Find help tags" })
keymap.set('n', '<leader>fk', require('telescope.builtin').keymaps, { desc = "Find keymaps" })
keymap.set('n', '<leader>fs', require('telescope.builtin').current_buffer_fuzzy_find, { desc = "Find in current buffer" })
keymap.set('n', '<leader>fo', require('telescope.builtin').lsp_document_symbols, { desc = "Find LSP symbols" })
keymap.set('n', '<leader>fi', require('telescope.builtin').lsp_incoming_calls, { desc = "Find LSP incoming calls" })
keymap.set('n', '<leader>fm', function() require('telescope.builtin').treesitter({symbols={'function', 'method'}}) end, { desc = "Find methods in class" })
keymap.set('n', '<leader>ft', function()
  local success, node = pcall(function() return require('nvim-tree.lib').get_node_at_cursor() end)
  if not success or not node then return end;
  require('telescope.builtin').live_grep({search_dirs = {node.absolute_path}})
end, { desc = "Grep in tree node" })

-- Git (fugitive + gitsigns -- see plugin files for hunk keymaps)
keymap.set("n", "<leader>gs", ":Git<CR>",        { desc = "Git status" })
keymap.set("n", "<leader>gc", ":Git commit<CR>",  { desc = "Git commit" })
keymap.set("n", "<leader>gp", ":Git push<CR>",    { desc = "Git push" })
keymap.set("n", "<leader>gl", ":Git log<CR>",     { desc = "Git log" })
keymap.set("n", "<leader>gd", ":Gdiffsplit<CR>",  { desc = "Git diff split" })
keymap.set("n", "<leader>gb", ":Git blame<CR>",   { desc = "Git blame" })

-- Harpoon
local harpoon = require("harpoon")
harpoon:setup()
keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon add file" })
keymap.set("n", "<leader>1", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon quick menu" })

-- keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
-- keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
-- keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
-- keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)

keymap.set("n", "<C-,>", function() harpoon:list():prev() end, { desc = "Harpoon previous" })
keymap.set("n", "<C-.>", function() harpoon:list():next() end, { desc = "Harpoon next" })


-- LSP
keymap.set('n', 'K',           '<cmd>lua vim.lsp.buf.hover()<CR>',              { desc = "LSP hover" })
keymap.set('n', 'gd',          '<cmd>lua vim.lsp.buf.definition()<CR>',         { desc = "LSP definition" })
keymap.set('n', 'gD',          '<cmd>lua vim.lsp.buf.declaration()<CR>',        { desc = "LSP declaration" })
keymap.set('n', 'gi',          '<cmd>lua vim.lsp.buf.implementation()<CR>',     { desc = "LSP implementation" })
keymap.set('n', 'gy',          '<cmd>lua vim.lsp.buf.type_definition()<CR>',    { desc = "LSP type definition" })
keymap.set('n', 'gr',          '<cmd>lua vim.lsp.buf.references()<CR>',         { desc = "LSP references" })
keymap.set('n', 'gK',          '<cmd>lua vim.lsp.buf.signature_help()<CR>',     { desc = "LSP signature help" })
keymap.set('n', '<leader>rr',  '<cmd>lua vim.lsp.buf.rename()<CR>',             { desc = "LSP rename" })
keymap.set('n', '<leader>cf',  '<cmd>lua vim.lsp.buf.format({async = true})<CR>', { desc = "LSP format" })
keymap.set('v', '<leader>cf',  '<cmd>lua vim.lsp.buf.format({async = true})<CR>', { desc = "LSP format" })
keymap.set('n', '<leader>ca',  '<cmd>lua vim.lsp.buf.code_action()<CR>',        { desc = "LSP code action" })
keymap.set('n', '<leader>d',   '<cmd>lua vim.diagnostic.open_float()<CR>',      { desc = "LSP diagnostic float" })
keymap.set('n', '[d',          '<cmd>lua vim.diagnostic.goto_prev()<CR>',       { desc = "LSP previous diagnostic" })
keymap.set('n', ']d',          '<cmd>lua vim.diagnostic.goto_next()<CR>',       { desc = "LSP next diagnostic" })
keymap.set('n', '<leader>tr',  '<cmd>lua vim.lsp.buf.document_symbol()<CR>',    { desc = "LSP document symbols" })
keymap.set('i', '<C-Space>',   '<cmd>lua vim.lsp.buf.completion()<CR>',         { desc = "LSP completion" })


