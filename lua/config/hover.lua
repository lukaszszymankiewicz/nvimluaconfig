-- create hover in separate horizontal split
vim.lsp.handlers["textDocument/hover"] = function(_, result, ctx, config)
  config = config or {}
  config.focus_id = ctx.method
  if not (result and result.contents) then
    return
  end
  
  local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
  markdown_lines = vim.lsp.util.trim_empty_lines(markdown_lines)
  
  if vim.tbl_isempty(markdown_lines) then
    return
  end
  
  -- Create a new buffer
  local buf = vim.api.nvim_create_buf(false, true)
  
  -- Create a new split window and set it to use the new buffer
  vim.cmd("belowright split")
  local win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_buf(win, buf)
  
  -- Set buffer options
  vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')
  vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
  vim.api.nvim_buf_set_option(buf, 'filetype', 'markdown')
  
  -- Set window options
  vim.api.nvim_win_set_option(win, 'wrap', true)
  vim.api.nvim_win_set_option(win, 'conceallevel', 2)
  
  -- Insert the markdown content
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, markdown_lines)
  
  -- Set the window height
  local max_height = math.floor(vim.o.lines * 0.5)
  local content_height = #markdown_lines
  local win_height = math.min(max_height, content_height)
  vim.api.nvim_win_set_height(win, win_height)
  
  -- Add a keymap to close the split
  vim.api.nvim_buf_set_keymap(buf, 'n', 'q', ':q<CR>', {noremap = true, silent = true})
end

