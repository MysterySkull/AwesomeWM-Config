-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Theme handling library
local beautiful = require("beautiful")

--- GLOBAL VARIABLES
-- This is used later as the default terminal and editor to run.
terminal = "alacritty"
editor = "nvim"
editor_cmd = terminal .. " -e " .. editor
browser = "firefox"
-- Default modkey.
modkey = "Mod4"
-- name of the theme and config directory
rice_name = "current_rice"
rice_root_dir = "~/.config/awesome/" .. rice_name

--- ERROR HANDLING
require(rice_name .."/error_handling")

--- THEME DEFINITION
beautiful.init(rice_root_dir .."/theme.lua")

--- LAYOUT DEFINITION ---
require(rice_name .."/layout")

--- TAGS DEFINITION ---
require(rice_name .."/taglist")

--- SCREEN SETUP ---
require(rice_name .."/screen")

--- SET CLIENT CONFIGURATION ---
require(rice_name .."/client")

--- SET KEYBINDING ---
require(rice_name .."/key_binding")

--- AUTOSTRART --- 
awful.spawn.with_shell("picom")
awful.spawn.with_shell("xfce4-power-manager")

--- GARBAGE COLLECTOR ---
gears.timer {
    timeout = 30,
    autostart = true,
    callback = function() collectgarbage() end
}

