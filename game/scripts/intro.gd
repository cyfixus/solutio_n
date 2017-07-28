extends Node2D

onready var slide_show = get_node("slide_show")
onready var slide_timer = get_node("slide_timer")

func _ready():
	set_process_input(true)
	set_process(true)
	music.play()
	pass

func _input(event):
	if event.is_action_pressed("reset"):
		global.menu()

func _on_Button_pressed():
	global.menu()

func process_slide():
	slide_show.stop()
	var slide = slide_show.get_frame()
	if !slide_timer.is_processing():
		slide_timer.start()
	else:
		if slide >= 43:
			global.menu()
		slide_show.set_frame(slide + 1)
	
func _on_next_pressed():
	process_slide()

func _on_slide_show_finished():
	global.menu()

func _process(delta):
	var frame = slide_show.get_frame()
	if (frame > 0 && frame < 8) || (frame > 11 && frame < 43):
		slide_show.play("intro_control")
	else:
		slide_show.stop()

func _on_arrow_pressed():
	process_slide()
