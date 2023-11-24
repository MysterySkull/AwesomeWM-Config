local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local taglist_buttons = gears.table.join(
    awful.button({ }, 1, function(t) 
        t:view_only()
    end),
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
    end),
    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)

local empty_tag = gears.surface.load_uncached(".config/awesome/wip_rice/theme/taglist_icons/empty_tag.svg")
local empty_tag_selected = gears.color.recolor_image(empty_tag, "#FFFFFF")
local empty_tag_not_selected = gears.color.recolor_image(empty_tag, "#777777")
local not_empty_tag = gears.surface.load_uncached(".config/awesome/wip_rice/theme/taglist_icons/not_empty_tag.svg")
local not_empty_tag_selected = gears.color.recolor_image(not_empty_tag, "#FFFFFF")
local not_empty_tag_not_selected = gears.color.recolor_image(not_empty_tag, "#777777")

local function init_taglist_icon(self, c3)
    if c3.selected then        
        if #c3:clients() == 0 then 
            self:get_children_by_id("icon_role")[1].image = empty_tag_selected
        else 
            self:get_children_by_id("icon_role")[1].image = not_empty_tag_selected 
        end
    else
        if #c3:clients() == 0 then 
            self:get_children_by_id("icon_role")[1].image = empty_tag_not_selected
        else 
            self:get_children_by_id("icon_role")[1].image = not_empty_tag_not_selected 
        end
    end
end

awful.screen.connect_for_each_screen(function(s) 
    s.taglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons,
        widget_template = {
            {
                id = "icon_role",
                widget = wibox.widget.imagebox,
            },
            top = 5,
            left = 2.5,
            right = 2.5,  
            bottom = 5,
            widget = wibox.container.margin,
            create_callback = function(self, c3, index, objects)
                init_taglist_icon(self, c3)
            end,
            update_callback = function(self, c3, index, objects)
                init_taglist_icon(self, c3)
            end,
        },
    }
end)
