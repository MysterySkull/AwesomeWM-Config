-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")

require("awful.autofocus")

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init("/home/guillaume/.config/awesome/wip_rice/theme/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "alacritty"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor
browser = "firefox"

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Keyboard map indicator and switcher
-- mykeyboardlayout = awful.widget.keyboardlayout()

require(general_config_name .. "/layout")

require(general_config_name .. "/menu")

require(general_config_name .. "/wibar")

require(general_config_name .. "/binding")

require(general_config_name .. "/rules")

require(general_config_name .. "/titlebar")

require(general_config_name .. "/signal")

require(general_config_name .. "/auto_start")

require(general_config_name .. "/error_handling")

gears.timer {
	timeout = 30,
	autostart = true,
	callback = function() collectgarbage() end
}
