-- Utilities
local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local dpi   = require("beautiful.xresources").apply_dpi

local utils = {
  show_desktop,
  toggle_floating,
  toggle_titlebars,
  margin_wgt,
  bg_wgt,
  recolor_img,
  circle,
  rbar,
  part_squircle,
  full_squircle,
  part_rrect,
  full_rrect,
}

-- {{{ Hotkey Functions
-- show desktop
utils.show_desktop = function(s)
  if s then
    awful.tag.viewnone(s)
  end
end

-- toggle a layout
utils.toggle_layout = function(l, user_l)
  local t = awful.screen.focused().selected_tag
  if t then
    if t.layout ~= l then
      t.layout = l
    else
      t.layout = user_l
    end
  end
end

-- toggle titlebars
utils.toggle_titlebars = function(c, l_float)
  -- return if client requests no titlebar
  if c.requests_no_titlebar then return end

  if (c.floating or l_float) and not c.maximized then
    -- request titlebar if client has no titlebar
    if c.titlebar == nil then
      c:emit_signal("request::titlebars")
    end
    awful.titlebar.show(c)
    -- place titlebar on screen
    awful.placement.no_overlap(c)
    awful.placement.no_offscreen(c)
  else
    awful.titlebar.hide(c)
  end
end
-- }}}

-- {{{ Widget Functions
-- margin widget
utils.margin_wgt = function(wgt, left, right, top, bot, vis)
  return wibox.widget{
    wgt,
    left    = dpi(left),
    right   = dpi(right),
    top     = dpi(top),
    bot     = dpi(bot),
    visible = vis,
    widget  = wibox.container.margin
  }
end

-- background widget
utils.bg_wgt = function(wgt, bg, shape, bd_w, vis)
  return wibox.widget {
    wgt,
    bg           = bg,
    shape        = shape,
    border_width = bd_w,
    visible      = vis,
    widget       = wibox.container.background
  }
end

-- recolor image
utils.recolor_img = function(img, clr)
  return gears.color.recolor_image(img, clr)
end

-- dpi
utils.dpi = function(num)
  return dpi(num)
end
-- }}}

-- {{{ Shape Functions
-- circle
utils.circle = function(rad)
  return function(cr, width, height)
    gears.shape.circle(cr, width, height, rad)
  end
end

-- rounded bar
utils.rbar = function()
  return function(cr, width, height)
    gears.shape.rounded_bar(cr, width, height)
  end
end

-- partial squircle
utils.part_squircle = function(sq, tl, tr, br, bl)
  return function(cr, width, height, delta)
    gears.shape.partial_squircle(cr, width, height, tl, tr, br, bl, sq, delta)
  end
end

-- full squircle
utils.full_squircle = function(sq)
  return function(cr, width, height, delta)
    gears.shape.squircle(cr, width, height, sq, delta)
  end
end

-- rounded rectangle
utils.part_rrect = function(rad, tl, tr, br, bl)
  return function(cr, width, height)
    gears.shape.partial_rounded_rect(cr, width, height, tl, tr, br, bl, dpi(rad))
  end
end

-- rounded rectangle
utils.full_rrect = function(rad)
  return function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, dpi(rad))
  end
end
-- }}}

return utils
