extends Node2D

@export var count : float
@export var exit_time : float
@export var stay_time : float
@export var probability : float
@export var hammer_speed : int 

@onready var hammer = $Hammer

func hammer_move():
	var direction = Input.get_vector("left", "right", "up", "down").normalized()
	hammer.global_position += direction * hammer_speed
	if Input.is_action_just_pressed("space"):
		print("space")

func _process(_delta):
	hammer_move()
