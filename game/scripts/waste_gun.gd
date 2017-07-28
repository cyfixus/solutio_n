extends KinematicBody2D

onready var particles = get_node("waste/particles")
onready var waste = get_node("waste")

var emitting = false

func _ready():
	pass
func emit():
	particles.set_emitting(false)
	waste.set_monitorable(false)
	emitting = false
func demit():
	particles.set_emitting(true)
	waste.set_monitorable(true)
	emitting = true
