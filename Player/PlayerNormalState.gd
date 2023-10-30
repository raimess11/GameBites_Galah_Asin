extends State
class_name PlayerNormalState

signal player_taunt

func _physics_process(delta):
	
	player.input_direction = Input.get_vector("left", "right", "up", "down")
	print(player.input_direction)
	super._physics_process(delta)
	if player.input_direction != Vector2.ZERO:
		player.collision = player.move_and_collide(player.velocity * delta)
		player.animation_player.play("Move",-1,0.7)
	elif (player.position.distance_to(player.target) > 10) and Input.is_action_pressed("leftMouse"):
		player.collision = player.move_and_collide(player.velocity * delta)
		player.animation_player.play("Move",-1,0.7)
	else:
		player.animation_player.play("Idle",-1,0.7)
	if Input.is_action_pressed("rightMouse"):
		player_taunt.emit()
