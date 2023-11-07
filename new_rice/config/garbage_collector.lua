local gears = require("gears")

gears.timer {
	timeout = 30,
	autostart = true,
	callback = function() collectgarbage() end
}
