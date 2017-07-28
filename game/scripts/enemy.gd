extends KinematicBody2D
var speed = 20
var curve = Curve2D.new()
var new_pos = Vector2()

onready var path = get_node("path")
onready var path_follow = get_node("path/pathfollow")
onready var emit_control = get_node("emit_control")
onready var path_clear = get_node("path_clear")

func _ready():
	add_to_group("roach")
	curve.clear_points()
	curve.add_point(Vector2(144,80))
	path.set_curve(curve)
	set_fixed_process(true)
	pass
	
func _fixed_process(delta):
	var n_offset = path_follow.get_offset() + (delta * speed)
	path_follow.set_offset( n_offset )
	move_to(path_follow.get_pos())
	if path_follow.get_unit_offset() >= 1:
		set_fixed_process(false)
		move_to(curve.get_point_pos(curve.get_point_count()-1))
		curve.add_point(get_global_pos())
	pass

func add_point(pos):
	if !emit_control.is_processing():
		set_fixed_process(true)
		curve.add_point(pos)
		emit_control.start()
		sfx_player.play("waste")
	
func _on_floor_ground_pos(pos):
	add_point(pos)


func _on_walls_wall_pos(pos):
	add_point(pos)


func _on_path_clear_timeout():
	var new_start = get_global_pos()
	curve.clear_points()
	curve.add_point(new_start)

