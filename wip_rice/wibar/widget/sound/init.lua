local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")

require("first_rice/theme/theme")

-- Battery icon and text box declaration
local sound_widget = {}

local spacer = wibox.widget{
	text = " ",
	widget = wibox.widget.textbox
}

sound_widget.icon  = wibox.widget{
	font = "Font Awesome 6 Free-Solid 900 12",
	markup = "<span>" .. icons.volume_high .. "</span>",
	widget = wibox.widget.textbox,
	forced_width = 12
}
sound_widget.percent = wibox.widget{
	text = "ERROR",
	widget = wibox.widget.textbox
}

sound_widget_container = wibox.widget{
	layout = wibox.layout.fixed.horizontal,
	spacer,
	{ layout = wibox.layout.align.horizontal,
	  sound_widget.icon,
	  nil,
	  sound_widget.percent,
  	  forced_width = 45 },
	spacer,
	widget = wibox.container.background
}

sound_widget_container:buttons(gears.table.join(
	awful.button({ }, 1, function () awful.spawn("pulsemixer --toggle-mute") end),
	awful.button({ }, 4, function () awful.spawn("pulsemixer --change-volume +1") end),
	awful.button({ }, 5, function () awful.spawn("pulsemixer --change-volume -1") end))
)


function change_icon(status, percent)
	if status == "1" then
		sound_widget.icon.markup = "<span>" .. icons.volume_mute .. "</span>"
	else
		if percent > 66  then
			sound_widget.icon.markup = "<span>" .. icons.volume_high .. "</span>"
		elseif percent > 33  then
			sound_widget.icon.markup = "<span>" .. icons.volume_low .. "</span>"
		else 
			sound_widget.icon.markup = "<span>" .. icons.volume_off .. "</span>"
		end
	end
end

awful.widget.watch(".config/awesome/first_rice/wibar/widget/sound/sound_status.sh",0.05,
	function(widget, stdout)
		--local space_position = 
		local percent = string.sub(stdout,4)
		local mute_status = string.sub(stdout,0,1)
		
		percent = percent+0

		change_icon(mute_status, percent)
		
		percent = percent|0
		
		--widget:set_text(mute_status)
		widget:set_text(percent .. "%")
	end,
	sound_widget.percent)




