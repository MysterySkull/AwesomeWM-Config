local wibox = require("wibox")
local gears = require("gears")

local FORCED_WIDTH = 30

-- DATA for battery widget --
battery_data = {}

battery_data.percent = 0
battery_data.status = -1

battery_widget_data = {}

battery_widget_data.icon  = wibox.widget{
        font = "JetBrains Mono Nerd Font 18",
        text = icons.battery_full_discharging,
        widget = wibox.widget.textbox,
        halign = "center",
        forced_width = FORCED_WIDTH,
}

battery_widget_container = wibox.widget{
    widget = wibox.container.background {
        widget = battery_widget_data.icon,
        fg = color.blue,
    }
}
