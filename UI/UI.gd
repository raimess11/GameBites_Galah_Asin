extends CanvasLayer

func _on_restart_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()
	GlobalSound.stream = load("res://BGM_SFX/BGM game nya.mp3")
	StaminaTimer.stop()


func _on_quit_pressed():
	get_tree().quit()
