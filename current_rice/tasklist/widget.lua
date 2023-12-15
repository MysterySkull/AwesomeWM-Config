local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

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
        buttons = create_tasklist_button(),
        widget_template = {
            {
                {
                    {
                        {
                            id = "clienticon",
                            widget = awful.widget.clienticon,
                        },
                        forced_height = 30-8,
                        top = 5,
                        widget = wibox.container.margin,
                    },
                    valign = "top",
                    halign = "center",
                    widget = wibox.container.place,
                },
                {
                    shape = function(cr, width, height)
                        gears.shape.circle(cr, width, height, 2)
                    end,
                    id = "clientcolor", 
                    forced_width = 15,
                    forced_height = 8,
                    widget = wibox.container.background,
                },
                layout = wibox.layout.fixed.vertical,
            },
            widget = wibox.container.background,
            create_callback = function(self, c, index, objects)
                --self:get_children_by_id("clienticon")[1].client = c
                if c.active then
                    self:get_children_by_id("clientcolor")[1].bg = color.text
                else
                    self:get_children_by_id("clientcolor")[1].bg = color.surface2
                end
            end,    
            update_callback = function(self, c, index, objects)
                --self:get_children_by_id("clienticon")[1].client = c
                if c.active then
                    self:get_children_by_id("clientcolor")[1].bg = color.text
                else
                    self:get_children_by_id("clientcolor")[1].bg = color.surface2
                end
            end,    
        },
    }
end
