extends Node2D

@export var speed : int

func move():
	var direction = Input.get_vector("left", "right", "up", "down").normalized()
	position += direction * speed

func _physics_process(_delta):
	move()
