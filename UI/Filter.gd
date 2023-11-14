extends CanvasLayer

func set_stick(frame):
	$Arcade/AnimatedSprite2D.frame = frame
	
func get_stick_frame(input:Vector2):
	if (input.x > -input.y && input.x < input.y && -input.y < 0):
		return 1
	elif (input.x < -input.y && input.x > input.y && -input.y > 0):
		return 2
	elif input.x < 0 :
		return 3
	elif input.x > 0 :
		return 4
	else:
		return 0
