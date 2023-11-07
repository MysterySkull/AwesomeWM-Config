-- Initialisation file for call of all configuration files that are needed
-- by all of diferent kind of style and theme. These configuration files can 
-- be the rules of the clients, number of tags, keybinding and mouse binding

local file_path = general_config_name .. "/config/"



-- Require Section
require(file_path .. "variables_definition")
require(file_path .. "auto_start") 
require(file_path .. "error_handling")
require(file_path .. "layout")
require(file_path .. "binding")
require(file_path .. "rules")
require(file_path .. "signal")
require(file_path .. "garbage_collector")
require(file_path .. "wallpaper")
require(file_path .. "tags")
-- end
