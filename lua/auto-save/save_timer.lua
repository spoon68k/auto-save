-- lua/auto-save/save_timer.lua

local M = {}
local timer = nil

M.config = {
    debounce_time = 5000,
}

---------------------------
-- Public API
---------------------------

-- Allows the parent module to configure options.
function M.configure(config)
    M.config = vim.tbl_deep_extend("force", M.config, config or {})
end

function M.reset()

    -- Stop and close the previous timer if it exists
    if timer then
        timer:stop()
        timer:close()
        timer = nil
    end

    -- Create a new timer that will trigger after the specified delay
    timer = vim.loop.new_timer()
    timer:start(M.config.debounce_time, 0, vim.schedule_wrap(function()
        local buf = vim.api.nvim_get_current_buf()

        -- Skip autosave if the buffer is not a "real" file
        if vim.bo[buf].buftype ~= "" then
            return
        end

        -- Save only if the buffer is modifiable and has unsaved changes
        if vim.bo[buf].modifiable and vim.bo[buf].modified then
            vim.cmd("update")
        end
    end))
end

return M
