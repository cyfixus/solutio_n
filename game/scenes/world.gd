extends Node2D

onready var hud = get_node("hud")
onready var game_timer = get_node("game_timer")
onready var doors = get_node("doors")
onready var solutio_n_anim = get_node("solutio_n_anim")

func _ready():
	set_process_input(true)
	set_fixed_process(true)
	game_timer.start()
	
func calcScore():
	global.score = global.life * game_timer.get_time_left()
	
func _fixed_process(delta):
	hud.update_life()
	calcScore()
	hud.update_score()
	if global.life <= 0: 
		end_game()
		

	
func _input(event):
	if event.is_action_pressed("doors"):
		if global.doors_closed:
			doors.open_doors()
		else:
			doors.close_doors()
	pass

func end_game():
	calcScore()
	global.goto_scene("res://game/scenes/game_over.tscn")

func _on_game_timer_timeout():
	end_game()


func _on_door_switch_body_enter( body ):
	if body.get_groups().has("player"):
		if global.doors_closed:
			doors.open_doors()
		else:
			doors.close_doors()


func _on_goal_body_enter( body ):
	if body.get_groups().has("roach"):
		global.roach_in = true


func _on_goal_body_exit( body ):
	if body.get_groups().has("roach"):
		global.roach_in = false


func _on_doors_doors_are_closed():
	if global.roach_in:
		solutio_n_anim.play("capture_roach")
		sfx_player.play("90")


func _on_solutio_n_anim_finished():
	queue_free()
	global.goto_scene("res://game/scenes/win.tscn")
