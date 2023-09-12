extends CharacterBody2D
class_name Player

@export var camera: Camera2D
@export var speed = 400

var target = position
var run = false

func _physics_process(delta):
	camera.position.y = self.position.y
	var input_direction = Input.get_vector("left", "right", "up", "down")
	
	if Input.is_action_just_released("rightMouse"):
		run = true
	if input_direction != Vector2.ZERO:
		velocity = finalVelocity(input_direction) * (speed * (1 - (0.8 * float(Input.is_action_pressed("rightMouse")))))
		move_and_slide()
	elif Input.is_action_pressed("leftMouse") && !Input.is_action_pressed("rightMouse"):
		target = get_global_mouse_position()
		velocity = finalVelocity(position.direction_to(target)) * (speed * (1 + (0.5 * float(run))))
		if run:
			print("run")
		if position.distance_to(target) > 10:
			move_and_slide()
		else:
			run = false
	else:
		run = false

func finalVelocity(direction):
	var vel = direction 
	return vel
