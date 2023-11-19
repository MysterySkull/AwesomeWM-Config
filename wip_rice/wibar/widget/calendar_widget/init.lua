local widget_addr = "wip_rice/wibar/widget/"
local widget_name = "calendar_widget"

local widget_loc = widget_addr .. widget_name

require("wip_rice/theme/theme")

require (widget_loc .. "/widget")
require (widget_loc .. "/popup")
require (widget_loc .. "/button")
