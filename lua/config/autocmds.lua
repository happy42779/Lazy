-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- set different shiftwidth for different filetypes
vim.api.nvim_create_augroup("FileTypeShiftWidth", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = "FileTypeShiftWidth",
  pattern = { "cpp", "c", "go", "python", "rust" },
  callback = function()
    vim.opt_local.shiftwidth = 4
  end,
})
