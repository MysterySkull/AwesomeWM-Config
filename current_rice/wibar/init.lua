local wibox = require("wibox")
local awful = require("awful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

require(rice_name .."/taglist/widget")
require(rice_name .."/tasklist/widget")
require(rice_name .."/layout/widget")

-- {{{ Wibar
-- Create a textclock widget
local mytextclock = wibox.widget.textclock()

awful.screen.connect_for_each_screen(function(s)

    s.mypromptbox = awful.widget.prompt()
    -- Create the wibox
    s.mywibox = awful.wibar({ 
        position = "top", 
        screen = s,
        bg = "#00000000",
        margins = {
            top = dpi(4),
            left = dpi(4),
            right = dpi(4),
            bottom = 0,
        }
    })

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
            create_layout_widget(s),
        },
    }
end)
-- }}}
