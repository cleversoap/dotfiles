--this is a lua script for use in conky
require 'cairo'

font = "Mono"
font_size = 8
red,green,blue,alpha=1,1,1,1
font_slant = CAIRO_FONT_SLANT_NORMAL
font_face = CAIRO_FONT_WEIGHT_NORMAL

function draw_arc(cr, text, percent, x, y)
    if percent ~= nil then
        -- Text
        cairo_move_to(cr, x, y)
        cairo_show_text(cr, text)
        cairo_stroke(cr)

        -- Arc
        cairo_arc(cr, x+13, y-3, 17, 0, ((percent/100)*360) * (math.pi/180))
        cairo_stroke(cr)
    end
end

function conky_main()
    if conky_window == nil then return end
    local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
    cr = cairo_create(cs)

    -- Initialise Fonts
    cairo_select_font_face(cr, font, font_slant, font_face)
    cairo_set_font_size(cr, font_size)
    cairo_set_source_rgba(cr, red, green, blue, alpha)

    -- Vars
    cpu = tonumber(conky_parse("${cpu}"))
    mem = conky_parse("${mem}")
    mem_perc = tonumber(conky_parse("${memperc}"))

    draw_arc(cr, mem, mem_perc, 20, 35)
    draw_arc(cr, cpu .. "%", cpu, 20, 83)

    -- Cleanup
    cairo_destroy(cr)
    cairo_surface_destroy(cs)
    cr = nil
end


