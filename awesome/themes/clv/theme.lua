local gears = require("gears")
local lain = require("lain")
local awful = require("awful")
local wibox = require("wibox")

local os = { getenv = os.getenv, setlocale = os.setlocale }

local markup = lain.util.markup

local theme = {}

-- Base colors
local fg                                        = "#678bdc"
local bg                                        = "#292a44"
local normal_bg                                 = "#10112b"
local focus_bg                                  = "#43445e"

-- General
theme.dir                                       = awful.util.getdir("config") .. "/themes/clv"
theme.font                                      = "Tewii 12"

-- Wallpaper
theme.wallpaper                                 = "/home/matt/Pictures/Wallpapers/current"

-- Wibar
theme.bar_height                                = 36
theme.bar_fg                                    = "#678bdc"
theme.bar_bg                                    = normal_bg

-- Window gaps
theme.useless_gap                               = 5
theme.gap_single_client                         = true

-- Window borders
theme.border_width                              = 0

-- Titlebars
theme.titlebar_height                           = 36
theme.titlebar_fg                               = "#678bdc"
theme.titlebar_bg                               = normal_bg
theme.titlebar_bg_focus                         = focus_bg
theme.titlebar_font                             = "xos4 Terminus 8"

-- Menu
theme.menu_fg_normal                            = "#aaaaaa"
theme.menu_fg_focus                             = "#ff8c00"
theme.menu_bg_normal                            = "#050505dd"
theme.menu_bg_focus                             = "#050505dd"

-- Widgets
theme.widgets                                   = {}

-- ICONS
theme.widgets.icons = {
    cpu = wibox.widget.imagebox(theme.dir .. "/icons/si-glyph-cpu.svg")
}

-- CPU
theme.widgets.cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#e33a6e", cpu_now.usage .. "% "))
    end
})

-- Coretemp
theme.widgets.temp = lain.widget.temp({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#f1af5f", coretemp_now .. "°C "))
    end
})

-- Filesystem
theme.widgets.fs = lain.widget.fs({
    options = "--exclude-type=tmpfs",
    notification_preset = { font = "xos4 Terminus 10", fg = "#FF0000", bg = "#000000" },
    settings  = function()
        widget:set_markup(markup.fontfg(theme.font, "#80d9d8", fs_now.used .. "% "))
    end
})


return theme
