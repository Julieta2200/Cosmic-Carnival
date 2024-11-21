class_name Hammer extends Node2D

@export var speed : int
@export var score : Control
@export var player_number : String

@onready var animated_sprite : Dictionary = {"1": $Hammer_1_animated_sprite, "2": $Hammer_2_animated_sprite}

var score_num: int :
	set(s):
		score_num = s
		if score_num < 0:
			score_num += 1
		elif score_num < 1000 :
			%ui.set_number(score,score_num)

var screen_bounds : Rect2
var circle : Node2D

func _ready():
	animated_sprite[player_number].visible = true
	screen_bounds = get_viewport_rect()

func _physics_process(_delta):
	move()
	if Input.is_action_just_pressed("player_"+ player_number + "_hit"):
		hit()

func move():
	var direction = Input.get_vector("player_"+ player_number + "_left", "player_"+ player_number + "_right", "player_"+ player_number + "_up", "player_"+ player_number + "_down").normalized()
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
	animated_sprite[player_number].play("hit")
