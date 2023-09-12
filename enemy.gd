extends CharacterBody2D

@export var player: Player

@export var speed = 350

@export_enum("Horizontal", "Vertical") var follow_player = 0

@export var NegativeLimit = 0
@export var PositiveLimit = 0

var target_position = Vector2.ZERO

func _physics_process(delta):
	if follow_player:
		if target_position.y > NegativeLimit && target_position.y < PositiveLimit: target_position = Vector2(position.x, player.position.y)
	else:
		if target_position.x > NegativeLimit && target_position.x < PositiveLimit: target_position = Vector2(player.position.x, position.y)
	velocity = position.direction_to(target_position) * speed
	if position.distance_to(target_position) > 5:
		move_and_slide()
