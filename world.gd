extends Node2D



func _on_restart_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_quit_pressed():
	get_tree().quit()


func _on_finish_body_entered(body):
	if body.name == "Player":
		$CanvasLayer/Win.visible = true
		get_tree().paused = true
