local widget_addr = "initial_rice/wibar/widget/"
local widget_name = "calendar_widget"

local widget_loc = widget_addr .. widget_name

require("initial_rice/theme/theme")

require (widget_loc .. "/widget")
require (widget_loc .. "/popup")
require (widget_loc .. "/button")
