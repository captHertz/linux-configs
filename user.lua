-- User Preferences and Applications
local layouts = require("utilities.layouts")
local mod     = require("hotkeys.mod_keys")

local user = { config, prefs, apps, layouts, }

user.config = {
  user = os.getenv("USER"),
  host = os.getenv("HOSTNAME"),
  home = os.getenv("HOME"),
}

user.prefs = {
  modkey = mod.super,
  layout = layouts.dwindle,
  theme  = "myrsky",
  colors = "catppuccin.mocha",
  font = {
    family = "hack",
    style  = "regular", -- regular/bold/italic/bold italic
    size   = "10",
  },
}

user.apps = {
  terminal     = "alacritty",
  text_editor  = "vim" or os.getenv("EDITOR"),
  web_browser  = "firefox",
  file_manager = "thunar",
  launcher     = "rofi",
  image_viewer = "qimgv",
}

user.layouts = { -- order matters (should include floating)
  layouts.dwindle,
  layouts.tile_right,
  layouts.tile_left,
  layouts.tile_bot,
  layouts.fairv,
  layouts.fairh,
  layouts.max,
  layouts.floating,
}

return user
