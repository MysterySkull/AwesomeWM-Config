local awful = require ("awful")

require ("wip_rice/wibar/widget/battery_widget/function")

-- Bash script wwatch for widget update
awful.widget.watch(".config/awesome/wip_rice/wibar/widget/battery_widget/script/battery_status.sh", 1,
	function(widget,stdout)
		set_battery_data(stdout)

		set_battery_icon()
		set_battery_color()

		widget:set_text(battery_data.percent .. "%")
	end,
	battery_widget_data.percent)
