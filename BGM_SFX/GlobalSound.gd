extends AudioStreamPlayer


func _ready():
	stream = load("res://BGM_SFX/BGM game nya.mp3")
	play()

func _physics_process(delta):
	pass
