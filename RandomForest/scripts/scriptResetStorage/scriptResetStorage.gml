// debug functions

function funResetGeneral() {
	global.is_fullscreen = false
	global.current_level = 0
	global.is_training_completed = false
	global.is_game_finished = false
	global.hit_vs_tap_text_shown = 0

	funSaveGameState()
}

function funResetLevels() {
	global.current_level = 0
	global.is_training_completed = false
	global.is_game_finished = false

	funSaveGameState()
}

function funResetRecords() {
	for (var i = 0; i < array_length(global.time_records); ++i) {
		global.time_records[i] = -1
	}

	funSaveGameState()
}