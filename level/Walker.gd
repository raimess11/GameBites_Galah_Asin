extends Node
class_name Walker

const DIRECTIONS = [Vector2.UP, Vector2.DOWN, Vector2.LEFT, Vector2.RIGHT]

var position = Vector2.ZERO
var direction = Vector2.RIGHT
var border = Rect2()
var step_history = []
var step_since_return = 0
var main_path = []

func _init(starting_position, new_border):
	assert(new_border.has_point(starting_position))
	position = starting_position
	step_history.append(position)
	border = new_border
	main_path.append(position)

func walk(steps):
	create_room(position)
	for step in steps:
		if step_since_return >= 5:
			change_direction()
		if step():
			create_room(position, Vector2.ONE * 10)
			main_path.append(position)
		else:
			change_direction()
	return step_history

func get_main_path():
	return main_path

func step():
	var target_position = position + direction
	if border.has_point(target_position):
		step_since_return += 1
		position = target_position
		return true
	else:
		return false

func change_direction():
	create_room(position)
	step_since_return = 0
	var directions = DIRECTIONS.duplicate()
	directions.erase(directions)
	directions.shuffle()
	direction = directions.pop_front()
	while not border.has_point(position + direction):
		direction = directions.pop_front()

func create_room(position, dimention:Vector2 = Vector2(5,5)):
	var size = Vector2(randi() % int(dimention.x) + 1, randi() % int(dimention.y) + 1)
	var top_left_corner = (position - size/2).ceil()
	for y in size.y:
		for x in size.x:
			var new_step = top_left_corner + Vector2(x,y)
			if border.has_point(new_step):
				step_history.append(new_step)
