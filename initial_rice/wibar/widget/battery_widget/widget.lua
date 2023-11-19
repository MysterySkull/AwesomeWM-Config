local wibox = require("wibox")

local FORCED_WIDTH = 50

require("initial_rice/theme/theme")

local spacer = wibox.widget {
	text = " ",
	widget = wibox.widget.textbox }

battery_data = {}

battery_data.percent = 0
battery_data.status = -1

battery_widget_data = {}

battery_widget_data.icon  = wibox.widget{
	font = "JetBrains Mono Nerd Font 13",
	text = icons.battery_full_discharging,
	widget = wibox.widget.textbox,
	forced_width = 20}
battery_widget_data.percent = wibox.widget{
	text = "ERROR",
	widget = wibox.widget.textbox }

battery_widget_container = wibox.widget{
	{ layout = wibox.layout.align.horizontal,
		{ layout = wibox.layout.fixed.horizontal,
		battery_widget_data.icon },
		nil,
		{ layout = wibox.layout.fixed.horizontal,
		battery_widget_data.percent } 
	},
	forced_width = FORCED_WIDTH,
	widget = wibox.container.background 
}
