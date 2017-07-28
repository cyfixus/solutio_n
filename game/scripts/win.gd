extends Node2D

onready var score = get_node("score")

func _ready():
	if global.score > 0:
		global.total_score = global.score * global.level
	score.set_text(str(global.total_score))
	set_process_input(true)
	pass

func _input(event):
	if event.is_action_pressed("reset"):
		global.next_level()


func _on_Button_pressed():
	global.next_level()
