local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox") 

local function margin_wrapper(w, margin)
    return wibox.widget{
        {
            widget = w,
        },
        margins = margin,
        widget = wibox.container.margin,
    }
end

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    awful.titlebar(c, {
        position = "left",
        size = 30,
    }) : setup {
        { -- Right
            margin_wrapper(awful.titlebar.widget.closebutton    (c), 7),
            margin_wrapper(awful.titlebar.widget.minimizebutton (c), 7),
            margin_wrapper(awful.titlebar.widget.maximizedbutton(c), 7),
            layout = wibox.layout.fixed.vertical()
        },
        { -- Middle
            { -- Title
                align  = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            direction = "east",
            widget = wibox.container.rotate,
        },
        { -- Left
            widget = margin_wrapper(awful.titlebar.widget.iconwidget(c), 5),
        },
        layout = wibox.layout.align.vertical
    }
end)
