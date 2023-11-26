local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

--TODO add a terminal icon to show prompt cmd

local arch_icon = gears.surface.load_uncached(".config/awesome/wip_rice/theme/prompt_icons/archlinux-icon.svg")
local arch_icon = gears.color.recolor_image(arch_icon, "#FFFFFF")
local prompt_icon = gears.surface.load_uncached(".config/awesome/wip_rice/theme/prompt_icons/prompt_icon.svg")
local prompt_icon = gears.color.recolor_image(prompt_icon, "#FFFFFF")

--local is_extended;

awful.screen.connect_for_each_screen(function(s)
    s.mypromptbox = awful.widget.prompt {
        prompt = " : ",
        fg = "#FFFFFF",
    }

    promptbox_container = wibox.widget {
        {
            {
                {
                    wibox.widget.imagebox(arch_icon),
                    wibox.container.constraint{forced_width = 7.5},
                    wibox.widget.imagebox(prompt_icon),
                    s.mypromptbox,
                    layout = wibox.layout.fixed.horizontal,
                },
                top = 5,
                left = 2.5,
                right = 2.5,
                bottom = 5,
                widget = wibox.container.margin,
            },
            left = 7.5,
            right = 7.5,
            widget = wibox.container.margin,
        },
        shape = function (cr, width, height)
            gears.shape.rounded_rect(cr, width, height, 7)
        end, 
        bg = "#000000",
        widget = wibox.container.background,
    }
end)
