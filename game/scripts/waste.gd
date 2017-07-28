extends Area2D

onready var particles = get_node("particles")

func rotate_particles(dir):
	particles.PARAM_DIRECTION = dir
func _ready():
	add_to_group("waste")

