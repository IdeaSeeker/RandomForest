function funPlayerAttackStart() {
	self.sprite_index = sPlayerAttack1
	self.image_index = 0
	self.cooldown_counter = self.cooldown
	self.attack_animation_ended = false
	instance_create_depth(self.x, self.y, -1, oPlayerSword)
}


function funPlayerAttackLogic() {
	funPlayerStepMove()

	var critical_state = funPlayerDetectCriticalState()
	if (critical_state != undefined and critical_state != player_states.attack) {
		funPlayerChangeState(critical_state)
		return
	}
	
	if (self.image_index >= 3) {
		instance_destroy(oPlayerSword)
		var detected_state = funPlayerDetectState()
		if (detected_state != player_states.idle) {
			funPlayerChangeState(detected_state)
			return
		}
	}
	
	if (self.attack_animation_ended) {
		var detected_state = funPlayerDetectState()
		funPlayerChangeState(detected_state)
		return
	}
}