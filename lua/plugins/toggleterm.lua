return {
  "akinsho/toggleterm.nvim",
  version = "*",
  lazy = false,
  keys = {
    {
      "<leader>lg",
      function()
        local terminal = require("toggleterm.terminal").Terminal
        local lazygit = terminal:new({ cmd = "lazygit", direction = "float", hidden = true })
        lazygit:toggle()
      end,
      desc = "Toggle lazygit",
      noremap = true,
      silent = true,
    },
  },
  opts = function(_, opts)
    opts.direction = "float"
    opts.open_mapping = [[<C-\>]]
    function _G.set_terminal_keymaps()
      local options = { buffer = 0 }
      vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], options)
      vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], options)
      vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], options)
      vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], options)
    end

    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
  end,
}
