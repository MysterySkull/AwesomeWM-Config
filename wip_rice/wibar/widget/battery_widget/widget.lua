local wibox = require("wibox")
local gears = require("gears")

local FORCED_WIDTH = 50

require("wip_rice/theme/theme")

local spacer = wibox.widget {
    text = " ",
    widget = wibox.widget.textbox
}

battery_data = {}

battery_data.percent = 0
battery_data.status = -1

battery_widget_data = {}

battery_widget_data.icon  = wibox.widget{
    font = "JetBrains Mono Nerd Font 13",
    text = icons.battery_full_discharging,
    widget = wibox.widget.textbox,
    forced_width = 20
}
battery_widget_data.percent = wibox.widget{
    text = "ERROR",
    widget = wibox.widget.textbox
}

battery_widget_container = wibox.widget{
    {
        { layout = wibox.layout.align.horizontal,
            { layout = wibox.layout.fixed.horizontal,
                battery_widget_data.icon },
            nil,
            { layout = wibox.layout.fixed.horizontal,
                battery_widget_data.percent }
        },
        top = 5,
        bottom = 5, 
        left = 5,
        right = 5,
        widget = wibox.container.margin,
    },
    bg = "#000000",
    forced_width = FORCED_WIDTH+10,
    shape = function(cr, width, height)
        gears.shape.rounded_rect(cr, width, height, 7)
    end,
    widget = wibox.container.background
}
