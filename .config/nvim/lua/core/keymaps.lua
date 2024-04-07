-- local keymap = require("welqd.plugins.langmapper").keymap
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
-- Leader Space
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
-- nohlsearch
keymap("n", "<leader>h", "<CMD>nohlsearch<CR>", opts)
--Center searching
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)
-- Tabs
keymap("n", "<leader>ta", ":$tabnew<CR>", opts)
keymap("n", "<leader>tq", ":tabclose<CR>", opts)
keymap("n", "<leader>to", ":tabonly<CR>", opts)
keymap("n", "<leader>th", ":tabp<CR>", opts)
keymap("n", "<leader>tl", ":tabn<CR>", opts)
keymap("n", "<leader>tH", ":-tabmove<CR>", opts)
keymap("n", "<leader>tL", ":+tabmove<CR>", opts)
-- Buffers
keymap("n", "<leader>bl", "<CMD>bnext<CR>", opts)
keymap("n", "<leader>bh", "<CMD>prev<CR>", opts)
keymap("n", "<leader>ba", ":badd ", opts)
keymap("n", "Q", "<CMD>bd<CR>", opts)
keymap("n", "<leader>Q", "<CMD>bd!<CR>", opts)
-- Moving a line in v-mode
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
-- Better paste
keymap("x", "p", [["_dP]], opts)
-- Copy to system clipboard
keymap({ "n", "v" }, "<leader>y", '"+y', opts)
keymap("n", "<leader>Y", '"+Y', opts)
-- Delete without yanking
keymap({ "n", "v" }, "<leader>d", '"_d', opts)
-- Do not yank empty line
vim.keymap.set("n", "dd", function()
	if vim.api.nvim_get_current_line():find("^%s*$") then
		return '"_dd'
	end
	return "dd"
end, { expr = true })
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
