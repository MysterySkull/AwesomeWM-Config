local wibox = require("wibox")
local awful = require("awful")

require("initial_rice/theme/theme")

-- Bluetooth icon and text box declaration
local bluetooth_widget = {}

local spacer = wibox.widget{
	text = " ",
	widget = wibox.widget.textbox
}

bluetooth_widget.text = wibox.widget{
	text = "test",
	widget = wibox.widget.textbox
}

bluetooth_widget.icon  = wibox.widget{
	font = "Font Awesome 6 Free-Solid 900 12",
	markup = "<span>" .. icons.bluetooth_off .. "</span>",
	widget = wibox.widget.textbox,
	forced_width = 12
}

bluetooth_widget_container = wibox.widget{
	{ layout = wibox.layout.fixed.horizontal,
	  spacer,
	  bluetooth_widget.icon,
	  spacer },
	widget = wibox.container.background
}

function change_bt_icon(status)	
	if status == "CONNECTED" then
		bluetooth_widget.icon.markup = "<span foreground='" .. color.blue .. "'>" .. icons.bluetooth_on .. "</span>"
	elseif status == "ON" then
		bluetooth_widget.icon.markup = "<span>" .. icons.bluetooth_on .. "</span>"
	elseif status == "OFF" then
		bluetooth_widget.icon.markup = "<span>" .. icons.bluetooth_off .. "</span>"
	else
		bluetooth_widget.icon.markup = "<span>" .. icons.bluetooth_off .. "</span>"
	end
end

awful.widget.watch(".config/awesome/initial_rice/wibar/widget/bluetooth/bluetooth_status.sh",1,
	function(widget, stdout)
		test = string.sub(stdout,1,string.len(stdout)-1)
		change_bt_icon(test)
	end)
