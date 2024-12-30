class_name Hammer extends Node2D

@export var speed : int
@export var score : Control
@export var controller : Controller

@onready var animated_sprite : Dictionary = {"1": $Hammer_1_animated_sprite, "2": $Hammer_2_animated_sprite,
											"3": $Hammer_3_animated_sprite, "4": $Hammer_4_animated_sprite}

var colors = {"1" : Color(0.965,0.6,0.533), "2" : Color(0.447,0.835,0.447),"3" : Color(0.686,0.749,1),"4" : Color(1,0.878,0.51) }
var can_click = false
var score_num: int :
	set(s):
		score_num = s
		if score_num < 0:
			score_num += 1
		elif score_num < 1000 :
			$"../%Ui".set_number(score,score_num)

var screen_bounds : Rect2
var circle : Node2D

func _ready():
	animated_sprite[controller.player_number].visible = true
	screen_bounds = get_viewport_rect()
	controller.hammer = self
	

func _physics_process(_delta):
	move()

func _process(_delta):
	if controller.hit:
		hit_monster()

func move():
	var direction = Vector2.ZERO
	if controller.left:
		direction += Vector2(-1,0).normalized()
	if controller.right:
		direction += Vector2(1,0).normalized()
	if controller.up:
		direction += Vector2(0,-1).normalized()
	if controller.down:
		direction += Vector2(0,1).normalized()
	position += direction * speed
	if not screen_bounds.has_point(position):
		position.x = clamp(position.x, 0, screen_bounds.size.x)
		position.y = clamp(position.y, 0, screen_bounds.size.y)

func hit_monster():
	if circle != null:
		var monster = circle.monster
		if monster != null && !monster.delete:
			score_num += monster.score
			monster.dizzy_animation()
			monster.disapear_color = colors[controller.player_number]
			animation()

func _on_area_2d_area_entered(area):
	if area.get_parent() is Circle:
		circle = area.get_parent()

func _on_area_2d_area_exited(area):
	if area.get_parent() is Circle:
		circle = null

func animation():
	animated_sprite[controller.player_number].play("hit")
