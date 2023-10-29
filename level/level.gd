extends Node2D

var level = 1
var level_size = Vector2(level * 500, level*500)
var borders = Rect2(Vector2.ZERO, level_size)

var start_point
var finish_point
var path = []
@onready var tilemap = $TileMap

@onready var EnemyPath = preload("res://enemy/enemy_path.tscn")

func _ready():
	randomize()
	generate_level()
	get_tree().paused = false;
	generate_enemy(path)
	generate_enemy(path)
	for child in get_children():
		if child.is_in_group("Enemy"):
			child.player = $Player
			

func _physics_process(delta):
	if $Player.collision && $Player.collision.get_collider().is_in_group("enemy"):
		$CanvasLayer/Lose.visible = true
		get_tree().paused = true


func _on_finish_body_entered(body):
	if body.name == "Player":
		$CanvasLayer/Win.visible = true
		get_tree().paused = true

func generate_level():
	print(borders)
	var walker = Walker.new(Vector2.ZERO, borders)
	var map = walker.walk(50*level)
	path = walker.get_main_path()
	walker.queue_free()
	tilemap.set_cells_terrain_connect(0,map,0,0)


func generate_enemy(main_path):
	randomize()
	var seleced_point = path.pick_random()
	var enemy_path:Path2D = EnemyPath.instantiate()
	enemy_path.position = seleced_point * 32 
	enemy_path.player = $Player
	add_child(enemy_path)
