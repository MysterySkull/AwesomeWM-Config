local wibox = require ("wibox")

mytextclock = wibox.widget.textclock("%d/%m/%y  %T",1)
mytextclock_container = wibox.container.background(mytextclock)
