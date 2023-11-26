local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

--TODO add a terminal icon to show prompt cmd

local prompt_icon = gears.surface.load_uncached(".config/awesome/wip_rice/theme/prompt_icons/prompt_icon.svg")
local prompt_icon = gears.color.recolor_image(prompt_icon, "#FFFFFF")

prompt_command_keys = gears.table.join(
    -- Prompt
    awful.key({ modkey },            "r",     function () 
        awful.screen.focused().mypromptbox:run() 
    end,
        {description = "run prompt", group = "launcher"}),

    awful.key({ modkey }, "x",
        function ()
            awful.prompt.run {
                prompt       = "Run Lua code: ",
                textbox      = awful.screen.focused().mypromptbox.widget,
                exe_callback = awful.util.eval,
                history_path = awful.util.get_cache_dir() .. "/history_eval"
            }
        end,
        {description = "lua execute prompt", group = "awesome"})
)

awful.screen.connect_for_each_screen(function(s)
    s.mypromptbox = awful.widget.prompt {
        prompt = " : ",
        fg = "#FFFFFF",
    }

    promptbox_container = wibox.widget {
        {
            {
                {
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
