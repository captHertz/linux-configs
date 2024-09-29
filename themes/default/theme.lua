---------------------------
--     Cstorm Theme      --
---------------------------

local theme_assets  = require("beautiful.theme_assets")
local xresources    = require("beautiful.xresources")
local rnotification = require("ruled.notification")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_configuration_dir() .. "themes/"

-- NixOS New Logo Codes:
-- light blue:   #51bcfe
-- blue:         #608fff
-- dark blue:    #6c69ff
-- light purple: #d3b4fc
-- purple:       #a78af6
-- dark purple:  #886bf1

-- NixOS Old Logo Codes:
-- light blue:   #7EBAE4
-- dark blue:    #5277C3

-- Dark Red Neon Scheme:
-- red:         #FF204E
-- maroon:      #A0153E
-- dark maroon: #5D0E41
-- navy:        #00224D

-- Cyberpunk Codes:
-- bright red:  #E5142A
-- yellow:      #FDF909

-- Old OpenBox Theme:
-- Focus Colours
-- white:       #ffffff title.fg
-- light grey:  #7c7d80 disabled.fg
-- grey:        #505256 disabled.bg
-- dark grey:   #25272c title.bg
-- black:       #000000 pressed.fg
-- cyan:        #00cccc hover.fg
-- Normal Colours
-- white:       #ffffff pressed.fg
-- lighter grey:#a7a8aa title.bg
-- light grey:  #7c7d80 disabled.bg
-- grey:        #505256 disabled.fg
-- dark grey:   #25272c title.fg
-- dark cyan:   #008e8e hover.fg

-- Watch Dogs Colours:
-- white:       #FFFFFF
-- black:       #000000
-- dark blue:   #006CE3
-- light blue:  #31C8F5
-- yellow:      #C8D23D
-- red:         #D23C3D
-- purple:      #9360D6

local theme = {}

theme.wallpaper = themes_path.."default/magical-forrest.png"
theme.font = "hack regular 10"

theme.bg_clear  = "#00000000"

theme.bg_normal   = "#000000"
theme.fg_normal   = "#006CE3"

theme.bg_focus    = "#9360D6"
theme.fg_focus    = "#31C8F5"

theme.bg_urgent   = "#C8D23D"
theme.fg_urgent   = "#D23C3D"

theme.bg_minimize = "#006CE3"
theme.fg_minimize = "#FFFFFF"

theme.useless_gap  = dpi(3)
theme.border_width = dpi(3)
theme.border_color_normal = "#FFFFFF"
theme.border_color_active = "#D23C3D"
theme.border_color_marked = "#9360D6"


-- Wibar Theme
theme.wibar_bg      = "#ffffff" --theme.bg_clear
--theme.wibar_height  = dpi(30)
theme.wibar_border_width = dpi(2)
--theme.wibar_spacing = dpi(5)

-- Start Menu Icon
theme.start_menu_icon = themes_path.."default/nix-snowflake-white.svg"
theme.start_menu_bg = "#006CE3"
theme.start_menu_fg = "#31C8F5"
theme.icon_rad = dpi(5)
theme.logo_icon = themes_path.."default/nix-snowflake-white.svg"
theme.logo_bg = "#7ebae4"
theme.logo_fg = "#5277c3"
theme.time_bg = "#402020"
theme.prompt_bg = "#402020"
theme.prompt_fg = "#ffffff"
theme.prompt_bg_cursor = "#ff0000"
theme.prompt_fg_cursor = "#000000"
theme.layout_bg = "#00cc00"
theme.layout_size = dpi(50)
theme.tag_bg = "#007700"
theme.tag_bg_hover = "#cc0000"
theme.tag_fg_hover = "#000000"
theme.task_bg = "#402020"
theme.tasklist_spacing = dpi(1)
theme.wb_spacing = dpi(5)
theme.wb_margin = dpi(5)

-- Taglist Theme
theme.taglist_font = theme.font
theme.taglist_spacing = dpi(5)
theme.taglist_margins = dpi(5)
theme.tagmenu_margins = dpi(2)

theme.taglist_bg_focus    = "#31C8F5"
theme.taglist_fg_focus    = "#006CE3"

theme.taglist_bg_occupied = "#006CE3"
theme.taglist_fg_occupied = "#31C8F5"

theme.taglist_bg_empty    = "#9360D6"
theme.taglist_fg_empty    = "#000000"

theme.taglist_bg_urgent   = "#C8D23D"
theme.taglist_fg_urgent   = "#000000"

theme.taglist_bg_volatile = "#D23C3D"
theme.taglist_fg_volatile = "#000000"

--[[
-- Tasklist Theme
theme.tasklist_font = theme.font
theme.tasklist_font_focus     = theme.font
theme.tasklist_font_minimized = theme.font
theme.tasklist_font_urgent    = theme.font
theme.tasklist_spacing   = dpi(5)
theme.tasklist_margins   = dpi(5)
theme.tasklist_icon_size = dpi(5)

theme.tasklist_bg_normal   = "#000000"
theme.tasklist_fg_normal   = "#000000"

theme.tasklist_bg_focus    = "#000000"
theme.tasklist_fg_focus    = "#000000"

theme.tasklist_bg_urgent   = "#000000"
theme.tasklist_fg_urgent   = "#000000"

theme.tasklist_bg_minimize = "#000000"
theme.tasklist_fg_minimize = "#000000"
--]]

theme.bg_systray = theme.bg_normal

-- Layoutlist Theme
theme.layoutbox_bg      = "#006CE3"
theme.layoutbox_fg      = "#9360D6"
theme.layoutbox_columns = 4
theme.layoutbox_spacing = dpi(5)
theme.layoutbox_size    = dpi(50)

-- Layout Icons
theme.layout_floating   = themes_path.."default/layouts/floatingw.png"
theme.layout_max        = themes_path.."default/layouts/maxw.png"
theme.layout_fullscreen = themes_path.."default/layouts/fullscreenw.png"
theme.layout_magnifier  = themes_path.."default/layouts/magnifierw.png"

theme.layout_tile       = themes_path.."default/layouts/tilew.png"
theme.layout_tileleft   = themes_path.."default/layouts/tileleftw.png"
theme.layout_tilebottom = themes_path.."default/layouts/tilebottomw.png"
theme.layout_tiletop    = themes_path.."default/layouts/tiletopw.png"

theme.layout_fairh      = themes_path.."default/layouts/fairhw.png"
theme.layout_fairv      = themes_path.."default/layouts/fairvw.png"

theme.layout_dwindle    = themes_path.."default/layouts/dwindlew.png"
theme.layout_spiral     = themes_path.."default/layouts/spiralw.png"

theme.layout_cornernw   = themes_path.."default/layouts/cornernww.png"
theme.layout_cornerne   = themes_path.."default/layouts/cornernew.png"
theme.layout_cornersw   = themes_path.."default/layouts/cornersww.png"
theme.layout_cornerse   = themes_path.."default/layouts/cornersew.png"

-- Menu Theme
theme.menu_submenu_icon = themes_path.."default/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(150)

theme.menu_bg_normal = "#000000"
theme.menu_fg_normal = "#ffffff"

theme.menu_bg_focus = "#ffffff"
theme.menu_fg_focus = "#000000"

theme.menu_border_width = theme.wibar_border_width
theme.menu_border_color = "#ffffff"

-- Tooltip Theme
theme.tooltip_font = theme.font
theme.tooltip_opacity = 1.0
theme.tooltip_bg = "#000000"
theme.tooltip_fg = "#ffffff"
theme.tooltip_border_width = dpi(1)
theme.tooltip_border_color = "#ffffff"
theme.tooltip_align = "bottom"
--theme.tooltip_gaps = dpi(0)

-- TODO
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

--[[
-- Titlebar Theme
theme.titlebar_bg_focus  = "#000000"
theme.titlebar_fg_focus  = "#000000"

theme.titlebar_bg_normal = "#000000"
theme.titlebar_fg_normal = "#000000"

theme.titlebar_bg_urgent = "#000000"
theme.titlebar_fg_urgent = "#000000"

theme.titlebar_bg_normal = "#000000"
theme.titlebar_fg_normal = "#000000"
--]]
theme.titlebar_spacing = dpi(5)
-- Titlebar Button Icons
theme.titlebar_close_button_normal = themes_path.."default/titlebar/close_normal.png"
theme.titlebar_close_button_focus = themes_path.."default/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path.."default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus = themes_path.."default/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = themes_path.."default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive = themes_path.."default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path.."default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active = themes_path.."default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path.."default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive = themes_path.."default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path.."default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active = themes_path.."default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path.."default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive = themes_path.."default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path.."default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active = themes_path.."default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path.."default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive = themes_path.."default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path.."default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active = themes_path.."default/titlebar/maximized_focus_active.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
  theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

-- Set different colors for urgent notifications.
rnotification.connect_signal('request::rules', function()
  rnotification.append_rule {
    rule       = { urgency = 'critical' },
    properties = { bg = '#ff0000', fg = '#ffffff' }
  }
end)

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
