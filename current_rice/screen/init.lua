local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")

require(rice_name .."/screen/taglist")
require(rice_name .."/screen/tasklist")

--- Call function to set wallpaper ---
require(rice_name .."/screen/set_wallpaper")

-- {{{ Wibar
-- Create a textclock widget
local mytextclock = wibox.widget.textclock()


awful.screen.connect_for_each_screen(function(s)
    -- Each screen has its own tag table.
    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
        awful.button({ }, 1, function () awful.layout.inc( 1) end),
        awful.button({ }, 3, function () awful.layout.inc(-1) end),
        awful.button({ }, 4, function () awful.layout.inc( 1) end),
        awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            create_taglist_widget(s),
            s.mypromptbox,
        },
        create_tasklist_widget(s), -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            mytextclock,
            s.mylayoutbox,
        },
    }
end)
-- }}}
