-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local awful = require("awful")
local beautiful = require("beautiful")

-- Name for different styling of WM
-- theme : color, wallpaper, icon style
-- style : wibar, titlebar, menu
general_theme_name = "default"
general_style_name = "default"

-- Call for autofocus function 
require("awful.autofocus")

-- Theme initialisation
beautiful.init("~/.config/awesome/" .. general_config_name .. "/theme/" .. general_theme_name .. "/theme.lua")

-- Call for other configuration files
require(general_config_name .. "/config")
require(general_config_name .. "/style/" .. general_style_name)
-- end
