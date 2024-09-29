-- Taglist Widgets
local awful = require("awful")
local wibox = require("wibox")
local theme = require("beautiful")
local mod   = require("hotkeys.mod_keys")
local user  = require("user").prefs
local utils = require("utilities.utils")

local taglist_wgts = { full, } -- minimal,

-- taglist buttons
local taglist_buttons = {
  -- view tag
  awful.button({}, mod.left_click,
    function(t) t:view_only() end
  ),

  -- toggle tag view
  awful.button({ user.modkey }, mod.left_click,
    function(t) awful.tag.viewtoggle(t) end
  ),

  -- move focused client to tag
  awful.button({ user.modkey, mod.shift }, mod.left_click,
    function(t)
      if client.focus then
        client.focus:move_to_tag(t)
      end
    end
  ),

  -- toggle focused client on tag
  awful.button({ user.modkey, mod.shift, mod.ctrl }, mod.left_click,
    function(t)
      if client.focus then
        client.focus:toggle_tag(t)
      end
    end
  ),
}

-- full taglist widget
local taglist_full = function(s, fltr)
  return awful.widget.taglist{
    screen  = s,
    filter  = fltr,
    buttons = taglist_buttons,
    style   = { shape = utils.circle(), },
    layout  = wibox.layout.fixed.horizontal,
    widget_template = {
      {
        {
          {
            id     = "text_role",
            widget = wibox.widget.textbox,
          },
          margins = theme.taglist_margins,
          widget  = wibox.container.margin,
        },
        valign = "center",
        halign = "center",
        widget = wibox.container.place,
      },
      id     = "background_role",
      widget = wibox.container.background,

      -- add hover color functions
      create_callback = function(self)
        self:connect_signal("mouse::enter", function()
          if self.bg ~= theme.tag_bg_hover then
            self.backup = {
              loaded = true,
              bg = self.bg,
              fg = self.fg,
            }
            self.bg = theme.tag_bg_hover
            self.fg = theme.tag_fg_hover
          end
        end)
        self:connect_signal("mouse::leave",function()
          if self.backup.loaded then
            self.bg = self.backup.bg
            self.fg = self.backup.fg
            self.backup.loaded = false
          end
        end)
      end
    }
  }
end

-- taglist widget
taglist_wgts.full = function(s, fltr_all)
  local fltr
  if fltr_all then
    fltr = awful.widget.taglist.filter.all
  else
    fltr = awful.widget.taglist.filter.noempty
  end

  return utils.bg_wgt(
    utils.margin_wgt(taglist_full(s, fltr), 2, 2, 2, 2),
    theme.tag_bg,
    utils.rbar()
  )
end

return taglist_wgts
