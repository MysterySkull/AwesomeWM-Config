local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

--TODO add a terminal icon to show prompt cmd

local arch_icon = ".config/awesome/wip_rice/theme/prompt/archlinux-icon.svg"
local prompt_icon = ".config/awesome/wip_rice/theme/prompt/console-line.svg"

local is_extended;

awful.screen.connect_for_each_screen(function(s)

    s.my_prompt_box = awful.widget.prompt{
        prompt = "",
    }

    s.promptboxwidget = wibox.widget {
        s.mypromptbox
    }

end)
