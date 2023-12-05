local gears = require("gears")
local awful = require("awful")

function launcher_keys()
    local launcher_keys = gears.table.join(
        awful.key({ modkey }, "Return", function () awful.spawn(terminal) end,
            {description = "open a terminal", group = "launcher"}),
        awful.key({ modkey }, "r", function () awful.screen.focused().mypromptbox:run() end,
            {description = "run prompt", group = "launcher"}),
        awful.key({ modkey }, "b", function () awful.spawn(browser) end,
            {description = "open firefox", group = "launcher"})
    )
    return launcher_keys
end
