-- Time Widgets
-- Reference: Glib DateTime Format
local awful = require("awful")
local wibox = require("wibox")
local theme = require("beautiful")
local utils = require("utilities.utils")

local time_wgts = { clock, tooltip, } -- calendar,

-- text clock widget
local clock_text = wibox.widget.textclock("%R | %F")

-- clock widget
time_wgts.clock = utils.bg_wgt(
  utils.margin_wgt(clock_text, 10, 10, 1, 1),
  theme.time_bg,
  utils.rbar()
)

-- clock tooltip
time_wgts.tooltip = awful.tooltip {
  objects = { clock_text },
  timer_function = function()
    return os.date("%A, %d %B %Y")
  end,
}

return time_wgts
