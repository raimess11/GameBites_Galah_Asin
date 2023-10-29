class_name State
extends Node

signal state_finished

@export var player: Player

func _ready():
	set_physics_process(false)

func _enter_state() -> void:
	set_physics_process(true)
	pass

func _exit_state() -> void:
	set_physics_process(false)
	pass

func _physics_process(delta):
	if player.input_direction != Vector2.ZERO:
		player.velocity = player.input_direction * player.speed
	elif Input.is_action_pressed("leftMouse") && !Input.is_action_pressed("rightMouse"):
		player.target = player.get_global_mouse_position()
		player.velocity = player.position.direction_to(player.target) * player.speed
		
	
