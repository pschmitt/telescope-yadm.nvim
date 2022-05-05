local has_telescope, telescope = pcall(require, 'telescope')
local main = require('telescope._extensions.yadm.main')

if not has_telescope then
  error('This plugins requires nvim-telescope/telescope.nvim')
end

return telescope.register_extension {
  exports = {
    yadm = main.yadm_files,
    -- FIXME The below exports don't seem to have any effect
    -- yadm_files = main.yadm_files,
    -- git_or_yadm_files = main.git_or_yadm_files
  }
}
