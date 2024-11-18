class_name Hammer extends Node2D

@export var speed : int
@export var type : String

var circles : Array
var screen_bounds

func _ready():
	screen_bounds = get_viewport_rect()

func _physics_process(_delta):
	move()
	if Input.is_action_just_pressed("space"):
		hit()

func move():
	var direction = Input.get_vector("left", "right", "up", "down").normalized()
	position += direction * speed
	if not screen_bounds.has_point(position):
		position.x = clamp(position.x, 0, screen_bounds.size.x)
		position.y = clamp(position.y, 0, screen_bounds.size.y)

func hit():
	circles = $"../Circles".get_children()
	for i in circles.size():
		if circles[i].active && circles[i].monster != null && !circles[i].monster.delete:
				var monster = circles[i].monster
				$"../CanvasLayer/ui".hammer = type
				match monster.type:
					"blue":
						$"../CanvasLayer/ui".score += 1
					"orange":
						$"../CanvasLayer/ui".score += 3
					"pink":
						$"../CanvasLayer/ui".score -= 1
				monster.dizzy_animation()
				animation()
				break

func animation():
	$AnimatedSprite2D.play("hit")
