-- Wallpapers
local awful = require("awful")
local wibox = require("wibox")
local theme = require("beautiful")

local wallpapers = { fill, fit, grad, add_logo, }

-- fill the screen by enlarging image
wallpapers.fill = function(s)
  return awful.wallpaper {
    screen = s,
    bg     = "#000000",
    widget = {
      {
        resize = true,
        image  = theme.wallpaper,
        widget = wibox.widget.imagebox,
      },
      valign = "center",
      halign = "center",
      tiled  = false,
      widget = wibox.container.tile,
    },
    honor_workarea = false,
  }
end

-- fit the screen by stretching image
wallpapers.fit = function(s)
  awful.wallpaper {
    screen = s,
    widget = {
      horizontal_fit_policy = "fit",
      vertical_fit_policy   = "fit",
      image  = theme.wallpaper,
      widget = wibox.widget.imagebox,
    },
    honor_workarea = true,
  }
end

-- gradient color background
wallpapers.grad = function(s)
  awful.wallpaper {
    screen = s,
    bg = {
      type = "linear",
      from = { 0, 0 },
      to   = { 0, 1080 },
      stops = {
        { 0.0, "#0000ff" },
        { 0.5, "#00ff00" },
        { 1.0, "#ff0000" },
      },
    },
  }
end

-- add logo
wallpapers.add_logo = function(s)
  awful.wallpaper {
    screen = s,
    bg     = "#000000",
    widget = {
      {
        {
          resize = false,
          point  = awful.placement.centered,
          image  = theme.logo_icon,
          widget = wibox.widget.imagebox,
        },
        widget = wibox.layout.manual,
      },
      margins = 50,
      widget  = wibox.container.margin,
    },
  }
end

return wallpapers
