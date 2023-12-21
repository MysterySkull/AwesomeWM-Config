local wibox = require("wibox")
local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

require(rice_name .."/taglist/widget")
require(rice_name .."/tasklist/widget")
require(rice_name .."/layout/widget")
require(rice_name .."/widget/battery")
require(rice_name .."/widget/sound")
require(rice_name .."/widget/internet") 

-- {{{ Wibar
-- Create a textclock widget
local mytextclock = wibox.widget
{ -- Middle widget
    {
        {
            halign = "center",
            widget = wibox.widget.textclock, 
        },
        shape = function(cr, width, height)
            gears.shape.rounded_rect(cr, width, height, 15)
        end,
        bg = color.crust,
        forced_width = 180,
        forced_height = 30,
        widget = wibox.container.background,
    },
    halign = "center",
    widget = wibox.container.place,
}

local function create_tag_task_widget(s)
    return wibox.widget{
        {
            {
                {
                    create_taglist_widget(s),
                    {
                        {
                            color = color.text,
                            forced_width = 10,
                            orientation = "vertical",
                            widget = wibox.widget.separator,
                        },
                        top = 5,
                        bottom = 5,
                        widget = wibox.container.margin,
                    },
                    {
                        {
                            widget = create_tasklist_widget(s),
                        },
                        width = 15,
                        strategy = "min",
                        widget = wibox.container.constraint,
                    },
                    layout = wibox.layout.fixed.horizontal,
                },
                top = 0, 
                bottom = 0,
                left = 7,
                right = 10,
                widget = wibox.container.margin,
            },
            shape = function(cr, width, height)
                gears.shape.rounded_rect(cr, width, height, 15)
            end,
            bg = color.crust,
            widget = wibox.container.background,
        }, 
        width = s.workarea.width / 2 - 110,
        widget = wibox.container.constraint,
    }
end

awful.screen.connect_for_each_screen(function(s)

    s.mypromptbox = awful.widget.prompt()
    -- Create the wibox
    s.mywibox = awful.wibar({ 
        position = "top", 
        screen = s,
        bg = "#ffffff00",
        height = 30,
        margins = {
            top = beautiful.useless_gap + beautiful.border_width,
            left = beautiful.useless_gap + beautiful.border_width,
            right = beautiful.useless_gap + beautiful.border_width,
            bottom = 0,
        }
    })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.stack,
        { -- Right and left widget
            layout = wibox.layout.align.horizontal,
            {
                create_tag_task_widget(s),
                s.mypromptbox,
                layout = wibox.layout.fixed.horizontal,
            },
            nil,
            {
                {
                    internet_widget_container,
                    wibox.widget.textbox(" "),
                    sound_widget_container,
                    --wibox.widget.textbox(awful.widget.watch(acpi, 1)),
                    wibox.widget.textbox(" "),
                    battery_widget_container,
                    {
                        top = 5,
                        bottom = 5,
                        widget = wibox.container.margin{
                            widget = wibox.widget.separator{
                                color = color.text,
                                forced_width = 10,
                                orientation = "vertical",
                            },
                        },
                    },
                    create_layout_widget(),
                    layout = wibox.layout.fixed.horizontal,
                },
                shape = function(cr, width, height)
                    gears.shape.rounded_rect(cr, width, height, 15)
                end,
                bg = color.crust,
                widget = wibox.container.background,
            },
        },
        mytextclock,
    }
end)
-- }}}
