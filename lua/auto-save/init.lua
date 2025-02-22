-- lua/auto-save/init.lua

local M = {}
local save_timer = require("auto-save.save_timer")

-- Default configuration (override via setup if desired)
M.default_config = {
    debounce_time = 5000,
}

function M.setup(opts)

    local config = vim.tbl_deep_extend("force", M.default_config, opts or {})
    save_timer.configure(config)

    -- If delay is 0, disable autosave
    if config.debounce_time > 0 then
        local group = vim.api.nvim_create_augroup("AutoSave", { clear = true })
        vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
          group = group,
          pattern = "*",
          callback = save_timer.reset,
        })
    end
end

return M

