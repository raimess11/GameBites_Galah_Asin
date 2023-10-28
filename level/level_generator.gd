extends Node2D

var borders = Rect2(Vector2.ZERO, DisplayServer.screen_get_size() - Vector2.LEFT)

@onready var tilemap = $TileMap

func _ready():
	randomize()
	generate_level()

func generate_level():
	var walker = Walker.new(Vector2(15,8), borders)
	var map = walker.walk(300)
	walker.queue_free()
	tilemap.set_cells_terrain_connect(0,map,0,0)

