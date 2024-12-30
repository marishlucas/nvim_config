return {
  "saghen/blink.cmp",
  lazy = false, -- lazy loading handled internally
  -- optional: provides snippets for the snippet source
  dependencies = "rafamadriz/friendly-snippets",
  opts = {
    keymap = {
      preset = "default",
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },

      -- Enter to accept the selection
      ["<CR>"] = { "accept", "fallback" },

      -- Disable the default Tab snippet navigation since we're using it for selection
      -- Move snippet navigation to different keys if needed
      -- For example, could use Ctrl-l and Ctrl-h for snippet navigation:
      ["<C-l>"] = { "snippet_forward", "fallback" },
      ["<C-h>"] = { "snippet_backward", "fallback" },
    },
  },
}
