class_name Hammer extends Node2D

@export var speed : int
@export var score : Control

var score_num: int :
	set(s):
		score_num = s
		if score_num < 0:
			score_num += 1
		elif score_num < 1000 :
			%ui.set_number(score.get_child(2),score.get_child(1),score.get_child(0),score_num)

var circle
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
	if circle != null:
		var monster = circle.monster
		if monster != null && !monster.delete:
			score_num += monster.score
			monster.dizzy_animation()
			animation()

func _on_area_2d_area_entered(area):
	if area.get_parent() is Circle:
		circle = area.get_parent()

func _on_area_2d_area_exited(area):
	if area.get_parent() is Circle:
		circle = null

func animation():
	$AnimatedSprite2D.play("hit")
