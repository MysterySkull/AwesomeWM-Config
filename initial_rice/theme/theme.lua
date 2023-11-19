--------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = "/home/guillaume/.config/awesome/initial_rice/theme/"

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


color.darkerbase = "#020d1f"
color.base03  = "#002b36"
color.base02  = "#073642"
color.base01  = "#586e75"
color.base00  = "#657b83"
color.base0   = "#839496"
color.base1   = "#93a1a1"
color.base2   = "#eee8d5"
color.base3   = "#fdf6e3"

icons = {}

-- Battery icons
icons.battery_full_discharging           = "󰁹"
icons.battery_90percent_discharging      = "󰂂"
icons.battery_80percent_discharging      = "󰂁"
icons.battery_70percent_discharging      = "󰂀"
icons.battery_60percent_discharging      = "󰁿"
icons.battery_50percent_discharging      = "󰁾"
icons.battery_40percent_discharging      = "󰁽"
icons.battery_30percent_discharging      = "󰁼"
icons.battery_20percent_discharging      = "󰁻"
icons.battery_10percent_discharging      = "󰁺"
icons.battery_00percent_discharging      = "󰂎"

icons.battery_full_charging           = "󰂅"
icons.battery_90percent_charging      = "󰂋"
icons.battery_80percent_charging      = "󰂊"
icons.battery_70percent_charging      = "󰢞"
icons.battery_60percent_charging      = "󰂉"
icons.battery_50percent_charging      = "󰢝"
icons.battery_40percent_charging      = "󰂈"
icons.battery_30percent_charging      = "󰂇"
icons.battery_20percent_charging      = "󰂆"
icons.battery_10percent_charging      = "󰢜"
icons.battery_00percent_charging      = "󰢟"

-- RAM and CPU usage
icons.CPU_usage              = "󰻠"
icons.RAM_usage              = ""

icons.bluetooth_on           = "\u{f293}"
icons.bluetooth_off          = "\u{f00d}"

icons.ethernet               = "󰈀"
icons.wifi_strenght_0        = "󰤯"
icons.wifi_strenght_1        = "󰤟"
icons.wifi_strenght_2        = "󰤢"
icons.wifi_strenght_3        = "󰤥"
icons.wifi_strenght_4        = "󰤨"
icons.no_connection          = ""

icons.spotify                = "\u{f1bc}"
icons.firefox                = "\u{f269}"
icons.terminal               = "\u{f120}"

icons.music_play             = "\u{f04b}"
icons.music_pause            = "\u{f04c}"
icons.music_forward          = "\u{f04e}"
icons.music_backward         = "\u{f04a}"

icons.volume_mute            = "󰝟"
icons.volume_off             = "󰕿"
icons.volume_low            = "󰖀"
icons.volume_high             = "󰕾"

icons.brightness             = "\u{f185}"

--icons.home                   =

local theme = {}

theme.font          = "JetBrains Mono Nerd Font 9"

theme.bg_normal     = color.crust 
theme.bg_focus      = color.overlay0
theme.bg_urgent     = color.red
theme.bg_minimize   = color.base01
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = color.text
theme.fg_focus      = color.text
theme.fg_urgent     = color.red
theme.fg_minimize   = color.red

theme.useless_gap   = dpi(2)
theme.border_width  = dpi(1)
theme.border_normal = color.mantle
theme.border_focus  = color.overlay0
theme.border_marked = color.orange

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
theme.menu_submenu_icon = themes_path.."default/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = themes_path.."titlebar/close_normal.svg"
--theme.titlebar_close_button_focus  = themes_path.."default/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path.."titlebar/minimize_normal.svg"
--theme.titlebar_minimize_button_focus  = themes_path.."titlebar/minimize_focus.svg"
--theme.titlebar_minimize_button_focus_hover = themes_path.."titlebar/minimize_focus_hover.svg"

theme.titlebar_maximized_button_normal_inactive = themes_path.."titlebar/maximized_normal.svg"
--theme.titlebar_maximized_button_focus_inactive  = themes_path.."default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path.."titlebar/maximized_normal_active.svg"
--theme.titlebar_maximized_button_focus_active  = themes_path.."default/titlebar/maximized_focus_active.png"

theme.wallpaper = themes_path.."wallpaper-theme-converter(1).png"

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
