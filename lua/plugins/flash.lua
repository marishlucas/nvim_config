return {
  "folke/flash.nvim",
  opts = {
    modes = {
      char = {
        enabled = false,
      },
    },
  },
  keys = {
    -- Unmap S and Shift-S
    { "s", mode = { "n", "x", "o" } },
    { "<S-s>", mode = { "n", "x", "o" } },
    -- Map T to Treesitter function selection
    {
      "t",
      mode = { "n", "x", "o" },
      function()
        require("flash").treesitter()
      end,
      desc = "Flash Treesitter",
    },
  },
}
