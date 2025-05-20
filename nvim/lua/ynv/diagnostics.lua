vim.diagnostic.config({
    --virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = true,
    --virtual_lines = {
    --    only_current_line = false,
    --},
})

vim.keymap.set("n", "<leader>dd", function()
  vim.diagnostic.setqflist({ open = false })

  if vim.fn.getqflist({ winid = 0 }).winid ~= 0 then
    vim.cmd("cclose")
  else
    vim.cmd("copen")
  end
end, { desc = "Toggle Quickfix list with diagnostics" })
