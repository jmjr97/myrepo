return {
  "folke/which-key.nvim",
  dependencies = 'echasnovski/mini.icons',
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  config = function()
    local wk = require("which-key")
    wk.add({
       -- Buffer
      { "<leader>b", group = "Buffers" },
      { "<leader>bb", desc = "Close Buffer" },
      { "<leader>bd", desc = "Close Buffer w/o Saving" },
      -- Clipboard
      { "<leader>y", desc = "Yank to Clipboard" },
      { "<leader>p", desc = "Paste from Clipboard" },
      -- Find
      { "<leader>f", group = "Find" },
      { "<leader>ff", desc = "File" },
      { "<leader>fa", desc = "File from ~" },
      { "<leader>fb", desc = "Buffers" },
      { "<leader>fc", desc = "Neovim Configs" },
      { "<leader>fg", desc = "Live Grep" },
      { "<leader>fh", desc = "Help Tags" },
      { "<leader>fm", desc = "Marks" },
      { "<leader>fr", desc = "Recent Files" },
      { "<leader>fs", desc = "Git Status" },
      -- LSP Handler
      { "<leader>l", group = "LSP Handler" },
      { "<leader>lr", desc = "Tele References" },
      { "<leader>ld", desc = "Tele Definition" },
      { "<leader>lD", desc = "Declaration" },
      { "<leader>la", desc = "Code Actions" },
      { "<leader>lR", desc = "Smart Rename" },
      { "<leader>lo", desc = "Diagnostics Open" },
      { "<leader>ln", desc = "Diagnostics Next" },
      { "<leader>lp", desc = "Diagnostics Previous" },
      { "<leader>lk", desc = "Hover Documentation" },
      -- Maximizer
      { "<leader>m", desc = "Toggle Max Split" },
      -- Noice
      { "<leader>d", desc = "Dismiss Notifications" },
      -- Obsidian
      { "<leader>o", group = "Obsidian" },
      { "<leader>oo", desc = "Open Note" },
      { "<leader>ot", desc = "Note ToC" },
      { "<leader>og", desc = "Grep Notes" },
      -- Run Code
      { "<leader>r", group = "Run Code" },
      { "<leader>rl", desc = "Lua" },
      { "<leader>rp", desc = "Python" },
      { "<leader>rr", desc = "Rust" },
      { "<leader>rs", desc = "Shell Script" },
      { "<leader]rg", group = "Go"},
      { "<leader>rgb", desc = "Go Build" },
      { "<leader>rgr", desc = "Go Run" },
      { "<leader>rgd", desc = "Go Run 'debug'" },
      { "<leader>rgm", desc = "Go Run 'mobile'" },
    })
  end,
}
