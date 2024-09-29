-- Icon Widgets
local awful = require("awful")
local wibox = require("wibox")
local theme = require("beautiful")
local mod   = require("hotkeys.mod_keys")
local utils = require("utilities.utils")
local menus = require("utilities.menus")

local icon_wgts = { logo, }

-- logo button
local logo_btn = awful.widget.launcher {
  image = utils.recolor_img(theme.logo_icon, theme.logo_fg),
  menu  = menus.main,
  buttons = {
    awful.button({}, mod.right_click,
      function() menus.main:toggle() end),
  },
}

-- logo widget
icon_wgts.logo = utils.bg_wgt(
  utils.margin_wgt(logo_btn, 2, 2, 2, 2),
  theme.logo_bg,
  utils.full_rrect(theme.icon_rad)
)

return icon_wgts
