extends KinematicBody2D

onready var camera = get_node("Camera2D")
onready var waste_gun = get_node("waste_gun")
onready var ray = get_node("ray")
onready var sprite = get_node("sprite")

export var MOTION_SPEED = 140
var emitting = false
var anim = ""
var animNew = ""

func _ready():
	add_to_group("player")
	set_process(true)
	set_process_input(true)
	
func _input(event):
	if event.is_action_pressed("shoot"):
		if emitting:
			emitting = false
			waste_gun.emit()
		elif !emitting:
			emitting = true
			waste_gun.demit()
		
	
func _process(delta):
	var motion = Vector2()
	
	if Input.is_action_pressed("ui_down"):
		motion += Vector2(0, 1)
		ray.set_rotd(0)
		waste_gun.set_rotd(0)
		waste_gun.set_z(0)
		anim = "walk_down"

	if Input.is_action_pressed("ui_up"):
		motion += Vector2(0, -1)
		ray.set_rotd(180)
		waste_gun.set_rotd(180)
		waste_gun.set_z(-1)
		anim = "walk_up"
		
	if Input.is_action_pressed("ui_left"):
		motion += Vector2(-1, 0)
		ray.set_rotd(-90)
		waste_gun.set_rotd(-90)
		waste_gun.set_z(-1)
		anim = "walk_left"
		
	if Input.is_action_pressed("ui_right"):
		motion += Vector2(1, 0)
		ray.set_rotd(90)
		waste_gun.set_rotd(90)
		waste_gun.set_z(-1)
		anim = "walk_right"
		

		
	if (Input.is_action_pressed("ui_up") && Input.is_action_pressed("ui_right")) || Input.is_action_pressed("ur"):
		motion += Vector2(1, -1)
		ray.set_rotd(135)
		waste_gun.set_rotd(135)
		
	if (Input.is_action_pressed("ui_up") && Input.is_action_pressed("ui_left")) || Input.is_action_pressed("ul"):
		motion += Vector2(-1, -1)
		ray.set_rotd(-135)
		waste_gun.set_rotd(-135)
		
	if (Input.is_action_pressed("ui_down") && Input.is_action_pressed("ui_right")) || Input.is_action_pressed("dr"):
		motion += Vector2(1, 1)
		ray.set_rotd(45)
		waste_gun.set_rotd(45)
		
	if (Input.is_action_pressed("ui_down") && Input.is_action_pressed("ui_left")) || Input.is_action_pressed("dl"):
		motion += Vector2(-1, 1)
		ray.set_rotd(-45)
		waste_gun.set_rotd(-45)
		
	motion = motion.normalized()*MOTION_SPEED*delta
	move(motion)
	
	if (motion.length() < 0.9):
		if ray.get_rotd()==0:
			anim = "idle_down"
		if ray.get_rotd()==180:
			anim = "idle_up"
		if ray.get_rotd()==-90:
			anim = "idle_left"
		if ray.get_rotd()==90:
			anim = "idle_right"
	
	if anim != animNew:
		animNew = anim
		sprite.play(anim)