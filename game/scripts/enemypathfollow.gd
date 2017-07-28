extends PathFollow2D

var speed = 100

func _ready():
	set_fixed_process(true)
	pass
	
func _fixed_process(delta):
	set_offset(get_offset() + delta * speed)
