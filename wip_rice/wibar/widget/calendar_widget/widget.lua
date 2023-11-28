local wibox = require ("wibox")
local gears = require ("gears")

mytextclock = wibox.widget.textclock("%d/%m/%y  %T",1)
mytextclock_container = wibox.widget {
    {
        {
            {
                widget = mytextclock
            },
            left = 10,
            right = 10,
            widget = wibox.container.margin,
        },
        bg = "#000000",
        shape = function(cr, width, height)
            gears.shape.rounded_rect(cr, width, height, 7)
        end,
        widget = wibox.container.background,
    },
    fill_horizontal = true,
    content_fill_vertical = true,
    widget = wibox.container.place,
}
