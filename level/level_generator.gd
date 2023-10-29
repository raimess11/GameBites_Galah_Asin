extends Node2D
var level = 1
var level_size = Vector2(level * 100, level*100)
var borders = Rect2(Vector2.ZERO, level_size)

@onready var tilemap = $TileMap

func _ready():
	randomize()
	generate_level()

func generate_level():
	print(borders)
	var walker = Walker.new(Vector2.ZERO, borders)
	var map = walker.walk(50*level)
	var path = walker.get_main_path()
	walker.queue_free()
	tilemap.set_cells_terrain_connect(0,map,0,0)
	

