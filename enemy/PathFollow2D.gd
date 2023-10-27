extends PathFollow2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var target = target(get_parent().player)
	progress_ratio = move_toward(progress_ratio, target, get_parent().speed)

func target(player: Player):
	var playerPosition
	var ppPercent
	var long
	if get_parent().vertical:
		long = get_parent().min_height - get_parent().max_height
		playerPosition = player.position.y + abs(get_parent().max_height)
		ppPercent = playerPosition / long
	else:
		long = get_parent().max_width - get_parent().min_width
		playerPosition = player.position.x - abs(get_parent().min_width)
		ppPercent = playerPosition / long
	return clamp(ppPercent, 0, 1)
	
	
	
