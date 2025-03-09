local modes = {
  ["n"] = "N",
  ["no"] = "N",
  ["v"] = "V",
  ["V"] = "VL",
  [""] = "VB",
  ["s"] = "S",
  ["S"] = "SL",
  [""] = "SB",
  ["i"] = "I",
  ["ic"] = "I",
  ["R"] = "R",
  ["Rv"] = "VR",
  ["c"] = "CMD",
  ["cv"] = "EX",
  ["ce"] = "EX",
  ["r"] = "PROMPT",
  ["rm"] = "MOAR",
  ["r?"] = "CONFIRM",
  ["!"] = "SH",
  ["t"] = "T",
}

local function mode()
  local current_mode = vim.api.nvim_get_mode().mode
  return string.format(" %s ", modes[current_mode]):upper()
end

local function filepath()
  local fpath = vim.fn.fnamemodify(vim.fn.expand "%", ":~:.:h")
  if fpath == "" or fpath == "." then
      return " "
  end

  return string.format(" %%<%s/", fpath)
end

local function filename()
  local fname = vim.fn.expand "%:t"
  if fname == "" then
      return ""
  end
  return fname .. " "
end

local function lsp()
  local count = {}
  local levels = {
    errors = "Error",
    warnings = "Warn",
    info = "Info",
    hints = "Hint",
  }

  for k, level in pairs(levels) do
    count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
  end

  local errors = ""
  local warnings = ""
  local hints = ""
  local info = ""

  if count["errors"] ~= 0 then
    errors = " %#LspDiagnosticsSignError#E " .. count["errors"]
  end
  if count["warnings"] ~= 0 then
    warnings = " %#LspDiagnosticsSignWarning#W " .. count["warnings"]
  end
  if count["hints"] ~= 0 then
    hints = " %#LspDiagnosticsSignHint#H " .. count["hints"]
  end
  if count["info"] ~= 0 then
    info = " %#LspDiagnosticsSignInformation#I " .. count["info"]
  end

  return errors .. warnings .. hints .. info .. "%#Normal#"
end

-- local function diag()
--  local diagnostics = vim.diagnostic.get_line_diagnostics()
-- 
--  vim.diagnostic.get(0, )
-- 
--  if not next(diagnostics) then return end
--  return diagnostics[1].message
-- nd

Statusline = {}

Statusline.active = function()
  return table.concat {
    "%#Statusline#",
    mode(),
    "%#Normal# ",
    filepath(),
    filename(),
    "%#Normal#",
    -- lsp(),
    -- diag(),
    "%=%#StatusLineExtra#",
  }
end

function Statusline.inactive()
  return " %F"
end

function Statusline.short()
  return "%#StatusLineNC#   NvimTree"
end


vim.api.nvim_exec([[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
  au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.Statusline.short()
  augroup END
]], false)
