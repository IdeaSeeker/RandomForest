function __funBackPauseMenu() {
	var inst = instance_create_depth(0, 0, -20, oFadeIn)
	inst.alpha_step = 0.05
	instance_activate_object(oPauseMenu)
}

function __funHandleButtonAction(button_index) {
	// no fade
	// it's not mistake
	switch (button_index) {
		case 0:
			self.paused = false
			break
		case 1:
			room_restart()
			break
		case 2:
			var inst = instance_create_layer(0, 0, "UI", oTraining)
			inst.end_function = __funBackPauseMenu
			instance_deactivate_object(oPauseMenu)
			break
		case 3:
			room_goto(rMenu)
			break
	}
}


// mouse counter
if (self.paused) {
	if (self.mouse_allowed_counter != 0) {
		self.last_mouse_x = mouse_x - camera_get_view_x(view_camera[0])
		self.last_mouse_y = mouse_y - camera_get_view_y(view_camera[0])
	}
	self.mouse_allowed_counter = max(0, self.mouse_allowed_counter - 1)
}
else {
	self.mouse_allowed_counter = 10
}


if (keyboard_check_pressed(global.key_pause)) {
	self.paused = !self.paused
	self.current_index = 0
	if (self.paused) {
		var cam = view_camera[0]
		var cam_w = camera_get_view_width(cam)
		var cam_h = camera_get_view_height(cam)
		var surf = funBlurSurface(
			application_surface, 10,
			cam_w, cam_h,
			1, 4,
			0, 0, 0, 0.2
		)
		self.screenshot = sprite_create_from_surface(
			surf, 0, 0, 
			cam_w, cam_h,
			0, 0, 0, 0
		)
		surface_free(surf)
	} else {
		sprite_delete(self.screenshot)
	}
}

if (self.paused) {
	if (!self.deactivated_all) {
		self.deactivated_all = true
		instance_deactivate_all(true)
		instance_activate_object(oDebug)
		instance_activate_object(oFullscreen)
	}
	
	if (keyboard_check_pressed(vk_enter)) {
		__funHandleButtonAction(self.current_index)
	}
	else if (mouse_check_button_pressed(mb_left)) {
		var new_button_index = funGetButtonByMouse(
			self.x_left_cached, self.x_right_cached,
			self.y_top_cached, self.y_bottom_cached,
			self.x_shift_cached, self.y_shift_cached, 
			view_camera[0], false
		)
		if (new_button_index != -1) {
			__funHandleButtonAction(new_button_index)
		}
	}
	else if (keyboard_check_pressed(vk_down)) {
		self.current_index += 1
		self.current_index %= self.items_count
		audio_play_sound(soundMenuButton, 0, false)
	}
	else if (keyboard_check_pressed(vk_up)) {
		self.current_index += (self.items_count - 1)
		self.current_index %= self.items_count
		audio_play_sound(soundMenuButton, 0, false)
	}
	else if (self.mouse_allowed_counter == 0) {
		var new_button_index = funGetButtonByMouse(
			self.x_left_cached, self.x_right_cached,
			self.y_top_cached, self.y_bottom_cached,
			self.x_shift_cached, self.y_shift_cached, 
			view_camera[0], true
		)
		if (new_button_index != -1 and self.current_index != new_button_index) {
			self.current_index = new_button_index
			audio_play_sound(soundMenuButton, 0, false)
		}
	}
}
else {
	self.deactivated_all = false
	instance_activate_all()
}