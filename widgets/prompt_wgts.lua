-- Prompt Widgets
local awful = require("awful")
local utils = require("utilities.utils")

local prompt_wgts = { run_box, }

prompt_wgts.run_box = awful.widget.prompt():set_shape(utils.rbar())

return prompt_wgts
