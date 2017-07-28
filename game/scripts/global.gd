extends Node

var life = 100
var game_over = false
var score = 0
var level = 1
var paused = false
var current_scene = null
var new_scene = null
var doors_closed = true
var roach_in = false
var decay = 0.3
var total_score = 0

var game_path = "res://game/scenes/world.tscn"
var menu_path = "res://game/scenes/menu.tscn"

func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)
	
func goto_scene(path):
	var s = ResourceLoader.load(path)
	new_scene = s.instance()
	get_tree().get_root().add_child(new_scene)
	get_tree().set_current_scene(new_scene)
	current_scene.queue_free()
	current_scene = new_scene
	
func next_level():
	game_over = false
	score = 0
	level += 1
	life = 100
	decay = level -  decay
	goto_scene(game_path)
	
func new_game():
	game_over = false
	score = 0
	level = 1
	life = 100
	decay = 0.3
	goto_scene(game_path)
	
func menu():
	goto_scene(menu_path)