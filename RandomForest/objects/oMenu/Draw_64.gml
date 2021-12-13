gpu_set_tex_filter(false)

var cam = view_camera[0]
var cam_w = camera_get_view_width(cam)
// var cam_h = camera_get_view_height(cam)

draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(self.default_font)

var cur_alpha = 1 - self.alpha_animation_counter / self.alpha_animation_time

draw_set_alpha(cur_alpha)

// draw logo
var scale = 2.0
draw_text_transformed(0.5 * cam_w + 2.0, 30, "Random Forest", scale, scale, 0)

// draw buttons
for (var i = 0; i < self.items_count; i++) {
	var button_color = c_white
	var ui_scale = 1
	if (i == self.current_index) {
		draw_set_color(self.current_color)
		button_color = self.current_button_color
		ui_scale = self.current_scale
	} else {
		draw_set_color(self.default_color)
		button_color = self.default_button_color
		ui_scale = self.default_scale
	}
	var x_pos = cam_w * 0.5
	var y_pos = self.top_item + self.separate_dist * i

	draw_sprite_stretched_ext(
		self.border_sprite, 0,
		x_pos, y_pos + 1.5,
		self.border_width * ui_scale, self.border_height * ui_scale,
		button_color, cur_alpha
	)

	ui_scale *= self.text_scale

	draw_text_transformed(
		x_pos, y_pos,
		self.strings[i],
		ui_scale, ui_scale, 0
	)
}

// reset color
draw_set_color(c_white)
draw_set_alpha(1.0)
