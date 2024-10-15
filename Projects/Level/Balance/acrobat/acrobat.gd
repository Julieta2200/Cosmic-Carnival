class_name Acrobat extends Node2D

@export var rotation_speed: float
@export var move_speed: int
@export var move_multiplier: int
@export var gravitation_speed: float
var steps_number: int :
	set(s):
		steps_number = s
		$"../steps_number".text = str(steps_number)

func _physics_process(delta):
	gravitation()
	
func gravitation():
	var total_rotation: float
	if rotation_degrees > 0:
		total_rotation = (rotation_degrees/100) + gravitation_speed 
	else:
		total_rotation = (rotation_degrees/100) - gravitation_speed 
	
	if Input.is_action_pressed("A"):
		add_steps_number()
		total_rotation *= move_multiplier

	if Input.is_action_pressed("left"):
		total_rotation -= rotation_speed 
	elif Input.is_action_pressed("right"):
		total_rotation += rotation_speed

	rotation_degrees += total_rotation
	

func add_steps_number():
	if Input.is_action_just_pressed("A"):
		steps_number += 1
