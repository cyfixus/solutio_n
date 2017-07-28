extends Node2D

func _ready():
	set_process_input(true)
	pass

func _input(event):
	if event.is_action_pressed("reset"):
		global.new_game()


func _on_play_btn_pressed():
	global.new_game()
