return {
  {
    "nvimdev/lspsaga.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({
        -- UI customization
        ui = {
          code_action = " ",
          border = "rounded",
          code_action_lightbulb = {
            enable = false,
            sign = false,
            virtual_text = false,
          },
        },
        -- Customize other features
        hover = {
          max_width = 0.6,
          max_height = 0.6,
          open_link = "gx",
        },
        diagnostic = {
          max_width = 0.8,
          max_height = 0.6,
          show_code_action = true,
          extend_relatedInformation = true,
        },
        rename = {
          in_select = true,
          auto_save = true,
        },
      })

      -- Keymaps
      local keymap = vim.keymap.set
      local opts = { noremap = true, silent = true }

      -- LSP finder
      keymap("n", "gh", "<cmd>Lspsaga finder<CR>", opts)

      -- Code actions
      keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)

      -- Rename
      keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
      keymap("n", "<leader>rn", "<cmd>Lspsaga rename ++project<CR>", opts)

      -- Peek/Go to definition
      keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
      keymap("n", "gD", "<cmd>Lspsaga goto_definition<CR>", opts)

      -- Peek/Go to type definition
      keymap("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>", opts)
      keymap("n", "gT", "<cmd>Lspsaga goto_type_definition<CR>", opts)

      -- Show line diagnostics
      keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)

      -- Show cursor diagnostics
      keymap("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)

      -- Show buffer diagnostics
      keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>", opts)

      -- Diagnostic jump
      keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
      keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)

      -- Hover Doc
      keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)

      -- Outline
      keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts)

      -- Call hierarchy
      keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>", opts)
      keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>", opts)
    end,
  },
}
