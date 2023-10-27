extends Path2D

@export var player: Player
@export var speed = 0.01
@export var follow_barrier = 0

@onready var PathFollow = $PathFollow2D

var max_height


# Called when the node enters the scene tree for the first time.
func _ready():
	max_height = countHeight() + position.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	if player.position.y < (max_height - follow_barrier) or player.position.y > (max_height + follow_barrier):
		PathFollow.set_physics_process(false)
	else:
		PathFollow.set_physics_process(true)

func countHeight() -> int:
	var max = 0
	for vector in curve.get_baked_points():
		if vector.y < max:
			max = vector.y
	return max
