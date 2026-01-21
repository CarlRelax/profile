return {
  "chrisgrieser/nvim-recorder",
  opts = function()
    local Snacks = require("snacks")

    local recorder_notif ---@type snacks.notifier.Notification?

    local function update_notif(text)
      if recorder_notif then
        recorder_notif:update(text)
      end
    end

    return {
      lessNotifications = true,

      notification = {
        start = function(register)
          recorder_notif = Snacks.notifier.notify(("󰑋 Recording macro @%s\n󰌌 Keys: "):format(register), {
            title = "Recorder",
            timeout = false, -- ⭐ 不自动消失
            level = vim.log.levels.INFO,
          })
        end,

        -- 每次输入都会触发
        progress = function(keys, register)
          update_notif(("󰑋 Recording macro @%s\n󰌌 Keys: %s"):format(register, keys))
        end,

        stop = function(register)
          update_notif(("󰑊 Saved macro @%s"):format(register))

          -- 稍微延迟再关闭，更自然
          vim.defer_fn(function()
            if recorder_notif then
              recorder_notif:close()
              recorder_notif = nil
            end
          end, 800)
        end,
      },
    }
  end,
}
