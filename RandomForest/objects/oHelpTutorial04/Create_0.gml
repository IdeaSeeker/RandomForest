// font settings
self.text_scale_16 = 16 / 24

// text
self.c_key_text = "   -   Бросок меча / Телепорт"
self.help_text = "Зажми клавишу C, чтобы выбрать направление броска стрелочками"

// size constants
self.key_scale = 2
self.key_shift = 3
self.magic_shift = 7
self.key_width  = self.key_scale * sprite_get_width(sKeyX)
self.key_height = self.key_scale * sprite_get_height(sKeyX)

// positions
var cam = view_camera[0]
self.room_x0 = -camera_get_view_x(cam)
self.room_y0 = -camera_get_view_y(cam)

self.c_key_start_x = self.room_x0 + 152
self.c_key_start_y = self.room_y0 + 10

self.help_start_x = camera_get_view_width(cam) / 2
self.help_start_y = camera_get_view_height(cam) - 18

// alpha settings
self.text_alpha = 0.8
self.sprite_alpha = 0.8