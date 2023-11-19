local wibox = require("wibox")
local awful = require("awful")

require("first_rice/theme/theme")

separator_widget = wibox.widget{
	text = " | ",
	widget = wibox.widget.textbox
}

