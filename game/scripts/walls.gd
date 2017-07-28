extends Node2D

signal wall_pos

func _ready():
	get_node("wall").connect("wall_pos", self, "emit_pos")
	for i in range(1, 114):
		get_node("wall%s" %i).connect("wall_pos", self, "emit_pos")
	
	
	
func emit_pos(pos):
	emit_signal("wall_pos", pos)
