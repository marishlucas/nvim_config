local augroup = vim.api.nvim_create_augroup("blade_formatting", { clear = true })

-- Add blade filetype detection
vim.filetype.add({
  extension = {
    blade = "blade", -- This sets both blade and html filetypes
  },
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = augroup,
  pattern = "*.blade.php",
  callback = function(args)
    -- Set composite filetype
    vim.bo[args.buf].filetype = "blade"
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2

    -- Ensure PHP LSP features are still available
    local client = vim.lsp.get_active_clients({ name = "intelephense" })[1]
    if client then
      client.attach_buffer(args.buf)
    end
  end,
})
