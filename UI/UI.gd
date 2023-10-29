extends CanvasLayer

@export var nextLevel: PackedScene

func _on_restart_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()
	StaminaTimer.stop()


func _on_quit_pressed():
	get_tree().quit()


func _on_continue_pressed():
	get_tree().change_scene_to_packed(nextLevel)
