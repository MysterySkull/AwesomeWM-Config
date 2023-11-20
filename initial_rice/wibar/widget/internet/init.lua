local wibox = require("wibox")
local awful = require("awful")

require("initial_rice/theme/theme")

-- Internet Wifi/Ethernet icon and textbox declaration
local internet_widget = {}

local spacer = wibox.widget{
	text = " ",
	widget = wibox.widget.textbox
}

internet_widget.icon = wibox.widget{
	font = "JetBrains Mono Nerd Font 14",
	text = icons.no_connection,
	--markup = "<span>" ..icons.no_connection .. "</span>",
	widget = wibox.widget.textbox,
	forced_width = 20,
}

internet_widget.textbox = wibox.widget {
	text = "ERROR",
	widget = wibox.widget.textbox
}

internet_widget_container = wibox.widget {
	{ layout = wibox.layout.fixed.horizontal,
	spacer,
	internet_widget.icon,
	spacer,
	internet_widget.textbox,
	spacer},
	widget = wibox.container.background
}

function get_connectivity_status(connectivity_string_input)
	local separator_index = string.find(connectivity_string_input," ")
	return string.sub(connectivity_string_input,1,separator_index-1)
end

function get_connectivity_name(connectivity_string_input)
	local separator_index = string.find(connectivity_string_input," ")
	return string.sub(connectivity_string_input,separator_index+1)
end

function set_connectivity_icon(connectivity_status_input)
	if connectivity_status_input == "ethernet" then
		internet_widget.icon.text = icons.ethernet
	elseif connectivity_status_input == "wifi" then
		internet_widget.icon.text = icons.wifi_strenght_4
	elseif connectivity_status_input == "no-wifi" then
		internet_widget.icon.markup = "<span foreground='" .. color.base01  .. "'>" ..icons.wifi_strenght_0 .. "</span>"
	elseif connectivity_status_input == "no-connection" then
		internet_widget.icon.text = icons.no_connection
	else
		internet_widget.icon.text = icons.no_connection
	end
end

awful.widget.watch(".config/awesome/initial_rice/wibar/widget/internet/internet.sh", 1,
	function(widget,stdout)
		local connectivity_status = get_connectivity_status(stdout)
		local connectivity_name = get_connectivity_name(stdout)
		
		set_connectivity_icon(connectivity_status)
		
		widget:set_text(connectivity_name)
	end,
	internet_widget.textbox)

