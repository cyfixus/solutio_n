extends Node2D

onready var score = get_node("score")

func _ready():
	score.set_text(str(global.score))
	set_process_input(true)
	get_node("anim").play("go_anim")
	pass

func _input(event):
	if event.is_action_pressed("reset"):
		global.new_game()


func _on_Button_pressed():
	global.new_game()
