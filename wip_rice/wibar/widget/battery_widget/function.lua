require("wip_rice/theme/theme")
local awful = require("awful")


-- Function for getting battery percent and state depending on acpi command given by awful watch
function set_battery_data(string_input)
	local separator_position = string.find(string_input, " ")
	local string_lengh = string.len(string_input)
	local percent = string.sub(string_input, separator_position+1)
	local status = string.sub(string_input, 1, separator_position-1)

	battery_data.percent = percent|0
	battery_data.status = status+0
end

-- Function for widget color and icon update idepending on battery state and percent
function set_battery_icon()

	if battery_data.status > 0 then
		if battery_data.percent > 95 then
			battery_widget_data.icon.text = icons.battery_full_charging
		elseif battery_data.percent > 85 then
			battery_widget_data.icon.text = icons.battery_90percent_charging
		elseif battery_data.percent > 75 then
			battery_widget_data.icon.text = icons.battery_80percent_charging 
		elseif battery_data.percent > 65 then
			battery_widget_data.icon.text = icons.battery_70percent_charging
		elseif battery_data.percent > 55 then
			battery_widget_data.icon.text = icons.battery_60percent_charging
		elseif battery_data.percent > 45 then
			battery_widget_data.icon.text = icons.battery_50percent_charging
		elseif battery_data.percent > 35 then
			battery_widget_data.icon.text = icons.battery_40percent_charging
		elseif battery_data.percent > 25 then
			battery_widget_data.icon.text = icons.battery_30percent_charging
		elseif battery_data.percent > 15 then
			battery_widget_data.icon.text = icons.battery_20percent_charging
		elseif battery_data.percent > 5 then
			battery_widget_data.icon.text = icons.battery_10percent_charging
		else
			battery_widget_data.icon.text = icons.battery_00percent_charging
		end
	elseif battery_data.status <= 0 then
		if battery_data.percent > 95 then
			battery_widget_data.icon.text = icons.battery_full_discharging
		elseif battery_data.percent > 85 then
			battery_widget_data.icon.text = icons.battery_90percent_discharging
		elseif battery_data.percent > 75 then
			battery_widget_data.icon.text = icons.battery_80percent_discharging 
		elseif battery_data.percent > 65 then
			battery_widget_data.icon.text = icons.battery_70percent_discharging
		elseif battery_data.percent > 55 then
			battery_widget_data.icon.text = icons.battery_60percent_discharging
		elseif battery_data.percent > 45 then
			battery_widget_data.icon.text = icons.battery_50percent_discharging
		elseif battery_data.percent > 35 then
			battery_widget_data.icon.text = icons.battery_40percent_discharging
		elseif battery_data.percent > 25 then
			battery_widget_data.icon.text = icons.battery_30percent_discharging
		elseif battery_data.percent > 15 then
			battery_widget_data.icon.text = icons.battery_20percent_discharging
		elseif battery_data.percent > 5 then
			battery_widget_data.icon.text = icons.battery_10percent_discharging
		else
			battery_widget_data.icon.text = icons.battery_00percent_discharging
		end
	end
end

function set_battery_color()	
	if battery_data.status > 0 then
		battery_widget_container.fg = color.blue
	elseif battery_data.percent > 15 then
		battery_widget_container.fg = color.text
	elseif battery_data.percent > 10 then
		battery_widget_container.fg = color.yellow
	else
		battery_widget_container.fg = color.red
	end
end
