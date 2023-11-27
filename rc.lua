--- Entry point of AwesomeWM.
-- This configuration file is intended to change configuration only by changing general configuration name.
-- Then, AwesomeWM will search for configuration file in the folder ./config/awesome/{general_config_name}

--local general_config_name = "default"
--local general_config_name = "initial_rice"
general_config_name = "wip_rice"

require(general_config_name .. "/rc")
