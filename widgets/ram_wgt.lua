-- Ram Widget
local awful = require("awful")
local naughty = require("naughty")

local ram_wgts = { icon, }

ram_wgts.icon = nil -- TODO

awful.widget.watch(
  'bash -c "free | awk \'/Mem/ {print $3/$2}\'"',
  10,
  function(widget, stdout)
    naughty.notify({ text = stdout })
  end,
  ram_wgts.icon
)