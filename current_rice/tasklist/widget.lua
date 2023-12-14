local awful = require("awful")
local gears = require("gears")

function create_tasklist_button()
    return gears.table.join(
        awful.button({ }, 1, function (c)
            if c == client.focus then
                c.minimized = true
            else
                c:emit_signal(
                    "request::activate",
                    "tasklist",
                    {raise = true}
                )
            end
        end),
        awful.button({ }, 3, function()
            awful.menu.client_list({ theme = { width = 250 } })
        end),
        awful.button({ }, 4, function ()
            awful.client.focus.byidx(1)
        end),
        awful.button({ }, 5, function ()
            awful.client.focus.byidx(-1)
        end)
    )
end

function create_tasklist_widget(s)
    return awful.widget.tasklist{
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = create_tasklist_button()
    }
end
