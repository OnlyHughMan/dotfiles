local keymap = vim.keymap


-- Diff keymaps

-- put diff from current to other during diff
keymap.set("n", "<leader>cc", ":diffput<CR>")
-- get diff from left (local) during merge
keymap.set("n", "<leader>cj", ":diffget 1<CR>")
 -- next diff hunk
keymap.set("n", "<leader>cn", "]c")
-- previous diff hunk
keymap.set("n", "<leader>cp", "[c")

-- Quickfix keymaps
-- open quickfix list
keymap.set("n", "<leader>qo", ":copen<CR>")
-- jump to first quickfix list item
keymap.set("n", "<leader>qf", ":cfirst<CR>")
-- jump to next quickfix list item
keymap.set("n", "<leader>qn", ":cnext<CR>")
-- jump to prev quickfix list item
keymap.set("n", "<leader>qp", ":cprev<CR>")
-- jump to last quickfix list item
keymap.set("n", "<leader>ql", ":clast<CR>")
-- close quickfix list
keymap.set("n", "<leader>qc", ":cclose<CR>")

-- Vim-maximizer
-- toggle maximize tab
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- Nvim-tree
-- toggle file explorer
keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>")
-- toggle focus to file explorer
keymap.set("n", "<leader>er", ":NvimTreeFocus<CR>")
-- find file in file explorer
keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>")

-- Telescope
-- fuzzy find files in project
keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, {})
-- grep file contents in project
keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, {})
-- fuzzy find open buffers
keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, {})
-- fuzzy find help tags
keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, {})
-- fuzzy find in current file buffer
keymap.set('n', '<leader>fs', require('telescope.builtin').current_buffer_fuzzy_find, {})
-- fuzzy find LSP/class symbols
keymap.set('n', '<leader>fo', require('telescope.builtin').lsp_document_symbols, {})
-- fuzzy find LSP/incoming calls
keymap.set('n', '<leader>fi', require('telescope.builtin').lsp_incoming_calls, {})
-- fuzzy find methods in current class
keymap.set('n', '<leader>fm', function() require('telescope.builtin').treesitter({symbols={'function', 'method'}}) end)
-- grep file contents in current nvim-tree node
keymap.set('n', '<leader>ft', function()
  local success, node = pcall(function() return require('nvim-tree.lib').get_node_at_cursor() end)
  if not success or not node then return end;
  require('telescope.builtin').live_grep({search_dirs = {node.absolute_path}})
end)

-- Git-blame
keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>") -- toggle git blame

-- Harpoon
local harpoon = require("harpoon")
-- REQUIRED
harpoon:setup()
-- REQUIRED
keymap.set("n", "<leader>a", function() harpoon:list():add() end)
keymap.set("n", "<leader>1", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

-- keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
-- keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
-- keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
-- keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
keymap.set("n", "<C-,>", function() harpoon:list():prev() end)
keymap.set("n", "<C-.>", function() harpoon:list():next() end)


-- LSP
keymap.set('n', '<leader>gg', '<cmd>lua vim.lsp.buf.hover()<CR>')
keymap.set('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
keymap.set('n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
keymap.set('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
keymap.set('n', '<leader>gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
keymap.set('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>')
keymap.set('n', '<leader>gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
keymap.set('n', '<leader>rr', '<cmd>lua vim.lsp.buf.rename()<CR>')
keymap.set('n', '<leader>gf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>')
keymap.set('v', '<leader>gf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>')
keymap.set('n', '<leader>ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
keymap.set('n', '<leader>gl', '<cmd>lua vim.diagnostic.open_float()<CR>')
keymap.set('n', '<leader>gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
keymap.set('n', '<leader>gn', '<cmd>lua vim.diagnostic.goto_next()<CR>')
keymap.set('n', '<leader>tr', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
keymap.set('i', '<C-Space>', '<cmd>lua vim.lsp.buf.completion()<CR>')


