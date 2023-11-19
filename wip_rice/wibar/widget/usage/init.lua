local awful = require("awful")
local wibox = require("wibox")

require("wip_rice/theme/theme")

local spacer = wibox.widget{
	text = " ",
	widget = wibox.widget.textbox
}

local hardware_usage_widget = {}

hardware_usage_widget.CPU_icon = wibox.widget{
	font = "JetBrains Mono Nerd Font 14",
	text = icons.CPU_usage,
	widget = wibox.widget.textbox,
	forced_width = 30
}
hardware_usage_widget.CPU_textbox = wibox.widget{
	text = "ERROR",
	widget = wibox.widget.textbox
}
hardware_usage_widget.RAM_icon = wibox.widget{ 
	font = "JetBrains Mono Nerd Font 12",
	text = icons.RAM_usage,
	widget = wibox.widget.textbox,
	forced_width = 30
}
hardware_usage_widget.RAM_textbox = wibox.widget{
	text = "ERROR",
	widget = wibox.widget.textbox
}

local hardware_usage_container = {}

hardware_usage_container.CPU = wibox.widget{
	{ layout = wibox.layout.align.horizontal,
	  hardware_usage_widget.CPU_icon,
	  nil,
	  hardware_usage_widget.CPU_textbox
	},
	forced_width = 75,
	widget = wibox.container.background	
}
hardware_usage_container.RAM = wibox.widget{
	{ layout = wibox.layout.align.horizontal,
	  hardware_usage_widget.RAM_icon,
	  nil,
	  hardware_usage_widget.RAM_textbox
	},
	forced_width = 75,
	widget = wibox.container.background	
}

hardware_usage_widget_container = wibox.widget{
	{ layout = wibox.layout.align.horizontal,
		{ layout = wibox.layout.fixed.horizontal,
			hardware_usage_container.CPU },
		spacer,
	  	{ layout = wibox.layout.fixed.horizontal,
	 	  hardware_usage_container.RAM },
  	},
	widget = wibox.container.background
}

function get_used_memory(string_input)
	local space_index = string.find(string_input," ")
	local used_mem_output = string.sub(string_input,1,space_index)

	return used_mem_output+0
end

function get_total_memory(string_input)
	local space_index = string.find(string_input," ")+1
	local total_mem_used = string.sub(string_input,space_index)

	return total_mem_used+0
end

function get_used_mem_percent(used, total)
	out_string = string.format("%.2f",used/total*100) 
	
	return out_string .. "%"
end

function get_used_cpu_percent(string_cpu_input)
	local space_index = string.find(string_cpu_input," ")
	local wip_cpu_usage = string.sub(string_cpu_input,1,space_index-1)+0
	local second_cpu_usage = string.sub(string_cpu_input,space_index+1)+0
	
	local total_cpu_usage = wip_cpu_usage + second_cpu_usage

	return total_cpu_usage .. "0%"
end


awful.widget.watch([[bash -c "free | awk 'NR==2' | awk '{printf $3 \" \"$2}'"]],1,
	function(widget, stdout)
		used_memory = get_used_memory(stdout)
		total_memory = get_total_memory(stdout) 
		
		used_mem_percent = get_used_mem_percent(used_memory, total_memory)
		
		widget:set_text(used_mem_percent)
	end,
	hardware_usage_widget.RAM_textbox)

awful.widget.watch([[bash -c "top -b -n 2 | grep \"%Cpu(s)\" | awk 'NR==2' | awk '{print $2 \" \" $4}' | tr ',' '.'"]],1,
	function(widget, stdout)
		used_cpu_percent = get_used_cpu_percent(stdout)

		widget:set_text(used_cpu_percent)	
	end,
	hardware_usage_widget.CPU_textbox)


