-- Layout Reference
local awful = require("awful")

return {
  floating   = awful.layout.suit.floating,
  max        = awful.layout.suit.max,
  fullscreen = awful.layout.suit.max.fullscreen,
  magnifier  = awful.layout.suit.magnifier,
  tile_right = awful.layout.suit.tile.right,
  tile_left  = awful.layout.suit.tile.left,
  tile_bot   = awful.layout.suit.tile.bottom,
  tile_top   = awful.layout.suit.tile.top,
  fairv      = awful.layout.suit.fair,
  fairh      = awful.layout.suit.fair.horizontal,
  dwindle    = awful.layout.suit.spiral.dwindle,
  spiral     = awful.layout.suit.spiral.name,
  corner_nw  = awful.layout.suit.corner.nw,
  corner_ne  = awful.layout.suit.corner.ne,
  corner_sw  = awful.layout.suit.corner.sw,
  corner_se  = awful.layout.suit.corner.se,
}
