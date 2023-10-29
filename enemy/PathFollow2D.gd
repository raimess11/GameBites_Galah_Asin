extends PathFollow2D

var target_player
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func target(player: Player):
	var playerPositionX = player.position.x + get_parent().curve.get_baked_length()/2
	var ppxPercent = playerPositionX / get_parent().curve.get_baked_length()
	return clamp(ppxPercent, 0, 1)
	
	
func _physics_process(delta):
	target_player = target(get_parent().player)
	progress_ratio = move_toward(progress_ratio, target_player, get_parent().speed)
