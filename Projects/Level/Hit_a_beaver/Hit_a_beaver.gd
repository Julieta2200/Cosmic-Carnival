extends Node2D

@export var count : int
@export var appear_time : float
@export var probability : float

@onready var beavers = $Beavers
@onready var bombs = $Bombs
@onready var hammer = $Hammer
var time = 0
var enemy

func _ready():
	$Appear_timer.start()

func enemy_appear():
	var rand = randf()
	if rand > (probability / 100):
		enemy_show(beavers)
	else:
		enemy_show(bombs)
	
func enemy_show(enemies):
	var enemy_index = randi_range(0, enemies.get_child_count() - 1)
	enemy = enemies.get_child(enemy_index)
	enemy.show()
	
func _on_enemy_hidden():
	$Appear_timer.start()

func _physics_process(delta):
	if Input.is_action_just_pressed("space"):
		hit()
		
func hit():
	if hammer.on_enemy:
		if hammer.position.x > enemy.position.x:
			hammer.animation.play("hit_left")
		else:
			hammer.animation.play("hit_right")
		if $Beavers.get_children().has(enemy):
			enemy.hide()
			$CanvasLayer/hit_a_beaver_ui.get_score(1)
		elif enemy is Bomb:
			enemy.hide()
			$CanvasLayer/hit_a_beaver_ui.get_score(-1)
		hammer.on_enemy = false
	else:
		hammer.animation.play("hit_right")

func _on_appear_timer_timeout():
	$Appear_timer.wait_time = appear_time
	if count > 0:
		enemy_appear()
		count -= 1
