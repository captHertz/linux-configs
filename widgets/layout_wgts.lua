-- Layout Box Widgets
local awful = require("awful")
local wibox = require("wibox")
local theme = require("beautiful")
local mod   = require("hotkeys.mod_keys")
local utils = require("utilities.utils")
local menus = require("utilities.menus")

local layout_wgts = { box, popup, }

-- layout indicator
local layout_ind = function(s)
  return awful.widget.layoutbox {
    screen = s,
    buttons = { awful.button({ }, mod.right_click,
      function () menus.layouts:toggle() end)
    },
  }
end

-- layout box widget
layout_wgts.box = function(s)
  return utils.bg_wgt(
    utils.margin_wgt(layout_ind(s), 1, 1, 1, 1),
    theme.layout_bg,
    utils.full_rrect(theme.icon_rad)
  )
end

-- layout list popup
layout_wgts.popup = function(s)
  return awful.popup {
    widget = awful.widget.layoutlist {
      screen      = s,
      placement   = awful.placement.maximize_vertically,
      base_layout = wibox.layout.flex.vertical,
      widget_template = {
        id = 'icon_role',
        widget = wibox.widget.imagebox,
      },
    },
    visible = false,
    ontop   = true,
    shape   = utils.full_rrect(15),
    border_width   = theme.border_width,
    border_color   = theme.border_color_active,
    maximum_height = #awful.layout.layouts * theme.layout_size,
    preferred_positions = { "bottom", "top", "left", "right" },
    preferred_anchors   = { "middle", "front", "back" },
    hide_on_right_click = true,
  }
end

return layout_wgts

--[[
local layout_popup = awful.popup {
  widget = wibox.widget {
    awful.widget.layoutlist {
      source = awful.widget.layoutlist.source.for_screen,
      base_layout = wibox.widget {
        spacing = theme.layoutbox_spacing,
        forced_num_cols = theme.layoutbox_columns,
        layout  = wibox.layout.grid.vertical,
      },
      widget_template = {
        {
          id = 'icon_role',
          forced_height = theme.layoutbox_size,
          forced_width  = theme.layoutbox_size,
          widget        = wibox.widget.imagebox,
        },
        id = 'background_role',
        forced_width  = theme.layoutbox_size,
        forced_height = theme.layoutbox_size,
        shape  = gears.shape.rectangle,
        widget = wibox.container.background,
      },
    },
    margins = theme.layoutbox_spacing,
    widget  = wibox.container.margin,
  },
  placement    = awful.placement.centered,
  border_width = theme.border_width,
  border_color = theme.border_color_active,
  shape   = gears.shape.rounded_rect,
  ontop   = true,
  visible = false,
  hide_on_right_click = true,
}
--]]
