-- RC
-- Awesome Configuration
-- Awesome Git Version: ad0290bc1aac3ec2391aa14784146a53ebf9d1f0

-- {{{ Standard Awesome Libraries
local awful = require("awful")
local gears = require("gears")
require("awful.autofocus")
-- Widget and Layout Library
local wibox = require("wibox")
-- Theme Handling Library
local theme = require("beautiful")
theme.init(gears.filesystem.get_configuration_dir().."themes/default/theme.lua") --myrsky
-- Notification Library
local naughty = require("naughty")
-- Declarative Object Management
local ruled = require("ruled")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")
-- }}}

-- User Library
local layouts = require("utilities.layouts")
local wp_type = require("utilities.wallpapers")
local utils   = require("utilities.utils")
local user    = require("user")
local mod     = require("hotkeys.mod_keys")
local hotkeys = require("hotkeys")
local wgts    = require("widgets")

-- {{{ Error Handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
naughty.connect_signal("request::display_error", function(message, startup)
  naughty.notification {
    urgency = "critical",
    title   = "OOps, an error happened"..(startup and " during startup!" or "!"),
    message = message
  }
end)
-- }}}

-- {{{ Notification Signals
naughty.connect_signal("request::display", function(n)
  naughty.layout.box { notification = n }
end)
-- }}}

-- {{{ Client Signals
client.connect_signal("request::titlebars", function(c)
  awful.titlebar(c).widget = wgts.titlebar.standard(c)
end)

client.connect_signal("property::floating", function(c)
  utils.toggle_titlebars(c)
end)

client.connect_signal("property::maximized", function(c)
  if c.maximized then
    c.shape = gears.shape.rectangle
  else
    c.shape = utils.full_rrect(15)
  end
end)

client.connect_signal("property::fullscreen", function(c)
  if c.fullscreen then
    c.shape = gears.shape.rectangle
  else
    c.shape = utils.full_rrect(15)
  end
end)
-- }}}

-- {{{ Tag Signals
tag.connect_signal("request::default_layouts", function()
  awful.layout.append_default_layouts(user.layouts)
end)

tag.connect_signal("property::layout", function(t)
  local l_float = (t.layout == layouts.floating)
  for _, c in pairs(t:clients()) do
    utils.toggle_titlebars(c, l_float)
  end
end)
-- }}}

-- {{{ Screen Signals
screen.connect_signal("request::wallpaper", function(s)
  wp_type.fill(s)
end)

-- main panel launcher
local main_btn = wgts.icon.logo

-- clock widget
local clock_text    = wgts.time.clock
local clock_tooltip = wgts.time.tooltip

screen.connect_signal("request::desktop_decoration", function(s)
  -- set the screen's tags table
  awful.tag(
    { "1", "2", "3", "4", "5", "6", "7", "8", "9" },
    s,
    awful.layout.layouts[1]
  )

  -- awesome prompt widget
  s.run_box = awful.widget.prompt()
  s.run_box:set_shape(utils.rbar())

  -- layoutbox widget
  s.layout_box = wgts.layout.box(s)

  -- taglist widget
  s.tag_all = wgts.taglist.full(s, true)
  s.tag_all.visible = false

  s.tag_noempty = wgts.taglist.full(s, false)
  s.tag_noempty:add_button(awful.button({}, mod.right_click,
    function()
      if s.tag_all.visible then
        s.tag_all.visible = false
      else
        s.tag_all.visible = true
      end
    end
  ))

  -- tasklist widget
  s.task_class = wgts.tasklist.class(s)

  -- wibar widget
  s.wb_panel = awful.wibar {
    screen   = s,
    type     = "dock",
    position = "top",
    margins = {
      left  = theme.wb_margin,
      right = theme.wb_margin,
      top   = theme.wb_margin,
    },
    bg = "#00000000",
    border_width = 0,
    widget = {
      { -- Left Widgets
        utils.bg_wgt(
          {
            main_btn,
            {
              s.tag_noempty,
              s.tag_all,
              layout = wibox.layout.stack
            },
            s.run_box,
            spacing = theme.wb_spacing,
            layout  = wibox.layout.fixed.horizontal
          },
          theme.bg_normal,
          utils.rbar(),
          theme.wibar_border_width
        ),
        {
          s.task_class,
          widget = wibox.container.place
        },
        spacing = theme.wb_spacing,
        layout  = wibox.layout.fixed.horizontal
      },
      { -- Middle Widgets
        utils.bg_wgt(
          clock_text,
          theme.bg_normal,
          utils.rbar(),
          theme.wibar_border_width
        ),
        spacing = theme.wb_spacing,
        layout  = wibox.layout.fixed.horizontal
      },
      { -- Right Widgets
        utils.bg_wgt(
          utils.margin_wgt(
            {
              wibox.widget.systray(),
              s.layout_box,
              spacing = theme.wb_spacing,
              layout  = wibox.layout.fixed.horizontal
            },
            10,
            10,
            theme.wibar_border_width,
            theme.wibar_border_width
          ),
          theme.bg_normal,
          utils.rbar(),
          theme.wibar_border_width
        ),
        spacing = theme.wb_spacing,
        layout  = wibox.layout.fixed.horizontal
      },
      -- Wibar Layout
      expand = "none",
      layout = wibox.layout.align.horizontal
    }
  }
end)
-- }}}

-- {{{ Hotkeys
-- global
awful.keyboard.append_global_keybindings(hotkeys.keys_global)
awful.keyboard.append_global_keybindings(hotkeys.keys_apps)
awful.mouse.append_global_mousebindings(hotkeys.mouse_global)

--client
client.connect_signal("request::default_keybindings", function()
  awful.keyboard.append_client_keybindings(hotkeys.keys_client)
end)
client.connect_signal("request::default_mousebindings", function()
  awful.mouse.append_client_mousebindings(hotkeys.mouse_client)
end)
-- }}}

-- {{{ Client Rules
ruled.client.connect_signal("request::rules", function()
  -- all clients
  ruled.client.append_rule {
    id = "global",
    rule = {},
    properties = {
      focus = awful.client.focus.filter,
      raise = true,
      shape = utils.full_rrect(15),
      screen = awful.screen.preferred,
      placement = awful.placement.restore
        + awful.placement.no_overlap
        + awful.placement.no_offscreen
        + awful.placement.skip_fullscreen,
      honor_workarea = true,
    },
    callback = function(c)
      awful.client.setslave(c)
    end,
  }

  -- floating clients
  ruled.client.append_rule {
    id = "floating",
    rule_any = {
      class = {
        "Gpick", -- desktop pixel color sampler
        "Tor Browser",
        "pinentry", -- part of a password management program
        "veromix", -- sound mixer for pulseaudio
        "xtightvncviewer", -- a virtual machine accessable over a network
      },

      role = { "pop-up" }, -- e.g. Google Chrome's (detached) developer tools.

      instance = {
        "pinentry", -- part of a password management program
      },
    },
    properties = { floating = true, placement = awful.placement.centered, },
  }

  -- add titlebars to dialogs
  ruled.client.append_rule {
    id = "titlebars",
    rule_any = { type = { "dialog" } },
    properties = { titlebars_enabled = true },
  }

  --[[
    -- eg. Firefox to open on: tag name "2", screen 1
    ruled.client.append_rule {
      rule = { class = "Firefox" },
      properties = { screen = 1, tag = "2" }
    }
  --]]
end)
-- }}}

-- {{{ Notification Rules
ruled.notification.connect_signal("request::rules", function()
  -- All notifications will match this rule
  ruled.notification.append_rule {
    rule = {},
    properties = {
      screen = awful.screen.preferred,
      implicit_timeout = 5,
    }
  }
end)

-- Notification Example
-- naughty.notify({ text = user.prefs.modkey })
-- }}}

require("lua_gc")
