local awful = require ("awful")

calendar_widget_popup = awful.widget.calendar_popup.month({margin = 2,
							   style_month = {
							   	border_width = 0,
								border_color = color.base0 }
						   	  })
