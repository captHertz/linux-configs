-- App Launch Key Bindings
local awful = require("awful")
local mod   = require("hotkeys.mod_keys")
local user  = require("user").prefs
local app   = require("user").apps

return {
  -- launch app launcher
  awful.key({ user.modkey }, "/",
    function() awful.spawn.single_instance(app.launcher) end,
      {description = "open app launcher", group = "6-apps"}
  ),

  -- launch or raise terminal
  awful.key({ user.modkey }, "x",
    function() awful.spawn.raise_or_spawn(app.terminal) end,
      {description = "open or raise terminal", group = "6-apps"}
  ),

  -- launch new terminal
  awful.key({ user.modkey, mod.shift }, "x",
    function() awful.spawn(app.terminal) end,
      {description = "open new terminal", group = "6-apps"}
  ),

  -- launch or raise web browser
  awful.key({ user.modkey }, "c",
    function() awful.spawn.raise_or_spawn(app.web_browser) end,
      {description = "open or raise web browser", group = "6-apps"}
  ),

  -- launch new web browser
  awful.key({ user.modkey, mod.shift }, "c",
    function() awful.spawn(app.web_browser) end,
      {description = "open new web browser", group = "6-apps"}
  ),

  -- launch or raise text editor
  awful.key({ user.modkey }, "v",
    function() awful.spawn.raise_or_spawn(app.terminal.." -e "..app.text_editor) end,
      {description = "open or raise text editor", group = "6-apps"}
  ),

  -- launch new text editor
  awful.key({ user.modkey, mod.shift }, "v",
    function() awful.spawn(app.terminal.." -e "..app.text_editor) end,
      {description = "open new text editor", group = "6-apps"}
  ),

  -- launch or raise file manager
  awful.key({ user.modkey }, "z",
    function() awful.spawn.raise_or_spawn(app.file_manager) end,
      {description = "open or raise file manager", group = "6-apps"}
  ),

  -- launch new file manager
  awful.key({ user.modkey, mod.shift }, "z",
    function() awful.spawn(app.file_manager) end,
      {description = "open new file manager", group = "6-apps"}
  ),
}
