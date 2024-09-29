-- Client Mouse Bindings
local awful = require("awful")
local mod   = require("hotkeys.mod_keys")
local user  = require("user").prefs

return {
  awful.button({}, mod.left_click,
    function(c) c:activate { context = "mouse_click" } end
  ),

  awful.button({ user.modkey }, mod.left_click,
    function(c) c:activate { context = "mouse_click", action = "mouse_move" } end
  ),

  awful.button({ user.modkey }, mod.right_click,
    function(c) c:activate { context = "mouse_click", action = "mouse_resize" } end
  ),
}
