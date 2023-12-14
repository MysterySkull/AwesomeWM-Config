local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

-- Create a wibox for each screen and add it
function create_taglist_button()
    return gears.table.join(
        awful.button({ }, 1, function(t) t:view_only() end),
        awful.button({ modkey }, 1, function(t)
            if client.focus then
                client.focus:move_to_tag(t)
            end
        end),
        awful.button({ }, 3, awful.tag.viewtoggle),
        awful.button({ modkey }, 3, function(t)
            if client.focus then
                client.focus:toggle_tag(t)
            end
        end)
    )
end

function create_taglist_widget(s)

    local function update_taglist(self, c3)
        if c3.selected then
            self:get_children_by_id("tag_circle")[1].bg = color.text
        elseif #c3:clients() == 0 then
            self:get_children_by_id("tag_circle")[1].bg = color.base
        else
            self:get_children_by_id("tag_circle")[1].bg = color.surface2
        end
    end 

    return wibox.widget{
        bg = "#00000000",
        shape = function(cr, width, height)
            gears.shape.rounded_rect(cr, width, height, 15)
        end,
        widget = wibox.container.background{
            widget = awful.widget.taglist{
                screen  = s,
                filter  = awful.widget.taglist.filter.all,
                buttons = create_taglist_button(),
                widget_template = {
                    {
                        id = "tag_circle",
                        shape = function(cr, width, height)
                            gears.shape.circle(cr, width, height)
                        end,
                        bg = color.surface0,
                        forced_width = 17, 
                        widget = wibox.container.background,
                    },
                    top = 7,
                    bottom = 7,
                    left = 3.5, 
                    right = 3.5,
                    widget = wibox.container.margin,
                    create_callback = function(self, c3, index, objects)
                        update_taglist(self, c3)
                    end,
                    update_callback = function(self, c3, index, objects)
                        update_taglist(self, c3)
                    end,
                },
            },
        }
    }
end
