extends CharacterBody2D


@export var speed : int

func _physics_process(_delta):
	move()
	
func move():
	var direction = Input.get_vector("left", "right", "up", "down").normalized()
	velocity = direction * speed
	move_and_slide()
