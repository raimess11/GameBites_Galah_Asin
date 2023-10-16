extends CharacterBody2D

@export var player: Player

@export var speed = 350

var target_position = Vector2.ZERO

func _physics_process(delta):
	#target_position = Vector2(player.position.x, player.position.y)
	#velocity = position.direction_to(target_position) * speed
	#move_and_slide()
	pass
