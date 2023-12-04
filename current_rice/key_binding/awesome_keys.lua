local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")

function awesome_keys()
    local awesome_keys = gears.table.join(
        awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
            {description="show help", group="awesome"}),
        awful.key({ modkey, "Control" }, "r", awesome.restart,
            {description = "reload awesome", group = "awesome"}),
        awful.key({ modkey, "Shift"   }, "q", awesome.quit,
            {description = "quit awesome", group = "awesome"})
    )
    return awesome_keys
end
