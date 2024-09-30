extends CharacterBody2D


@export var speed : int 

func _physics_process(_delta):
	move()
	
func move():
	var direction = Input.get_vector("left", "right", "up", "down").normalized()
	velocity = direction * speed
	move_and_slide()
	animation()

func animation()-> void:
	if velocity == Vector2.ZERO:
		$AnimatedSprite2D.play("idle")
		return
	if (velocity).y < 0:
		$AnimatedSprite2D.play("back_walk")
	else:
		$AnimatedSprite2D.play("walk")

