local has_telescope, telescope = pcall(require, 'telescope')
local main = require('telescope._extensions.yadm.main')

if not has_telescope then
  error('This plugins requires nvim-telescope/telescope.nvim')
end

return telescope.register_extension {
  exports = {
    git_or_yadm_files = main.git_or_yadm_files,
    git_or_files = main.git_or_files
  }
}
