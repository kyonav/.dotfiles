vim.diagnostic.config({
  virtual_text = true,         -- Show diagnostics as virtual text
  signs = true,                -- Show signs in the sign column
  underline = true,            -- Underline diagnostics in the buffer
  update_in_insert = false,    -- Update diagnostics while in insert mode
  severity_sort = true,       -- Sort diagnostics by severity
  float = {
    show_header = true,        -- Show header in floating window
    source = 'if_many',        -- 'always', 'if_many', or 'never'
    border = 'rounded',        -- Border style: 'single', 'double', 'rounded', etc.
    focusable = true,
    scope = 'line',            -- 'line', 'cursor', or 'buffer'
    format = nil,              -- Custom function to format message
  },
})
