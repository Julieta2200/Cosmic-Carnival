class_name Acrobat extends Node2D

@export var rotation_speed: float
@export var move_speed: int
@export var move_multiplier: int
@export var gravitation_speed: float

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var total_rotation: float
	
	if rotation_degrees > 0:
		total_rotation += gravitation_speed
	else:
		total_rotation -= gravitation_speed
	
	if Input.is_action_pressed("A"):
		total_rotation *= move_multiplier
		
	if Input.is_action_pressed("left"):
		total_rotation -= rotation_speed
	elif Input.is_action_pressed("right"):
		total_rotation += rotation_speed
	
	
	
	rotation_degrees += total_rotation
