--this is a lua script for use in conky
require 'cairo'

font = "Mono"
font_size = 8
text = "hello world"
xpos,ypos = 27, 83
red,green,blue,alpha=1,1,1,1
font_slant = CAIRO_FONT_SLANT_NORMAL
font_face = CAIRO_FONT_WEIGHT_NORMAL

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

    cpu = cpu * 4
    mem_perc = mem_perc * 4

    -- MEM
    cairo_move_to(cr, 17, 35)
    if mem ~= nil and mem_perc ~= nil then
        -- Amount
        cairo_show_text(cr, mem)
        cairo_stroke(cr)

        -- Percent
        cairo_arc(cr, 30, 32, 17, 0, mem_perc * (math.pi/180))
        cairo_stroke(cr)
    end

    -- CPU
    cairo_move_to(cr, 18, 83)
    if cpu ~= nil then
        cairo_show_text(cr, cpu .. "%")
        cairo_stroke(cr)
        cairo_arc(cr, 30, 80, 17, 0, cpu * (math.pi/180))
        cairo_stroke(cr)
    end

    -- Debug Print
    local updates = tonumber(conky_parse('${updates}'))
    if updates > 1 then
        print ("Hello World")
    end
    cairo_destroy(cr)
    cairo_surface_destroy(cs)
    cr = nil
end


