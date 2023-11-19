local wibox = require("wibox")

require ("initial_rice/theme/theme")

local widget_width = 55

brightness_widget_data = {}

brightness_widget_data.icon  = wibox.widget{
	font = "Font Awesome 6 Free-Solid 900 12",
	markup = "<span>" .. icons.brightness .. "</span>",
	widget = wibox.widget.textbox }
brightness_widget_data.percent = wibox.widget{
	text = "ERROR",
	widget = wibox.widget.textbox }

brightness_widget_container = wibox.widget{
	{ layout = wibox.layout.align.horizontal,
		{ layout = wibox.layout.fixed.horizontal,
		wibox.widget { text = " ", widget = wibox.widget.textbox },
		brightness_widget_data.icon 
		},
		nil,
		{ layout = wibox.layout.fixed.horizontal,
		brightness_widget_data.percent,
		wibox.widget { text = " ", widget = wibox.widget.textbox }
		}
	},
	forced_width = widget_width,
	widget = wibox.container.background 
}
