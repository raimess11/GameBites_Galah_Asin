extends Path2D

@export var player: Player
@export var follow_barrier = 250
@export var vertical = false
@export var vertical_barrier = false

@onready var PathFollow = $PathFollow2D

@export var speed = 0.01
var max_height
var min_height
var max_width
var min_width

# Called when the node enters the scene tree for the first time.
func _ready():
	max_height = countMaxandMin()[0] + position.y
	min_height = countMaxandMin()[1] + position.y
	max_width = countMaxandMin()[2] + position.x
	min_width = countMaxandMin()[3] + position.x


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !vertical_barrier:
		if (player.position.y < (min_height - follow_barrier) or player.position.y > (max_height + follow_barrier)):
			PathFollow.set_physics_process(false)
		else:
			PathFollow.set_physics_process(true)
	else:
		if (player.position.x < (min_width - follow_barrier) or player.position.x > (max_width + follow_barrier)):
			PathFollow.set_physics_process(false)
		else:
			PathFollow.set_physics_process(true)
		

func countMaxandMin():
	var max_height = 0
	var min_height = 100000000
	var max_width = 0
	var min_width = 100000000
	for vector in curve.get_baked_points():
		max_height = [vector.y, max_height].max()
		min_height = [vector.y, min_height].min()
		max_width = [vector.x, max_width].max()
		min_width = [vector.x, min_width].min()
	return [max_height, min_height, max_width, min_width]
