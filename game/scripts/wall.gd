extends Area2D

onready var anim = get_node("anim")
onready var decay_timer = get_node("decay")

signal wall_pos

func _ready():
	add_to_group("wall")
	pass

func add_waste():
	anim.play("infect")
	global.life -= global.decay
	decay_timer.start()
	emit_signal("wall_pos", get_pos())

func remove_waste():
	anim.play("decay")
	global.life += 0.03

func _on_decay_timeout():
	remove_waste()


func _on_wall_area_enter( area ):
	if !decay_timer.is_processing():
		if area.get_groups().has("waste"):
			add_waste()
