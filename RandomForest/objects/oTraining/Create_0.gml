// upload font
self.text_scale_20 = 20 / 24

// texts
self.shift_text      = "    -   "
self.arrow_keys_text = "Движение персонажа\nНаправление броска меча"
self.x_key_text      = "    -   Атака / Возврат меча"
self.c_key_text      = "    -   Бросок меча / Телепорт"
self.fullscreen_text = "    -   Полноэкранный режим"
self.continue_text   = "Для продолжения нажмите любую клавишу"

// size constants
self.key_scale = 2
self.key_shift = 3
self.magic_shift = 7
self.line_interval = 10
self.key_width  = self.key_scale * sprite_get_width(sKeyX)
self.key_height = self.key_scale * sprite_get_height(sKeyX)

// find center
var cam = view_camera[0]
var cam_w = camera_get_view_width(cam)
var cam_h = camera_get_view_height(cam)
self.room_center_x = cam_w / 2
self.room_center_y = cam_h / 2
self.start_x = self.room_center_x - 130
self.start_y = self.room_center_y - 85

// alpha settings
self.text_alpha = 0.9
self.sprite_alpha = 0.9

self.text_continue_alpha_min = 0.1
self.text_continue_alpha_max = 0.6
self.text_continue_alpha_current = 0.5

// time
self.tick_counter = 0
self.end_training = false

// end function
function __funTrainingEndFunctionDefault() {
	global.is_training_completed = true
	funSaveGameState()
	room_goto_next()
}

self.end_function = __funTrainingEndFunctionDefault

// fade in
var inst = instance_create_depth(0, 0, -10, oFadeIn)
inst.alpha_step = 0.02
