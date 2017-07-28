extends Node2D

signal ground_pos

func _ready():
	get_node("ground").connect("ground_pos", self, "emit_pos")
	for i in range(1, 440):
		get_node("ground%s" %i).connect("ground_pos", self, "emit_pos")
	
	
	
func emit_pos(pos):
	emit_signal("ground_pos", pos)
