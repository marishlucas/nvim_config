return {
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  opts = {
    -- add options here
    -- or leave it empty to use the default settings
  },
  keys = {
    {
      "<leader>ip",
      function()
        return vim.bo.filetype == "AvanteInput" and require("avante.clipboard").paste_image()
          or require("img-clip").paste_image()
      end,
      desc = "clip: paste image",
    },
  },
}
