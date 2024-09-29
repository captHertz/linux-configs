-- Tasklist Widgets
local awful = require("awful")
local wibox = require("wibox")
local theme = require("beautiful")
local mod   = require("hotkeys.mod_keys")
local utils = require("utilities.utils")
local menus = require("utilities.menus")

-- custom tasklist: displays clients class instaed of clients name
local classlist = require("classlist")

local tasklist_wgts = { min, class, } -- full, icon

-- minimize widget
local min_wgt = function(s)
  return awful.widget.tasklist {
    screen = s,
    filter = awful.widget.tasklist.filter.minimizedcurrenttags,
    buttons = {
      awful.button({}, mod.left_click,
        function()
          awful.menu.client_list()
        end
      ),
      awful.button({}, mod.right_click,
        function()
          awful.menu.client_list()
        end
      ),
    },
    widget_template = {
      {
        text = "~",
        widget = wibox.widget.textbox,
      },
      widget = wibox.container.place
    }
  }
end

-- minimized placeholder widget
tasklist_wgts.min = function(s)
  return utils.bg_wgt(
    utils.margin_wgt(min_wgt(s), 2, 2, 2, 2),
    theme.task_bg,
    utils.rbar(),
    theme.wibar_border_width
  )
end

-- classlist widget
local classlist_wgt = function(s)
  return classlist {
    screen = s,
    filter = awful.widget.tasklist.filter.focused,
    buttons = {
      awful.button({}, mod.left_click,
        function(c)
          c:activate { context = "tasklist", action = "toggle_minimization" }
        end
      ),
      awful.button({}, mod.right_click,
        function()
          awful.menu.client_list()
        end
      ),
    },
    widget_template = {
      {
        {
          {
            id     = "icon_role",
            widget = wibox.widget.imagebox,
          },
          margins = theme.wibar_border_width,
          widget  = wibox.container.margin,
        },
        {
          id     = "text_role",
          widget = wibox.widget.textbox,
        },
        spacing = theme.tasklist_spacing,
        layout  = wibox.layout.fixed.horizontal,
      },
      widget = wibox.container.place,
    }
  }
end

-- class tasklist widget
tasklist_wgts.class = function(s)
  return utils.bg_wgt(
    utils.margin_wgt(
      classlist_wgt(s),
      0,
      ((theme.wibar_border_width * 2) + theme.tasklist_spacing),
      0,
      0
    ),
    theme.task_bg,
    utils.rbar(),
    theme.wibar_border_width
  )
end

return tasklist_wgts
