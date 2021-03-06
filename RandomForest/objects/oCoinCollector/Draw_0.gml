// set position on the screen
self.x = 12
self.y = 12 + 6 + 12

// keep position on the screen when camera move
self.x += camera_get_view_x(view_camera[0])
self.y += camera_get_view_y(view_camera[0])

// draw collected coins number
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_set_font(global.default_font_12)

var score_to_show = string(self.coins_collected) + "/" + string(self.coins_all)
draw_text_ext(self.x + 12 + 6, self.y - 2, score_to_show, 0, 12)

// draw myself
draw_self()