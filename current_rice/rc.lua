-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")

--- GLOBAL VARIABLES
-- This is used later as the default terminal and editor to run.
terminal = "alacritty"
editor = "nvim"
editor_cmd = terminal .. " -e " .. editor
browser = "firefox"
-- Default modkey.
modkey = "Mod4"
-- name of the theme
rice_name = "current_rice"

--- ERROR HANDLING
require(rice_name .."/error_handling")

--- THEME DEFINITION
beautiful.init("~/.config/awesome/current_rice/theme.lua")

--- LAYOUT DEFINITION ---
require(rice_name .."/layout")

--- SCREEN SETUP ---
require(rice_name .."/screen")

--- SET CLIENT CONFIGURATION ---
require(rice_name .."/client")

--- SET KEYBINDING ---
require(rice_name .."/key_binding")

--- GARBAGE COLLECTOR ---
gears.timer {
    timeout = 30,
    autostart = true,
    callback = function() collectgarbage() end
}

