return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- disable a keymap
      keys[#keys + 1] = { "gd", false }
      keys[#keys + 1] = { "gr", false }
      keys[#keys + 1] = { "gD", false }
      keys[#keys + 1] = { "gi", false }
      keys[#keys + 1] = { "go", false }
      keys[#keys + 1] = { "[d", false }
      keys[#keys + 1] = { "]d", false }
      keys[#keys + 1] = { "K", false }
      keys[#keys + 1] = { "<leader>ca", false }
      keys[#keys + 1] = { "<leader>cr", false }
    end,
  },
}
