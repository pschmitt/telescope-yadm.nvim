local M = {}

local conf = require("telescope.config").values
local finders = require "telescope.finders"
local pickers = require "telescope.pickers"

-- our picker function: yadm_files
M.yadm_files = function(opts)
  opts = opts or {}

  local yadm_home = io.popen("yadm rev-parse --show-toplevel"):read()
  local yadm_command = vim.F.if_nil(opts.yadm_command, { "yadm", "-C", yadm_home, "ls-files", "--full-name" })

  opts.entry_maker = function(entry)
    return {
      -- prepend home dir
      value = string.format("%s/%s", yadm_home, entry),
      -- skip the leading .config/ bit
      display = string.gsub(entry, ".config/", ""),
      ordinal = entry
    }
  end

  pickers.new(opts, {
    prompt_title = "yadm ls-files",
    finder = finders.new_oneshot_job(
      vim.tbl_flatten { yadm_command, },
      opts
    ),
    previewer = conf.file_previewer(opts),
    sorter = conf.file_sorter(opts),
  }):find()
end

-- to execute the function
-- M.yadm_files()

local _, builtin = pcall(require, "telescope.builtin")

M.git_or_yadm_files = function()
  local ok = pcall(builtin.git_files)

  if not ok then
    M.yadm_files()
  end
end

return M
