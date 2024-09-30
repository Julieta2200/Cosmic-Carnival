extends CharacterBody2D

@export var speed : int 
var direction : Vector2

func _physics_process(_delta):
	move()
	
func move():
	direction = Input.get_vector("left", "right", "up", "down").normalized()
	velocity = direction * speed
	move_and_slide()
	animation()

func animation()-> void:
	if direction == Vector2.ZERO:
		$AnimatedSprite2D.play("idle")
		return
	if (direction).y < 0:
		$AnimatedSprite2D.play("back_walk")
	else:
		$AnimatedSprite2D.play("walk")

