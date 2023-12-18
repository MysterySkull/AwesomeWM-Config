local awful = require ("awful")

require ("current_rice/widget/battery/function")

-- Bash script wwatch for widget update
awful.widget.watch(".config/awesome/current_rice/widget/battery/script/battery_status.sh", 1,
	function(widget,stdout)
		set_battery_data(stdout)

		set_battery_icon()
		set_battery_color()

		widget:set_text(stdout)
	end,
	battery_widget_container)
