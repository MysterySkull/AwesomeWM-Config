local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears") 


local arch_icon = gears.surface.load_uncached(".config/awesome/wip_rice/theme/prompt_icons/archlinux-icon.svg")
local arch_icon = gears.color.recolor_image(arch_icon, "#FFFFFF")

awful.screen.connect_for_each_screen(function(s)
    arch_launcher = wibox.widget {
        {
            {
                widget = wibox.widget.imagebox(arch_icon)
            },
            left = 10,
            right = 10,
            top = 5,
            bottom = 5,
            widget = wibox.container.margin,
        },
        bg = "#000000",
        shape = function(cr, width, height) 
            gears.shape.rounded_rect(cr, width, height, 7)
        end,
        widget = wibox.container.background, 
    }
end)
