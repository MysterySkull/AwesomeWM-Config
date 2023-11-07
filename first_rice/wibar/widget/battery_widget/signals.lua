require ("theme/theme")

-- Widget link with mouse action
battery_widget_container:connect_signal('mouse::enter', function()
	battery_widget_container.bg = color.base1
	battery_widget_container.fg = color.darkerbase
	battery_widget_is_mouse_in_container = 1
end)

battery_widget_container:connect_signal('mouse::leave', function()
	battery_widget_container.bg = color.darkerbase
	set_battery_color()
	set_battery_icon()
	battery_widget_is_mouse_in_container = 0
end)

battery_widget_container:connect_signal('button::press', function()
	battery_widegt_popup.visible = not battery_widegt_popup.visible
end)


