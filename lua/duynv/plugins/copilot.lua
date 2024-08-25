local plugins = {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  opts = {
    suggestion = { enabled = true },
    panel = { enabled = true },
    filetypes = {
      markdown = true,
      help = true,
    },
  },
  {
    "github/copilot.vim",
    lazy = true,

    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    -- enabled = false,
  },
  {
    "zbirenbaum/copilot.lua",
    enabled = false,
    name = "copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    opts = {
      -- to map copilot to the cmp only, change these config to false
      suggestion = { enabled = true, auto_trigger = true, debounce = 0 },
      panel = { enabled = true, auto_refresh = true },
      filetypes = {
        cfg = false,
      },
    },
  },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = { "copilot.lua", "nvim-cmp", "zbirenbaum/copilot.lua" },
    enabled = false,
    event = "InsertEnter",
    -- event = "InsertEnter",
    opts = {},
    config = function(_, opts)
      -- local copilot_cmp = require "copilot_cmp"
      require("copilot_cmp").setup({
        formatters = {
          insert_text = require("copilot_cmp.format").remove_existing,
        },
      })
      -- attach cmp source whenever copilot attaches
    end,
  },
}

return plugins
