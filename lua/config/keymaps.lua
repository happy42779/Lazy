-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

local function map(mode, lhs, rhs, opts)
  -- local options = { noremap = true, silent = true }
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("i", "jk", "<Esc>", {})

-- opens lazy
map("n", "<leader>lz", "<cmd>Lazy<CR>", { desc = "Toggle Lazy" })
-- split screen horizontally
map("n", "<LEADER>|", ":vsplit ", { desc = "Vertical split" })
map("n", "<LEADER>_", ":split ", { desc = "Horizontal split" })
-- really helpful when editing in a '', (), [] etc...
map("i", "<A-a>", "<End>", { desc = "Fast move to end of line in insert mode" })
-- Fast moving between windows
map("n", "<C-h>", "<C-w>h", { desc = "Move to the left window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to the right window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to the below window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to the above window" })
-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cR>", { desc = "Decrease window width" })

map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })

-- Samples learnt from ThePrimeagen
map("n", "<A-j>", "<cmd>m .+1<CR>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<CR>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<CR>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<CR>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- merge lines without moving the cursor
map("n", "J", "mzJ`z", { desc = "Merge lines" })
-- scroll but with cursor not moved
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
map("n", "<C-u>", "<C-U>zz", { desc = "Merge up" })
map("n", "n", "nzzzv", { desc = "Move to next search" })
map("n", "N", "nzzzv", { desc = "Move to next search" })

-- paste over selected items and keep the copied content
map("n", "<leader>ax", "<cmd>!chmod +x %<CR>", { desc = "Add x mask" })
map("x", "<leader>p", '"_dP', { desc = "paste replace and keep current" })
map("n", "<leader>p", '"+p', { desc = "paste replace and keep current" })

map("n", "<leader>y", '"+y', { desc = "copy to system clipboard" })
map("v", "<leader>y", '"+y', { desc = "copy to system clipboard" })
map("n", "<leader>Y", '"+Y', { desc = "copy to system clipboard" })

map("v", "<leader>d", '"_d', { desc = "delete and copy to system clipboard" })
map("n", "<leader>d", '"_d', { desc = "delete and copy to system clipboard" })

-- fast replace
map("n", "<leader>rs", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- close tabs
map("n", "<A-w>", "<cmd>bdelete<CR>", { desc = "Close current buffer" })

map("n", "  ", "<cmd>nohlsearch<CR>", { desc = "Clear highlight" })

-- merge lines without moving the cursor
-- map("n", "J", "mzJ`z", { desc = "Merge lines" })
-- -- scroll but with cursor not moved
-- map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
-- map("n", "<C-u>", "<C-U>zz", { desc = "Merge up" })
-- map("n", "n", "nzzzv", { desc = "Move to next search" })
-- map("n", "N", "nzzzv", { desc = "Move to next search" })

-- referenced from craftzdog
-- move <C-a> increment to +, <C-x> decrement to -
map("n", "+", "<C-a>", { desc = "Increment" })
map("n", "-", "<C-x>", { desc = "Decrement" })
map("n", "<C-a>", "gg<S-v>G", { desc = "Fast Select" })

map("n", "dw", "viwx", { desc = "Delete a word backward" })
map("n", "<leader>dw", 'viw"_x', { desc = "Delete a whole word, without registering" })
map("n", "cw", 'viw"_c', { desc = "Delete and edit a whole word" })
map("n", "<A-e>", ":tabedit ", {})

-- change formatting keymap
local Util = require("lazyvim.util")
local smap = Util.safe_keymap_set
smap({ "n", "v" }, "<space>f", function()
  Util.format({ force = true })
end, { desc = "Format" })

-- Toggle on/off inlay hint
smap("n", "<leader>ih", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hint on/off" })
