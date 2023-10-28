extends State
class_name PlayerTauntState

@export var tauntSpeed: float = 0.2

signal player_run

func _physics_process(delta):
	player.input_direction = Input.get_vector("left", "right", "up", "down")
	super._physics_process(delta)
	if player.input_direction != Vector2.ZERO:
		player.animation_player.play("Move",-1,0.5)
	else:
		player.animation_player.play("Idle",-1,0.5)
	player.velocity = player.velocity * tauntSpeed
	player.collision = player.move_and_collide(player.velocity * delta)
	if Input.is_action_just_released("rightMouse"):
		player_run.emit()
		
