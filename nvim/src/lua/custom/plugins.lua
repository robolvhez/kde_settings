local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- VimTeX: A VIM plugin for LaTeX compilation and visualization
  {
    "lervag/vimtex",
    ft = "tex",
    config = function()
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_compiler_latexmk = {
        out_dir = 'tmp'
      }
    end,
  },

  -- NVim-R: Using VIM as an R IDE
  {
    "jalvesaq/Nvim-R",
    lazy = false,
    config = function()


      -- Use visidata to explore tables
      -- vim.api.nvim_set_var('R_csv_app', 'terminal:vd')
      -- vim.api.nvim_set_var('R_df_viewer', "rvisidata::vd(%s)" )

      -- Press -- to have Nvim-R insert the assignment operator: <-
      vim.api.nvim_set_var('R_assign_map', '__')

      -- Set a minimum source editor width
      vim.api.nvim_set_var('R_objbr_place', 'script,right')

      -- Don't expand a dataframe to show columns by default
      vim.api.nvim_set_var('R_objbr_opendf', 0)

      -- Set a minimum source editor width
      vim.api.nvim_set_var('R_objbr_auto_start', 1)

      -- Set a minimum source editor width
      vim.api.nvim_set_var('R_min_editor_width', 80)

      -- Make sure the console is at the bottom by making it really wide
      vim.api.nvim_set_var('R_rconsole_width', 1000)

      -- Show arguments for functions during omnicompletion
      vim.api.nvim_set_var('R_show_args', 1)

      -- Show arguments for functions during omnicompletion
      vim.api.nvim_set_var('R_nvimpager', 'tabnew')
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  -- Colorizer: Add colors to HEX codes
  {
    "NvChad/nvim-colorizer.lua",
    enabled = true
  },

  -- To make a plugin not be loaded
  --
  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
