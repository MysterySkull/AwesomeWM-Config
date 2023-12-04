---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = "~/.config/awesome/current_rice/theme/"

colors = {}

colors.dark_nord0 = "#2E3440"
colors.dark_nord1 = "#3B4252"
colors.dark_nord2 = "#434C5E"
colors.dark_nord3 = "#4C566A"

colors.bright_nord4 = "#D8DEE9" 
colors.bright_nord5 = "#E5E9F0"
colors.bright_nord6 = "#ECEFF4"

colors.frost_nord7 = "#8FBCBB"
colors.frost_nord8 = "#88C0D0"
colors.frost_nord9 = "#81A1C1"
colors.frost_nord10 = "#5E81AC"

colors.aurora_red = "#BF616A"
colors.aurora_orange = "#D08770"
colors.aurora_yellow = "#EBCB8B"
colors.aurora_green = "#A3BE8C"
colors.aurora_purple = "#B48EAD"

local theme = {}

theme.font          = "sans 8"

theme.bg_normal     = colors.dark_nord0
theme.bg_focus      = colors.dark_nord3
theme.bg_urgent     = colors.aurora_red
theme.bg_minimize   = colors.aurora_green
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.useless_gap   = dpi(2)
theme.border_width  = dpi(2)
theme.border_normal = "#000000"
theme.border_focus  = "#333333"
theme.border_marked = "#91231c"

theme.titlebar_bg = colors.dark_nord0
theme.titlebar_fg = colors.bright_nord4

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path.."current_rice/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = themes_path .. "titlebar/icon_unfocus.svg"
theme.titlebar_close_button_focus = themes_path .. "titlebar/close_icon_focus.svg"

theme.titlebar_minimize_button_normal = themes_path.."titlebar/icon_unfocus.svg"
theme.titlebar_minimize_button_focus  = themes_path.."titlebar/minimize_icon_focus.svg"

theme.titlebar_maximized_button_normal_inactive = themes_path.."titlebar/icon_unfocus.svg"
theme.titlebar_maximized_button_focus_inactive  = themes_path.."titlebar/maximized_icon_focus.svg"
theme.titlebar_maximized_button_normal_active = themes_path.."titlebar/icon_unfocus.svg"
theme.titlebar_maximized_button_focus_active  = themes_path.."titlebar/maximized_icon_focus.svg"

theme.wallpaper = themes_path.."background.png"

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path.."layouts/fairhw.png"
theme.layout_fairv = themes_path.."layouts/fairvw.png"
theme.layout_floating  = themes_path.."layouts/floatingw.png"
theme.layout_magnifier = themes_path.."layouts/magnifierw.png"
theme.layout_max = themes_path.."layouts/maxw.png"
theme.layout_fullscreen = themes_path.."layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path.."layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path.."layouts/tileleftw.png"
theme.layout_tile = themes_path.."layouts/tilew.png"
theme.layout_tiletop = themes_path.."layouts/tiletopw.png"
theme.layout_spiral  = themes_path.."layouts/spiralw.png"
theme.layout_dwindle = themes_path.."layouts/dwindlew.png"
theme.layout_cornernw = themes_path.."layouts/cornernww.png"
theme.layout_cornerne = themes_path.."layouts/cornernew.png"
theme.layout_cornersw = themes_path.."layouts/cornersww.png"
theme.layout_cornerse = themes_path.."layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
