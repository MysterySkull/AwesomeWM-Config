local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup.widget")

function tag_keys()
    
    local tag_keys = {}

    for i = 1, 9 do
        tag_keys = gears.table.join(
            tag_keys,
            -- View tag only.
            awful.key({ modkey }, "#" .. i + 9,
                function ()
                    local screen = awful.screen.focused()
                    local tag = screen.tags[i]
                    if tag then
                        tag:view_only()
                    end
                end,
            {description = "view tag #1..9", group = "tag"}),
            -- Toggle tag display.
            awful.key({ modkey, "Control" }, "#" .. i + 9,
                function ()
                    local screen = awful.screen.focused()
                    local tag = screen.tags[i]
                    if tag then
                        awful.tag.viewtoggle(tag)
                    end
                end,
            {description = "toggle tag #1..9", group = "tag"}),
            -- Move client to tag.
            awful.key({ modkey, "Shift" }, "#" .. i + 9,
                function ()
                    if client.focus then
                        local tag = client.focus.screen.tags[i]
                        if tag then
                            client.focus:move_to_tag(tag)
                        end
                    end
                end,
            {description = "move focused client to tag #1..9", group = "tag"}),
            -- Toggle tag on focused client.
            awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                function ()
                    if client.focus then
                        local tag = client.focus.screen.tags[i]
                        if tag then
                            client.focus:toggle_tag(tag)
                        end
                    end
                end,
            {description = "toggle focused client on tag #1..9", group = "tag"})
        )
    end

    return tag_keys
end
