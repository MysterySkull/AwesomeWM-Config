local wibox = require ("wibox")
local awful = require ("awful")

battery_popup_data = {}

--battery_popup_data.brightness_slider = widget 
battery_popup_data.brightness_text = wibox.widget {
	text = "Luminosité : ",
	widget = wibox.widget.textbox
}

battery_popup_data.brightness_slider = wibox.widget {
	-- TODO
	widget = wibox.widget.slider
}

battery_popup_data.brightess_percent = wibox.widget {
	text = "100%",
	widget = wibox.widget.textbox
}

battery_popup_container = wibox.widget{
	{ layout = wibox.layout.fixed.horizontal,
	battery_popup_data.brightness_text },
	forced_width = 50,
	forced_height = 50,
	widget = wibox.container.background
}

battery_widegt_popup = awful.popup {
	widget = battery_popup_container,
	placement = awful.placement.top_left,
	visible = false,
	ontop = true
}
