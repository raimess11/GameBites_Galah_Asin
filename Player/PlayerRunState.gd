extends State
class_name PlayerRunState

@export var runSpeed: float = 1.5

signal player_normal

func _enter_state():
	StaminaTimer.start()
	super._enter_state()

func _physics_process(delta):
	player.input_direction = Input.get_vector("left", "right", "up", "down")
	super._physics_process(delta)
	player.velocity = player.velocity * runSpeed
	if StaminaTimer.is_stopped():
		player_normal.emit()
	elif player.input_direction != Vector2.ZERO:
		player.animation_player.play("Move",-1,1.2)
		player.collision = player.move_and_collide(player.velocity * delta)
	elif (player.position.distance_to(player.target) > 10) and Input.is_action_pressed("leftMouse"):
		player.animation_player.play("Move",-1,1.2)
		player.collision = player.move_and_collide(player.velocity * delta)
	else:
		player_normal.emit()
		
func _exit_state():
	StaminaTimer.stop()
	super._exit_state()
