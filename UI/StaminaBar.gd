extends TextureProgressBar

func _physics_process(delta):
	if !StaminaTimer.is_stopped():
		value = StaminaTimer.time_left * 20
	else:
		value = 100

