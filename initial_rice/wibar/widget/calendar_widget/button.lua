local awful = require ("awful")
local gears = require ("gears")

function calendar_button_pressed_action ()
end

function calendar_button_released_action ()
	calendar_widget_popup.screen = awful.screen.focused()
	calendar_widget_popup.position = "tr"
	calendar_widget_popup:toggle()
end

calendar_button = awful.button({ }, 1, function() calendar_button_pressed_action() end,
					function() calendar_button_released_action() end)

mytextclock_container:buttons(gears.table.join(calendar_button))
