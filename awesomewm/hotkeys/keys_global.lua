-- Global Key Bindings
local awful     = require("awful")
local show_help = require("awful.hotkeys_popup").show_help
local mod       = require("hotkeys.mod_keys")
local layouts   = require("utilities.layouts")
local user      = require("user").prefs
local utils     = require("utilities.utils")

-- add vim motion keygroup
awful.key.keygroup["VIMKEYS"] = "vimkeys"
awful.key.keygroups["vimkeys"] = {
  { "h", "Left"  },
  { "j", "Down"  },
  { "k", "Up"    },
  { "l", "Right" },
}

return {
  -- {{{ Awesome Keys
  -- reload awesomewm config
  awful.key({ user.modkey, mod.ctrl }, "r",
    function() awesome.restart() end,
      {description = "reload awesomewm config", group = "1-awesome"}
  ),

  -- launch awesome app launcher
  awful.key({ user.modkey }, "r",
    function() awful.screen.focused().run_box:run() end,
      {description = "open awesome app launcher", group = "1-awesome"}
  ),

  -- show system hotkeys
  awful.key({ user.modkey }, "s",
    show_help,
      {description = "show help", group = "1-awesome"}
  ),

  -- show desktop
  awful.key({ user.modkey }, "d",
    function() utils.show_desktop(awful.screen.focused()) end,
      {description = "show desktop", group = "1-awesome"}
  ),
  -- }}}

  -- {{{ Client Keys
  -- restore minimized clients
  awful.key({ user.modkey, mod.shift }, "n",
    function()
      local c = awful.client.restore()
      if c then
        c:activate { context = "unminimize", raise = true }
      end
    end, {description = "restore minimized clients", group = "2-client"}
  ),

  -- jump to urgent client
  awful.key({ user.modkey, mod.ctrl }, "Return",
    function() awful.client.urgent.jumpto(false) end,
      {description = "jump to urgent client", group = "2-client"}
  ),

  -- focus client by arrow keys
  awful.key {
    modifiers   = { user.modkey },
    keygroup    = "arrows",
    description = "focus client via arrow keys",
    group       = "2-client",
    on_press = function(direct)
      awful.client.focus.bydirection(string.lower(direct), client.focus, true)
    end,
  },

  -- swap client by arrow keys
  awful.key {
    modifiers   = { user.modkey, mod.shift },
    keygroup    = "arrows",
    description = "move focused client via arrow keys",
    group       = "2-client",
    on_press = function(direct)
      if client.focus then
        awful.client.swap.bydirection(string.lower(direct), client.focus, true)
      end
    end,
  },

  -- focus client by vim keys
  awful.key {
    modifiers   = { user.modkey },
    keygroup    = "vimkeys",
    description = "focus client via vim keys",
    group       = "2-client",
    on_press = function(direct)
      awful.client.focus.bydirection(string.lower(direct), client.focus, true)
    end,
  },

  -- swap client by vim keys
  awful.key {
    modifiers   = { user.modkey, mod.shift },
    keygroup    = "vimkeys",
    description = "move focused client via vim keys",
    group       = "2-client",
    on_press = function(direct)
      if client.focus then
        awful.client.swap.bydirection(string.lower(direct), client.focus, true)
      end
    end,
  },
  -- }}}
  
  -- {{{ Tag Keys
  -- view chosen tag
  awful.key {
    modifiers   = { user.modkey },
    keygroup    = "numrow",
    description = "view tag",
    group       = "3-tag",
    on_press = function (index)
      local s = awful.screen.focused()
      local t = s.tags[index]
      if t then
        t:view_only()
      end
    end,
  },

  -- move client to chosen tag
  awful.key {
    modifiers   = { user.modkey, mod.shift },
    keygroup    = "numrow",
    description = "move focused client to tag",
    group       = "3-tag",
    on_press = function(index)
      if client.focus then
        local t = client.focus.screen.tags[index]
        if t then
          client.focus:move_to_tag(t)
          t:view_only()
        end
      end
    end,
  },

  -- add client to chosen tag (toggle)
  awful.key {
    modifiers   = { user.modkey, mod.ctrl, mod.shift },
    keygroup    = "numrow",
    description = "toggle focused client on tag",
    group       = "3-tag",
    on_press = function(index)
      if client.focus then
        local t = client.focus.screen.tags[index]
        if t then
          client.focus:toggle_tag(t)
        end
      end
    end,
  },
  -- }}}
  
  -- {{{ Layout Keys
  -- toggle floating layout (toggle)
  awful.key({ user.modkey, mod.ctrl }, "f",
    function() utils.toggle_layout(layouts.floating, user.layout) end,
      {description = "toggle floating layout", group = "4-layout"}
  ),

  -- toggle maximized layout (toggle)
  awful.key({ user.modkey, mod.ctrl }, "m",
    function() utils.toggle_layout(layouts.max, user.layout) end,
      {description = "toggle maximized layout", group = "4-layout"}
  ),

  -- switch to next layout (by index)
  awful.key({ user.modkey }, "]",
    function() awful.layout.inc(1) end,
      {description = "switch to next layout", group = "4-layout"}
  ),

  -- switch to previous layout (by index)
  awful.key({ user.modkey }, "[",
    function() awful.layout.inc(-1) end,
      {description = "switch to previous layout", group = "4-layout"}
  ),

  -- increase layout master width
  awful.key({ user.modkey, mod.shift }, "]",
    function() awful.tag.incmwfact(0.01) end,
      {description = "increase layout master width", group = "4-layout"}
  ),

  -- decrease layout master width
  awful.key({ user.modkey, mod.shift }, "[",
    function() awful.tag.incmwfact(-0.01) end,
      {description = "decrease layout master width", group = "4-layout"}
  ),

  -- increase the number of columns of the layout
  awful.key({ user.modkey, mod.ctrl }, "]",
    function() awful.tag.incncol(1, nil, true) end,
      {description = "increase layout columns", group = "4-layout"}
  ),

  -- decrease the number of columns of the layout
  awful.key({ user.modkey, mod.ctrl }, "[",
    function() awful.tag.incncol(-1, nil, true) end,
      {description = "decrease layout columns", group = "4-layout"}
  ),
  -- }}}
  
  -- {{{ Screen Keys
  -- focus next screen (cycle by index)
  awful.key({ user.modkey }, "`",
    function() awful.screen.focus_relative(1) end,
      {description = "focus next screen", group = "5-screen"}
  ),

  -- view chosen screen
  awful.key {
    modifiers   = { user.modkey, mod.ctrl },
    keygroup    = "numrow",
    description = "view screen",
    group       = "5-screen",
    on_press = function (index)
      if index <= screen.count() then
        awful.screen.focus(index)
      end
    end,
  },

  -- move client to chosen screen
  awful.key {
    modifiers   = { user.modkey, mod.ctrl, mod.shift },
    keygroup    = "numrow",
    description = "move focused client to screen",
    group       = "5-screen",
    on_press = function(index)
      if client.focus and index <= screen.count() then
        client.focus:move_to_screen(index)
        awful.screen.focus(index)
      end
    end,
  },
  -- }}}
}