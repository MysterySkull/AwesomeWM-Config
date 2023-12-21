local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

-- Create an imagebox widget which will contain an icon indicating which layout we're using.
-- We need one layoutbox per screen.
function create_layout_widget()
    local mylayoutbox = wibox.widget{
        {
            {
                {
                    widget = awful.widget.layoutbox(s)
                },
                top = 5,
                bottom = 5,
                left = 5,
                right = 5,
                widget = wibox.container.margin,
            },
            halign = "left",
            widget = wibox.container.place,
        },
        forced_width = 40,
        widget = wibox.container.background,
    }

    mylayoutbox:buttons(gears.table.join(
        awful.button({ }, 1, function () awful.layout.inc( 1) end),
        awful.button({ }, 3, function () awful.layout.inc(-1) end),
        awful.button({ }, 4, function () awful.layout.inc( 1) end),
        awful.button({ }, 5, function () awful.layout.inc(-1) end)))

    return mylayoutbox
end
