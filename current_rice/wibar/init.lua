local wibox = require("wibox")
local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

require(rice_name .."/taglist/widget")
require(rice_name .."/tasklist/widget")
require(rice_name .."/layout/widget")

-- {{{ Wibar
-- Create a textclock widget
local mytextclock = wibox.widget.textclock()

local function create_tag_task_widget(s)
    return wibox.widget{
        {
            {
                create_taglist_widget(s),
                create_tasklist_widget(s),
                layout = wibox.layout.fixed.horizontal,
            },
            shape = function(cr, width, height)
                gears.shape.rounded_rect(cr, width, height, 15)
            end,
            bg = color.crust,
            widget = wibox.container.background,
        },
        width = s.workarea.width / 2 - 100,
        widget = wibox.container.constraint,
    }
end

awful.screen.connect_for_each_screen(function(s)

    s.mypromptbox = awful.widget.prompt()
    -- Create the wibox
    s.mywibox = awful.wibar({ 
        position = "top", 
        screen = s,
        bg = "#ffffff00",
        height = 30,
        margins = {
            top = beautiful.useless_gap + beautiful.border_width,
            left = beautiful.useless_gap + beautiful.border_width,
            right = beautiful.useless_gap + beautiful.border_width,
            bottom = 0,
        }
    })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.stack,
        { -- Left widgets
            layout = wibox.layout.align.horizontal,
            {
                create_tag_task_widget(s),
                s.mypromptbox,
                layout = wibox.layout.fixed.horizontal,
            },
            wibox.container.background(),
            create_layout_widget(s),
        },
        {
            align = "center",
            widget = wibox.widget.textclock,
        },
    }
end)
-- }}}
