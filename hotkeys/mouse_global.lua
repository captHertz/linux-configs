-- Global Mouse Bindings
local awful = require("awful")
local mod   = require("hotkeys.mod_keys")
local menus = require("utilities.menus")

return {
  --[[
  awful.button({}, mod.right_click,
    function() menus.main:toggle() end
  ),
  --]]
}