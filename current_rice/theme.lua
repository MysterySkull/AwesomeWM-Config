---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local gears = require("gears")
local themes_path = ".config/awesome/current_rice/theme/"

color = {}

color.rosewater = "#F5E0DC"
color.flamingo = "#F2CDCD"
color.pink = "#F5C2E7"
color.mauve = "#CBA6F7"
color.red = "#F38BA8"
color.maroon = "#EBA0AC"
color.peach = "#FAB387"
color.yellow = "#F9E2AF"
color.green = "#A6E3A1"
color.teal = "#94E2D5"
color.sky = "#89DCEB"
color.sapphire = "#74C7EC"
color.blue = "#89B4FA"
color.lavender = "#B4BEFE"

color.text = "#CDD6F4"
color.subtext1 = "#BAC2DE"
color.subtext0 = "#A6ADC8"
color.overlay2 = "#9399B2"
color.overlay1 = "#7F849C"
color.overlay0 = "#6C7086"
color.surface2 = "#585B70"
color.surface1 = "#45475A"
color.surface0 = "#313244"

color.base = "#1E1E2E"
color.mantle = "#181825"
color.crust = "#11111B"

local theme = {}

theme.font          = "sans 8"

theme.bg_normal     = color.crust
theme.bg_focus      = color.base
theme.bg_urgent     = color.red
theme.bg_minimize   = color.green
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.useless_gap   = dpi(2)
theme.border_width  = dpi(2)
theme.border_normal = color.crust
theme.border_focus  = color.surface0
theme.border_marked = "#91231c"

theme.titlebar_bg_normal = color.crust
theme.titlebar_bg_focus = color.surface0
theme.titlebar_fg = color.text

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

local titlebar_icon_button = gears.surface.load_uncached(themes_path .. "titlebar/icon_unfocus.svg")
-- Define the image to load
--theme.titlebar_close_button_normal = gears.color.recolor_image(themes_path .. "titlebar/icon_unfocus.svg", color.mantle)
theme.titlebar_close_button_focus = gears.color.recolor_image(titlebar_icon_button, color.red)
theme.titlebar_close_button_normal = gears.color.recolor_image(titlebar_icon_button, color.surface2)

theme.titlebar_minimize_button_normal = gears.color.recolor_image(titlebar_icon_button, color.surface2)
theme.titlebar_minimize_button_focus  = gears.color.recolor_image(titlebar_icon_button, color.yellow)

theme.titlebar_maximized_button_normal_inactive = gears.color.recolor_image(titlebar_icon_button, color.surface2)
theme.titlebar_maximized_button_focus_inactive  = gears.color.recolor_image(titlebar_icon_button, color.green)
theme.titlebar_maximized_button_normal_active = gears.color.recolor_image(titlebar_icon_button, color.surface2)
theme.titlebar_maximized_button_focus_active  = gears.color.recolor_image(titlebar_icon_button, color.green)
 

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
