local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
-- nohlsearch
keymap('n', '<leader>h', '<CMD>nohlsearch<CR>', opts)
--Center searching
keymap('n', 'n', 'nzz', opts)
keymap('n', 'N', 'Nzz', opts)
keymap('n', '*', '*zz', opts)
keymap('n', '#', '#zz', opts)
keymap('n', 'g*', 'g*zz', opts)
keymap('n', 'g#', 'g#zz', opts)
-- Tabs
keymap('n', '<leader>ta', ':$tabnew<CR>', opts)
keymap('n', '<leader>tq', ':tabclose<CR>', opts)
keymap('n', '<leader>to', ':tabonly<CR>', opts)
keymap('n', '<leader>th', ':tabp<CR>', opts)
keymap('n', '<leader>tl', ':tabn<CR>', opts)
keymap('n', '<leader>tH', ':-tabmove<CR>', opts)
keymap('n', '<leader>tL', ':+tabmove<CR>', opts)
-- Splits
keymap('n', '<leader>s', '<C-w>', opts)
-- Moving a line in v-mode
keymap('v', 'J', ":m '>+1<CR>gv=gv", opts)
keymap('v', 'K', ":m '<-2<CR>gv=gv", opts)
-- Better paste
keymap('x', 'p', [["_dP]], opts)
-- Copy to system clipboard
keymap({ 'n', 'v' }, '<leader>y', '"+y', opts)
keymap('n', '<leader>Y', '"+Y', opts)
-- Delete without yanking
keymap({ 'n', 'v' }, '<leader>d', '"_d', opts)
-- X without yanking
keymap({ 'n', 'v' }, 'x', '"_x', opts)
-- Do not yank empty line
keymap('n', 'dd', function()
  if vim.api.nvim_get_current_line():find('^%s*$') then
    return '"_dd'
  end
  return 'dd'
end, { expr = true })
-- Stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)
-- Unbind S
keymap({ 'n', 'x' }, 's', '<Nop>')
