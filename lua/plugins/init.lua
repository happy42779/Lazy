-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore

-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  -- change trouble config
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },

  -- disable trouble
  { "folke/trouble.nvim", enabled = false },

  -- add pyright to lspconfig
  -- {
  --   "neovim/nvim-lspconfig",
  --   --- @class PluginLspOpts
  --   opts = {
  --     --- @type lspconfig.options
  --     servers = {},
  --   },
  -- },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "yaml",
        "c",
        "cpp",
        "go",
        "rust",
      },
    },
  },

  -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
  -- would overwrite `ensure_installed` with the new value.
  -- If you'd rather extend the default config, use the code below instead:
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = function(_, opts)
  --     -- add tsx and treesitter
  --     vim.list_extend(opts.ensure_installed, {
  --       "typescript",
  --     })
  --   end,
  -- },

  -- formatter settings
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        markdown = {"deno"},
        python = {"autopep8"},
      }
    }
  },

  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "clang-format",
        "deno"
      },
    },
  },
  --------- more custom configurations -------------
  {"tpope/vim-repeat", event = "VeryLazy"},
  -- giving mini-surround a try
  -- {"kylechui/nvim-surround", evnet = "VeryLazy", version = "*", config = true},
  -- using the default one in lazyvim?
  -- {"numToStr/Comment.nvim", config = true},

  {
    "folke/noice.nvim",
    opts = function (_, opts)
      table.insert(opts.routes, {filter = {event = "notify",find = "No information available"}, opts = {skip = true},
      })
      opts.presets.command_palette = false
      opts.presets.inc_rename = false
      opts.presets.lsp_doc_border = true
    end,
  },
}
