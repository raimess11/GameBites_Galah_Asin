extends Node2D


func _ready():
	get_tree().paused = false;

func _physics_process(delta):
	if $Player.collision && $Player.collision.get_collider().is_in_group("enemy"):
		$CanvasLayer/Lose.visible = true
		get_tree().paused = true




func _on_finish_body_entered(body):
	if body.name == "Player":
		$CanvasLayer/Win.visible = true
		get_tree().paused = true
