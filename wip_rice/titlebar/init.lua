local awful = require("awful")
local wibox = require("wibox")

client.connect_signal("request::titlebars", function(c)
	-- Declaration of icon
	local titlebar_icon = wibox.widget{
		layout = wibox.layout.fixed.horizontal,
		{ 
			awful.titlebar.widget.iconwidget(c)
		},
		widget = wibox.container.margin
	}


	-- setup of title bar
	awful.titlebar(c, {size = 20}):setup {
		
		--Left Icon  
		{
			awful.titlebar.widget.iconwidget(c),
			top = 3,
			left = 4,
			bottom = 2,
			layout = wibox.container.margin
		},
		
		--center title
		{	{ align = 'center', 
			  widget = awful.titlebar.widget.titlewidget(c) },
		layout = wibox.layout.flex.horizontal },
		
		--right button (3 colored ones)
		{ awful.titlebar.widget.closebutton(c),
		  awful.titlebar.widget.minimizebutton(c),
		  awful.titlebar.widget.maximizedbutton(c),
		  layout = wibox.layout.fixed.horizontal },
		
		
		
		--layout is aligned
		layout = wibox.layout.align.horizontal
	
	}

end)


