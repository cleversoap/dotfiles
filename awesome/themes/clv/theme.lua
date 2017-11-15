local gears = require("gears")
local lain = require("lain")
local awful = require("awful")
local wibox = require("wibox")

local os = { getenv = os.getenv, setlocale = os.setlocale }

local markup = lain.util.markup

local theme = {}

-- General
theme.dir                                       = awful.util.getdir("config") .. "/themes/clv"
theme.font                                      = "xos4 Terminus 8"

-- Wibar
theme.bar_height                                = 36
theme.bar_fg                                    = "#657b83"
theme.bar_bg                                    = "#fdf6d3"

-- Window gaps
theme.useless_gap                               = 5
theme.gap_single_client                         = true

-- Window borders
theme.border_width                              = 1
theme.border_normal                             = "#1c2022"
theme.border_focus                              = "#606060"
theme.border_marked                             = "#3ca4d8"

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
