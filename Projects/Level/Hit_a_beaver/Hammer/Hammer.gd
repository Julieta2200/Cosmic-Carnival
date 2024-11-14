extends Node2D

@export var speed : int

var screen_bounds

func _ready():
	screen_bounds = get_viewport_rect()

func move():
	var direction = Input.get_vector("left", "right", "up", "down").normalized()
	position += direction * speed
	if not screen_bounds.has_point(position):
		position.x = clamp(position.x, 0, screen_bounds.size.x)
		position.y = clamp(position.y, 0, screen_bounds.size.y)

func _physics_process(_delta):
	move()

func animation():
	$AnimatedSprite2D.play("hit")
