extends Button


func _on_pressed():
	print("trees")
	get_tree().change_scene_to_file("res://level/level1.tscn")
	
