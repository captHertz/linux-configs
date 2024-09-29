-- Client Key Bindings
local awful = require("awful")
local mod   = require("hotkeys.mod_keys")
local user  = require("user").prefs

return {
  -- close client
  awful.key({ user.modkey }, "q",
    function(c) c:kill() end,
      {description = "close", group = "2-client"}
  ),

  -- move client to master
  awful.key({ user.modkey, mod.shift }, "Return",
    function(c) c:swap(awful.client.getmaster()) end,
      {description = "move to master", group = "2-client"}
  ),

  -- minimize client
  awful.key({ user.modkey }, "n",
    function(c) c.minimized = true end,
      {description = "minimize", group = "2-client"}
  ),

  -- maximize client (toggle)
  awful.key({ user.modkey }, "m",
    function(c)
      c.maximized = not c.maximized
      c:raise()
    end, {description = "toggle maximize", group = "2-client"}
  ),

  -- fullscreen client (toggle)
  awful.key({ user.modkey }, "b",
    function(c)
      c.fullscreen = not c.fullscreen
      c:raise()
    end, {description = "toggle fullscreen", group = "2-client"}
  ),

  -- make client floating (toggle)
  awful.key({ user.modkey }, "f",
    function(c)
      if not c.maximized then
        c.floating = not c.floating
      end
    end, {description = "toggle floating", group = "2-client"}
  ),

  -- move client to next screen (by index)
  awful.key({ user.modkey, mod.shift }, "`",
    function(c) c:move_to_screen() end,
      {description = "move to next screen", group = "2-client"}
  ),
}