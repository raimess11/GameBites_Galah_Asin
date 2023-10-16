extends PathFollow2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var target = target(get_parent().player)
	progress_ratio = move_toward(progress_ratio, target, get_parent().speed)

func target(player: Player):
	var playerPositionX = player.position.x + 275
	var ppxPercent = playerPositionX / (275+275)
	return clamp(ppxPercent, 0, 1)
	
	
	