local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

require("wip_rice/wibar/widget/launcher")
require("wip_rice/wibar/widget/taglist")
require("wip_rice/wibar/widget/prompt")

-- Call for each widget created in the dedicated folder
require("wip_rice/wibar/widget")

-- Create a wibox for each screen and add it


local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

--mytaglist_test = buildTaskList()

local tasklist_buttons = gears.table.join(
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
-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = wibox.widget {
        {
            {
                screen = s,
                widget = awful.widget.layoutbox,
            },
            top = 2.5,
            left = 5,
            right = 5,
            bottom = 2.5,
            widget = wibox.container.margin,
        },
        bg = "#000000",
        fg = "#FFFFFF",
        shape = function(cr, width, height)
            gears.shape.rounded_rect(cr, width, height, 7)
        end,
        widget = wibox.container.background,
    }
    s.mylayoutbox:buttons(gears.table.join(
        awful.button({ }, 1, function () awful.layout.inc( 1) end)))

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons
    }

    -- Create the wibox
    s.mywibox = awful.wibar({ 
        position = "top", 
        screen = s,
        bg = "#00000000",
        height = 25,
        margins = {
            top = 5,
            left = 5,
            right = 5,
            bottom = 0,
        },
    })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            arch_launcher, 
            separator_widget_wibar,
            s.taglist,
            separator_widget_wibar,
            promptbox_container,
            separator_widget_wibar,
        },
        {
            layout = wibox.layout.fixed.horizontal,
            mytextclock_container,
        },
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            sound_widget_container,
            bluetooth_widget_container,
            internet_widget_container,
            --hardware_usage_widget_container,
            battery_widget_container,
            separator_widget_wibar,
            s.mylayoutbox,
        },
    }
end)
-- }}}
