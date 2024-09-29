-- Titlebar Widgets
local awful = require("awful")
local wibox = require("wibox")
local theme = require("beautiful")
local mod   = require("hotkeys.mod_keys")
local utils = require("utilities.utils")

local titlebar_wgts = { standard, }

-- buttons for the titlebar
local m_btn = function(c)
  return {
    awful.button({ }, mod.left_click,
      function()
        c:activate { context = "titlebar", action = "mouse_move" }
      end
    ),
    awful.button({ }, mod.right_click,
      function()
        c:activate { context = "titlebar", action = "mouse_resize" }
      end
    ),
  }
end

-- standard titlebar widget
titlebar_wgts.standard = function(c)
  return {
    { -- left: icon
      utils.margin_wgt(
        awful.titlebar.widget.iconwidget(c), 2, 2, 2, 2
      ),
      buttons = m_btn(c),
      layout  = wibox.layout.fixed.horizontal,
    },
    { -- middle: title
      {
        halign = "center",
        widget = utils.margin_wgt(
          awful.titlebar.widget.titlewidget(c), 1, 1, 1, 1
        ),
      },
      buttons = m_btn(c),
      layout  = wibox.layout.flex.horizontal,
    },
    { -- right: min, max, close
      utils.margin_wgt(
        awful.titlebar.widget.minimizebutton(c), 1, 1, 1, 1
      ),
      utils.margin_wgt(
        awful.titlebar.widget.maximizedbutton(c), 1, 1, 1, 1
      ),
      utils.margin_wgt(
        awful.titlebar.widget.closebutton(c), 1, 1, 1, 1
      ),
      spacing = theme.titlebar_spacing,
      layout  = wibox.layout.fixed.horizontal,
    },
    layout = wibox.layout.align.horizontal,
  }
end

return titlebar_wgts
