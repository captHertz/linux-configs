-- Myrsky Theme
local gfs      = require("gears.filesystem")
local dir_path = gfs.get_configuration_dir().."themes/myrsky/"
local dpi      = require("beautiful.xresources").apply_dpi
local user     = require("user").prefs
local color    = require("themes.colors."..user.colors)

local theme = {}

-- transparent reference
theme.trn = "#00000000"

theme.wp   = dir_path.."zelda-botw.png"
theme.font = user.font.family.." "..user.font.style.." "..user.font.size

-- {{ Generate Awesome icon
local theme_assets = require("beautiful.theme_assets")
theme.awesome_icon = theme_assets.awesome_icon(
  theme.menu_height, theme.bg_focus, theme.fg_focus
)
-- }}

-- {{ Urgent Notification Theme
local rnotification = require("ruled.notification")
rnotification.connect_signal('request::rules', function()
  rnotification.append_rule {
    rule       = { urgency = 'critical' },
    properties = { bg = color.red, fg = color.crust }
  }
end)

theme.notification_font = theme.font

theme.notification_bg = color.crust
theme.notification_fg = color.red

theme.notification_border_color = color.red
theme.notification_border_width = dpi(1)

-- theme.notification_width = dpi(0)
-- theme.notification_height = dpi(0)
theme.notification_margin = dpi(1)

theme.notification_opacity = 1.0
theme.notification_spacing = dpi(3)
-- }}

-- {{ Default Theme
theme.bg_normal = color.mantle
theme.fg_normal = color.text

theme.bg_focus = color.base
theme.fg_focus = color.text

theme.bg_minimize = color.crust
theme.fg_minimize = color.text

theme.bg_urgent = color.red
theme.fg_ugrent = color.crust

theme.useless_gap  = dpi(3)
theme.border_width = dpi(3)

theme.border_color_normal = color.overlay0
theme.border_color_active = color.lavender
theme.border_color_marked = color.yellow
-- }}

-- {{ Menu Theme
theme.menu_font = theme.font

theme.menu_submenu_icon = dir_path.."submenu.png"
theme.menu_submenu      = ">"

theme.menu_height = dpi(20)
theme.menu_width  = dpi(150)

theme.menu_bg_normal = color.base
theme.menu_fg_normal = color.text

theme.menu_bg_focus = color.lavender
theme.menu_fg_focus = color.crust

theme.menu_border_width = theme.border_width
theme.menu_border_color = theme.border_color_active
-- }}

-- {{ Wibar Theme
theme.wibar_bg = theme.trn
theme.wibar_fg = color.lavender

theme.wb_spacing = dpi(5)
theme.wb_wgt_bg  = color.base
theme.wb_wgt_fg  = color.lavender

theme.wibar_border_width = dpi(0)
theme.wibar_border_color = "#ffffff"
-- }}

-- {{ Icon Widgets Theme
theme.icon_rad = dpi(10)

theme.logo_icon = dir_path.."icons/nix-snowflake-white.svg"
theme.logo_bg   = "#7ebae4"
theme.logo_fg   = "#5277c3"
-- }}

-- {{ Taglist Widgets Theme
theme.taglist_font    = theme.font
theme.tag_bg          = color.rosewater
theme.taglist_spacing = dpi(3)

theme.tag_bg_hover = color.mauve
theme.tag_fg_hover = color.crust

theme.taglist_bg_focus = color.lavender
theme.taglist_fg_focus = color.crust

theme.taglist_bg_occupied = color.surface2
theme.taglist_fg_occupied = color.text

theme.taglist_bg_empty = color.surface0
theme.taglist_fg_empty = color.text

theme.taglist_bg_urgent = color.red
theme.taglist_fg_urgent = color.crust

theme.taglist_bg_volatile = color.yellow
theme.taglist_fg_volatile = color.crust
-- }}

-- {{ Tasklist Widgets Theme
theme.tasklist_font    = theme.font
theme.task_bg          = color.rosewater
theme.tasklist_spacing = dpi(5)

theme.task_bg_hover = color.mauve
theme.task_fg_hover = color.crust

theme.tasklist_bg_focus = color.lavender
theme.tasklist_fg_focus = color.crust

theme.tasklist_bg_normal = color.surface2
theme.tasklist_fg_normal = color.text

theme.tasklist_bg_minimize = color.surface0
theme.tasklist_fg_minimize = color.text

theme.tasklist_bg_urgent = color.red
theme.tasklist_fg_urgent = color.crust

--[[ other customization options
theme.tasklist_font_focus     = theme.font
theme.tasklist_font_minimized = theme.font
theme.tasklist_font_urgent    = theme.font

theme.tasklist_icon_size = dpi(20)

theme.tasklist_sticky    = ""
theme.tasklist_ontop     = ""
theme.tasklist_floating  = ""
theme.tasklist_minimized = ""
theme.tasklist_maximized = ""
--]]
-- }}

-- {{ Time Widgets Theme
theme.time_bg = color.rosewater
-- }}

-- {{ Systray Theme
theme.bg_systray = color.rosewater
theme.systray_icon_spacing = dpi(3)
-- }}

-- {{ Prompt Widget Theme
theme.prompt_font = theme.font

theme.prompt_bg = color.mantle
theme.prompt_fg = color.text

theme.prompt_bg_cursor = color.lavender
theme.prompt_fg_cursor = color.crust
-- }}

-- {{ Layout Widgets Theme
theme.layout_bg   = color.rosewater
theme.layout_size = dpi(50)

-- Layout Icons
theme.layout_floating   = dir_path.."layouts/floatingw.png"
theme.layout_max        = dir_path.."layouts/maxw.png"
theme.layout_fullscreen = dir_path.."layouts/fullscreenw.png"
theme.layout_magnifier  = dir_path.."layouts/magnifierw.png"

theme.layout_tile       = dir_path.."layouts/tilew.png"
theme.layout_tileleft   = dir_path.."layouts/tileleftw.png"
theme.layout_tilebottom = dir_path.."layouts/tilebottomw.png"
theme.layout_tiletop    = dir_path.."layouts/tiletopw.png"

theme.layout_fairh = dir_path.."layouts/fairhw.png"
theme.layout_fairv = dir_path.."layouts/fairvw.png"

theme.layout_dwindle = dir_path.."layouts/dwindlew.png"
theme.layout_spiral  = dir_path.."layouts/spiralw.png"

theme.layout_cornernw = dir_path.."layouts/cornernww.png"
theme.layout_cornerne = dir_path.."layouts/cornernew.png"
theme.layout_cornersw = dir_path.."layouts/cornersww.png"
theme.layout_cornerse = dir_path.."layouts/cornersew.png"
-- }}

-- {{ Tooltip Theme
theme.tooltip_font = theme.font

theme.tooltip_bg = color.base
theme.tooltip_fg = color.text

theme.tooltip_border_width = dpi(1)
theme.tooltip_border_color = theme.border_color_normal

theme.tooltip_opacity = 0.7
theme.tooltip_align   = "bottom"
theme.tooltip_gaps    = dpi(0)
-- }}

-- {{ Hotkey Popup Theme
theme.hotkeys_font = theme.font
--theme.hotkeys_description_font = 
theme.hotkeys_shape   = 
theme.hotkeys_opacity = 1.0

theme.hotkeys_bg = color.base
theme.hotkeys_fg = color.text

theme.hotkeys_label_bg = color.lavender
theme.hotkeys_label_fg = color.crust

theme.hotkeys_modifiers_fg = color.red
theme.hotkeys_group_margin = dpi(5)

theme.hotkeys_border_width = theme.border_width
theme.hotkeys_border_color = color.lavender
--}}

-- {{ Titlebar Theme
theme.titlebar_spacing = dpi(5)

theme.titlebar_bg_focus = theme.bg_focus
theme.titlebar_fg_focus = theme.fg_focus

theme.titlebar_bg_normal = theme.bg_normal
theme.titlebar_fg_normal = theme.fg_normal

theme.titlebar_bg_urgent = theme.bg_urgent
theme.titlebar_fg_urgent = theme.fg_urgent

-- Titlebar Button Icons
theme.titlebar_close_button_normal = dir_path.."titlebar/close_normal.png"
theme.titlebar_close_button_focus = dir_path.."titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = dir_path.."titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus = dir_path.."titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = dir_path.."titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive = dir_path.."titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = dir_path.."titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active = dir_path.."titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = dir_path.."titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive = dir_path.."titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = dir_path.."titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active = dir_path.."titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = dir_path.."titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive = dir_path.."titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = dir_path.."titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active = dir_path.."titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = dir_path.."titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive = dir_path.."titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = dir_path.."titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active = dir_path.."titlebar/maximized_focus_active.png"
-- }}

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme
