extends Node2D

onready var sprite = get_node("Sprite")
onready var anim = get_node("anim")
onready var decay_timer = get_node("decay")

func _ready():

	pass

func add_waste():
	sprite.set_modulate("00ffff")

func remove_waste():
	sprite.set_modulate("ffffff")
	
func _on_wall_area_enter( area ):
	if area.get_groups().has("waste"):
		add_waste()
		decay_timer.start()

func _on_decay_timeout():
	anim.play("decay")


func _on_anim_finished():
	remove_waste()
