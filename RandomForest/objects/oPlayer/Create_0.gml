// states
enum player_states {
	idle,
	move,
	prejump,
	jump,
	fall,
	attack,
	hurt,
	die
}

self.state = player_states.idle
self.state_changed = true

self.health = 5

// jump & move
self.step_xspeed = 2
self.jump_impulse = -6.5
self.xfriction = 0.9
self.gravitation = 0.5

self.current_xspeed = 0
self.current_yspeed = 0

// attack
self.cooldown = 0.6 * 60 // seconds * fps
self.cooldown_counter = 0
self.attack_animation_ended = false

// hurt
self.hurt_ximpulse = 2
self.hurt_yimpulse = -4
self.hurt_animation_ended = false

// die
self.die_animation_ended = false