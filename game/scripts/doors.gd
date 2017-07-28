extends Node2D

onready var door = get_node("door")
onready var door_collision = get_node("door/collision")
onready var door1 = get_node("door1")
onready var door1_collision = get_node("door1/collision")

signal doors_are_closed

func _ready():
	add_to_group("doors")
	pass

func close_doors():
	door_collision.set_trigger(false)
	door1_collision.set_trigger(false)
	
	door.show()
	door1.show()
	global.doors_closed = true
	emit_signal("doors_are_closed")
	
func open_doors():
	door_collision.set_trigger(true)
	door1_collision.set_trigger(true)
	
	door.hide()
	door1.hide()
	global.doors_closed = false