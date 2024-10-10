class_name Acrobat extends Node2D

@export var rotation_speed: float
@export var move_speed: int
@export var move_multiplier: int
@export var gravitation_speed: float
var distance_traveled = 0

func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	var total_rotation: float

	if rotation_degrees >= 0 && rotation_degrees < 90:
		if rotation_degrees < 30:
			total_rotation += gravitation_speed
		else:
			total_rotation += 2 * gravitation_speed
	elif rotation_degrees < 0 && rotation_degrees > -90:
		if rotation_degrees > -30:
			total_rotation -= gravitation_speed
		else:
			total_rotation -= 2 * gravitation_speed
	else:
		total_rotation -= 0

	if Input.is_action_pressed("A"):
		distance_traveled += 10
		total_rotation *= move_multiplier

	if Input.is_action_pressed("left"):
		total_rotation -= rotation_speed
	elif Input.is_action_pressed("right"):
		total_rotation += rotation_speed


	rotation_degrees += total_rotation
