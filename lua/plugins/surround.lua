return {
  'echasnovski/mini.surround',
  keys = function(_, keys)
    -- Populate the keys based on the user's options
    local mappings = {
      { 'sa', desc = 'Add Surrounding', mode = { 'n', 'v' } },
      { 'sd', desc = 'Delete Surrounding' },
      { 'sr', desc = 'Replace Surrounding' },
    }
    mappings = vim.tbl_filter(function(m)
      return m[1] and #m[1] > 0
    end, mappings)
    return vim.list_extend(mappings, keys)
  end,
  opts = {},
}
