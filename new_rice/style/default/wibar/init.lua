local awful = require("awful")
local wibox = require("wibox")

mytaglist = awful.widget.taglist({
	screen = s,
	filter = awful.widget.taglist.filter.all,
	buttons = {
		awful.button({}, 1, function(t) end),
	},
	
})

mywibox = awful.wibar({
	position = "top",
	height = 30,
	visible = true,
	opacity = 0,
	
	
	widget = {
		layout = wibox.layout.fixed.horzional,
		--taglist,
	},

})

