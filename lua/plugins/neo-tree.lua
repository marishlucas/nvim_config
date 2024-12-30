return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          "node_modules",
          ".git",
        },
        always_show_by_pattern = { -- uses glob style patterns
          ".env*",
        },
      },

      follow_current_file = {
        enabled = true,
        leave_dirs_open = true,
      },
      group_empty_dirs = false,
    },
    window = {
      position = "right",
      width = 40,
    },
  },
}
