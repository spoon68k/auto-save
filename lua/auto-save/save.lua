-- lua/auto-save/save.lua

local M = {}
local timer = nil

function M.setup()
  local delay = tonumber(vim.env.NVIM_AUTOSAVE) or 0

  -- If delay is 0 or not set, disable autosave
  if delay > 0 then
    local group = vim.api.nvim_create_augroup("AutoSave", { clear = true })

    vim.notify("Auto saving enabled", vim.log.levels.INFO)

    vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
      group = group,
      pattern = "*",
      callback = function()

        -- Stop and close the previous timer if it exists
        if timer then
          timer:stop()
          timer:close()
          timer = nil
        end

        -- Create a new timer that will trigger after the specified delay
        timer = vim.loop.new_timer()
        timer:start(delay, 0, vim.schedule_wrap(function()
          local buf = vim.api.nvim_get_current_buf()
          -- Save only if the buffer is modifiable and has unsaved changes
          if vim.bo[buf].modifiable and vim.bo[buf].modified then
            vim.cmd("update")
          end
        end))
      end,
    })
  end
end

return M
