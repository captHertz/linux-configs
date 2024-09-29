-- Menus
local awful     = require("awful")
local show_help = require("awful.hotkeys_popup").show_help
local theme     = require("beautiful")
local layouts   = require("utilities.layouts")
local user      = require("user").apps

local menus = { power, layouts, main, }

-- power menu items
local power_items = {
  --{ "Sleep", function() awful.spawn.with_shell("systemctl suspend-then-hibernate") end },
  {
    "Logout",
    function() awesome.quit() end
  }, {
    "Reboot",
    function() awful.spawn.with_shell("systemctl reboot") end
  }, {
    "Power Off",
    function() awful.spawn.with_shell("systemctl poweroff") end
  },
}

-- layout menu items
local layout_items = {
  -- floating layout items
  {
    "Floating",
    function() awful.layout.set(layouts.floating) end,
    theme.layout_floating
  }, {
    "Maximized",
    function() awful.layout.set(layouts.max) end,
    theme.layout_max
  }, {
    "Fullscreen",
    function() awful.layout.set(layouts.fullscreen) end,
    theme.layout_fullscreen
  }, {
    "Magnifier",
    function() awful.layout.set(layouts.magnifier) end,
    theme.layout_magnifier
  },

  -- tile layout items
  { "Right Tile",
    function() awful.layout.set(layouts.tile_right) end,
    theme.layout_tile
  }, {
    "Left Tile",
    function() awful.layout.set(layouts.tile_left) end,
    theme.layout_tileleft
  }, {
    "Bottom Tile",
    function() awful.layout.set(layouts.tile_bot) end,
    theme.layout_tilebottom
  }, {
    "Top Tile",
    function() awful.layout.set(layouts.tile_top) end,
    theme.layout_tiletop
  },

  -- fair layout items
  {
    "Vertical Fair",
    function() awful.layout.set(layouts.fairv) end,
    theme.layout_fairv
  }, {
    "Horizontal Fair",
    function() awful.layout.set(layouts.fairh) end,
    theme.layout_fairh
  },

  -- spiral layout items
  {
    "Dwindle",
    function() awful.layout.set(layouts.dwindle) end,
    theme.layout_dwindle
  }, {
    "Spiral",
    function() awful.layout.set(layouts.spiral) end,
    theme.layout_spiral
  },

  -- corner layout items
  {
    "NW Corner",
    function() awful.layout.set(layouts.corner_nw) end,
    theme.layout_cornernw
  }, {
    "NE Corner",
    function() awful.layout.set(layouts.corner_ne) end,
    theme.layout_cornerne
  }, {
    "SW Corner",
    function() awful.layout.set(layouts.corner_sw) end,
    theme.layout_cornersw
  }, {
    "SE Corner",
    function() awful.layout.set(layouts.corner_se) end,
    theme.layout_cornerse
  },
}

menus.power = awful.menu({ items = power_items })
menus.layouts = awful.menu({ items = layout_items })
menus.main = awful.menu({
  items = {
    { "Terminal", user.terminal },
    -- add more here
    { "Layouts", layout_items },
    { "Show Help", function() show_help() end },
    { "Reload Awm", awesome.restart, theme.awesome_icon },
    { "Power", power_items },
  }
})

return menus
