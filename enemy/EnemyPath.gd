extends Path2D

@export var player: Player
@export var speed = 0.01

@onready var PathFollow = $PathFollow2D

var max_height

# Called when the node enters the scene tree for the first time.
func _ready():
	max_height = countHeight()
	print(max_height)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player.position.x > max_height:
		PathFollow.set_physics_process(false)
	else:
		PathFollow.set_physics_process(true)

func countHeight() -> int:
	var max = 0
	for vector in curve.get_baked_points():
		if vector.x < max:
			max = vector.x
	return max
