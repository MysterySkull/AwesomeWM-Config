local wibox = require("wibox")
local gears = require("gears")

local FORCED_WIDTH = 50

-- DATA for battery widget --
battery_data = {}

battery_data.percent = 0
battery_data.status = -1

battery_widget_data = {}

battery_widget_data.icon  = wibox.widget{
    font = "JetBrains Mono Nerd Font 23",
    text = icons.battery_full_discharging,
    widget = wibox.widget.textbox,
}

battery_widget_container = wibox.widget{
        widget = battery_widget_data.icon
}
