local wibox = require("wibox")
local awful = require("awful")

require("wip_rice/theme/theme")

separator_widget_taskbar = wibox.widget{
	text = " | ",
	widget = wibox.widget.textbox
}

separator_widget_wibar = wibox.widget{
    forced_width = 10, 
    wigdet = wibox.container.constraint, 
}



